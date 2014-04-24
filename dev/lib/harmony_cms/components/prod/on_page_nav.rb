module HarmonyCms::Components::Prod
  class OnPageNav < ShowroomCms::Component

    attr_reader :nav_map, :sc_map

    def init
      @nav_map = {
          'Overview' =>'overview' ,
          'Features' => 'features',
          'Pricing' => 'pricing',
          'Tech Specs' => 'techSpecs'
      }
      _site_catalyst_map
      init_child_components
    end

    def init_child_components
      add_and_init_child_component('cta') if properties.has_key?('cta')
    end

    def heading
      page_data_with_key('heading', '')
    end

    def nav
      page_data_with_key('nav')
    end

    protected

    def _site_catalyst_map
      categories = {
          'overview' => 'Overview',
          'features' => 'Features',
          'tech_specs' => 'Tech Specs',
          'pricing' => 'Pricing'
      }
      types = ['sc_data_link', 'sc_data_event']

      @sc_map = {}

      categories.each do |category, key|
        types.each do |type|
          property = page_data_with_key('' << category << '_' << type, '')
          @sc_map[key] = {} if @sc_map[key].nil?
          @sc_map[key][type] = property.empty? ? '' : property
        end
      end
    end

  end
end