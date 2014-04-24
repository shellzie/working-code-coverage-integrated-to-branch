require 'showroom_cms/image_source'

module HarmonyCms

  module Components::Core

    class Container < ShowroomCms::Component

      attr_reader :image_url, :image_alt, :image_align, :lazy_load, :bg_color, :image_height, :image_width, :class_name, :id, :id_string, :content_container, :hide_desktop, :hide_tablet, :hide_mobile, :css_classes, :css_bg_classes, :resp_vport

      def init
        image_node = page_data_with_key("image")
        if !image_node.nil? && image_node.has_key?("fileReference")
          image_src =  ShowroomCms::ImageSource.new(image_node["fileReference"])
          @image_url = image_src.src
          @image_height = image_src.length.nil? ? 500 : image_src.length
          @image_width = image_src.width.nil? ? 0 : image_src.width
          @mar_left = @image_width.to_i/2
          @image_alt = image_node.has_key?("alt") ? image_node["alt"] : ""
          @image_align = image_node.has_key?("align") ? image_node["align"] : "center"
          @lazy_load = image_node.has_key?("lazy_load") ? image_node["lazy_load"] : ""
          @image_align = "" if @image_align == "left"
        end
        @resp_vport = self.page.content['enable_responsive_viewport'] ? "resp_img" : ""
        @bg_color = page_data_with_key("bg_color", "none")
        @bg_color = "" if @bg_color == "none"
        @class_name = page_data_with_key("class_name", "")
        @content_container = page_data_with_key("content_container", "")
        @id = page_data_with_key("id", "")
        @id_string = id != "" ? "id='"+@id+"'" : ""
        @hide_desktop = page_data_with_key("hide_desktop", "false") == "true" ? "hidden-lg hidden-md" : ""
        @hide_tablet = page_data_with_key("hide_tablet", "false") == "true" ? "hidden-sm" : ""
        @hide_mobile = page_data_with_key("hide_mobile", "false") == "true" ? "hidden-xs" : ""

        @css_classes =  ("ccontainer " + @class_name + " " + @hide_desktop + " " + @hide_tablet + " " + @hide_mobile + " " + @resp_vport).gsub(/\s+/, ' ')
        @css_bg_classes =  ("ccontainer " + @bg_color + " " + @class_name + " " + @hide_desktop + " " + @hide_tablet + " " + @hide_mobile + " ").gsub(/\s+/, ' ')

        init_child_components
      end

      def init_child_components
        add_and_init_child_component("container") unless page_data_with_key("container").nil?
      end

      #overriding this because it also depends on image. i.e someone can change image without changing the image name.
      def cache_key
        unless @image_url.nil?
          @ck ||= Digest::MD5.hexdigest(@image_url + super)
        else
          @ck ||= super
        end
      end

      def image_class
        if "true" == lazy_load
          "lazy #{image_align}"
        else
          image_align
        end
      end

      def data_wa_scroll_page_name
        name = page_data_with_key('scroll_page_name', '')
        /\w+/ === name ? 'data-wa-scroll-page-name="'.html_safe + name + '"'.html_safe : ''
      end

    end

  end

end
