require 'harmony_cms/config'

module HarmonyCms
  class Engine < ::Rails::Engine
    isolate_namespace HarmonyCms

    initializer 'harmony_cms.geo_ip' do

     # GEO_IP file & lookup
    HarmonyCms::GEO_IP_CONFIG  = "#{Rails.root}/config/geo_ip_redirect.yml"
    HarmonyCms::GEO_IP_LOOKUP  = File.exists?(HarmonyCms::GEO_IP_CONFIG) ?  YAML.load_file(HarmonyCms::GEO_IP_CONFIG) : nil

    end

    initializer 'harmony_com_cms.init_harmony_com_cms_config', :after => 'showroom_cms.init_showroom_cms_config' do |app|

      puts "Initializing harmony_cms"

      ShowroomCms.cq_template_path_map.merge!({
        "harmony/components/" => "harmony_cms/components",
        "/apps/harmony/components/" => "harmony_cms/components"
      })

      ShowroomCms.cq_component_path_map.merge!({
          "harmony/components/" => "harmony_cms/components",
          "/apps/harmony/components/" => "harmony_cms/components"
      })

    end

    initializer 'harmony_cms:add_fonts_for_assets_precompile' do |app|
      app.config.assets.paths << Rails.root.join('lib', 'assets', 'fonts')
      app.config.assets.precompile += %w( .svg .eot .woff .ttf )
      app.config.assets.precompile += [ Proc.new{ |path| File.dirname(path) =~ /merged/ }]

      #Env specific configuration for showroom_plugin variables
      engine_yaml_config = File.expand_path("../../../config/harmony_cms.yml", __FILE__)
      app_yaml_config = "#{Rails.root}/config/harmony_cms.yml"
      apply_config(engine_yaml_config)
      apply_config(app_yaml_config)

    end

    def apply_config(yaml_config_file)
      if File.exists?(yaml_config_file)
        config = YAML.load_file(yaml_config_file)[Rails.env]
        unless config.nil?
          config.each do |k, v|
            #Assuming that the values are not complex objects like Hash for now.
            if (HarmonyCms.respond_to?(k))
              HarmonyCms.send("#{k}=", v)
            end
          end
        end
      end
    end

  end
end
