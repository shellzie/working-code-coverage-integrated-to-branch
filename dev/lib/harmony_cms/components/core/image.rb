require 'showroom_cms/image_source'

module HarmonyCms

  module Components::Core

    class Image < ShowroomCms::Component

      attr_accessor :src, :horizontal_align, :vertical_align, :link_url, :alt, :css_class, :lazy_load, :img_class, :img_align, :data_wa_link, :data_wa_event

      def init
        image_src = ShowroomCms::ImageSource.new(ensure_page_data_with_key("fileReference"))
        @src ||= image_src.src
      end

      def length
        image_src.length
      end

      def width
        image_src.width
      end

      def horizontal_align
        @horizontal_align ||= page_data_with_key("horizontal_align", "left")
      end

      def vertical_align
        @vertical_align ||= page_data_with_key("vertical_align")
      end

      def link_url
        @link_url ||= _get_link_url || page_data_with_key('linkURL') 
      end

      def link_mode
        @link_mode ||= page_data_with_key('link_mode')
      end

      def data_wa_link
        @data_wa_link ||= page_data_with_key("data_wa_link")
      end

      def data_wa_event
        @data_wa_event ||= page_data_with_key("data_wa_event")
      end

      def link_options
        result = {}
        # site catalyst
        result.merge! site_catalyst_attr

        # modal
        modal = {'class' => 'modal'} unless !link_mode.eql? 'modal'
        result.merge! modal unless modal.nil?

        result
      end

      def site_catalyst_attr
        my_hash = {}
        if !data_wa_link.nil?
          link_hash = {"data-wa-link" => data_wa_link}
          my_hash.merge! link_hash
        end

        if !data_wa_event.nil?
          event_hash = {"data-wa-event" => data_wa_event}
          my_hash.merge! event_hash
        end

        return my_hash
      end

      def alt
        @alt ||= page_data_with_key("alt", "")
      end

      def css_class
        css = []
        css << "img-#{horizontal_align}"
        css << " img-#{vertical_align}" unless vertical_align.nil?
        @css_class ||= css.join(" ")
      end

      def lazy_load
        @lazy_load ||= page_data_with_key('lazy_load', false)
      end

      def img_align
        @img_align ||= page_data_with_key('align', 'center')
      end

      def img_class
        img_class = []
        img_class.push('lazy') unless !lazy_load
        img_class.push(img_align)
        @img_class ||= img_class.join(' ')
      end

      #overriding this because it also depends on image. i.e someone can change image without changing the image name.
      def cache_key
        @ck ||= Digest::MD5.hexdigest(@src + super)
      end

      protected

      def _get_link_url
        unless link_mode.nil?
          if link_mode.eql?('page')
            page_data_with_key('external_url')
          elsif link_mode.eql?('modal')
            page.url_from_cq_page_path(page_data_with_key('modal_content_path')) unless page_data_with_key('modal_content_path').empty?
          end
        end
      end

    end

  end

end
