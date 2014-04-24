module HarmonyCms
  module Components::Core
    class Text < ShowroomCms::PricingComponent

      def cacheable
        !is_dynamic
      end

      def text_data
        page_data_with_key('text', '').force_encoding('UTF-8').html_safe
      end

      def text_is_rich
        page_data_with_key('textIsRich', false)
      end

      def text_class
        page_data_with_key('top_padding_off', '') == 'true' ? 'ctext-top-padding' : 'ctext'
      end
	  
	    def hide_component
        page_data_with_key('hide_component', '')
      end

    end
  end
end
