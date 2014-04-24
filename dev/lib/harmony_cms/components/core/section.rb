module HarmonyCms
  module Components::Core
    class Section < ShowroomCms::Component

      def init_child_components
        add_and_init_child_component_if_exists('cq-headings1')
        add_and_init_child_component_if_exists('cq-container1')
      end

      def id_section
        page_data_with_key('id_section', '').force_encoding('UTF-8').html_safe
      end

      def is_header_disabled
        page_data_with_key('is_header_disabled', 'false')
      end

      def data_wa_scroll_page_name
        name = page_data_with_key('scroll_page_name', '')
        /\w+/ === name ? 'data-wa-scroll-page-name="'.html_safe + name + '"'.html_safe : ''
      end
    end
  end
end
