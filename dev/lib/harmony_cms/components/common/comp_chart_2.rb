module HarmonyCms
  module Components
    module Common
      class CompChart2 < ShowroomCms::Component

        def init

          init_child_components
        end

        def init_child_components

          add_and_init_child_component_if_exists('cq-comp-chart-text-header')
          add_and_init_child_component_if_exists('cq-comp-chart-header-container')
          add_and_init_child_component_if_exists('cq-text-top-content')
          add_and_init_child_component_if_exists('cq-cta-pricing-header')
          add_and_init_child_component_if_exists('cq-text-bot-content')
        end

        #
        #
        # determines standard column size: large is default, duh
        def column_size
          page_data_with_key('column_size', 'large')
        end

        # control for enabling the sticky header
        def is_enable_sticky_header
          (page_data_with_key('is_enabled_sticky_header', false) == "true" ? 'class="comp-chart-persist-header"' : "").html_safe
        end

        # comparison table data
        def table_data
          page_data_with_key('tableData', '').html_safe
        end

      end
    end
  end
end