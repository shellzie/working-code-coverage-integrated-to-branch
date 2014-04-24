require 'harmony_cms/components/core/text'
require 'showroom_cms/image_source'

module HarmonyCms::Components::Core
    class Textimage < HarmonyCms::Components::Core::Text

      attr_reader :image

      def init
        begin
          @image = ensure_child_component_with_name("image")
          @image.init
        rescue
          Rails.logger.debug "Image node does not exist in the textimage component with name #{name}"
        end
      end

      def text_class
        page_data_with_key("text_class", "ctext")
      end

      def text_wrap
        page_data_with_key("text_wrap", "no_wrap")
      end

      def image_css_class
        css_class = page_data_with_key("image_align", "left")
        "img-#{css_class}"
      end

      def image_class
        design_data_with_key("image_class", "")
      end

      def image_align
        page_data_with_key("image_align", "left")
      end

      def css_class
        css = ["ctextimage"]
        if "wrap" == text_wrap
          css << "clearfix"
        else
          css << "nowrap"
        end
        css.join(" ")
      end

      def render
        page.view.render(partial, {:component => self})
      end

      def image_src
        image.src unless image.nil?
      end

      #overriding this because it also depends on image. i.e someone can change image without changing the image name.
      def cache_key
        unless image_src.nil?
          @ck ||= Digest::MD5.hexdigest(image_src + super)
        else
          @ck ||= super
        end        
      end

  end
end