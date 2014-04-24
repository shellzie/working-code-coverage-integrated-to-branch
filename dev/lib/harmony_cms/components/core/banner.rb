module HarmonyCms
  module Components::Core
    class Banner < ShowroomCms::Component

      def banner_text
        page_data_with_key('banner_text', 'This is the banner default text.').html_safe
      end

      def banner_text_bgcolor
        page_data_with_key('bg_color', '').html_safe
      end

      def init_child_components
        add_and_init_child_component_if_exists('banner_cta_a')
      end

    end
  end
end