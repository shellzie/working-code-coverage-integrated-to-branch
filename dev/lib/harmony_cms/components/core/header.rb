module HarmonyCms

  module Components

    module Core

      class Header < ShowroomCms::Component

        def init_child_components
          add_and_init_child_components(%w(cq-more-from-intuit cq-top-header cq-nav))
          add_and_init_child_component_if_exists('cq-aem-top-header')
        end

        def is_top_header_aem_enabled
          page_data_with_key("is_top_header_aem_enabled", false)
        end

      end

    end

  end

end
