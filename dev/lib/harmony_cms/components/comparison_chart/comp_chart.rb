module HarmonyCms
  module Components
    module ComparisonChart
      class CompChart < ShowroomCms::Component

        def init

          init_child_components
        end

        def init_child_components

          add_and_init_child_component_if_exists('cq-comp-chart-text-header')
          add_and_init_child_component_if_exists('cq-comp-chart-header-container')
        end

        #
        #
        # determines standard column size: large or small
        def column_size
          page_data_with_key('column_size', 'large')
        end

        # control for enabling the sticky header
        def is_enable_sticky_header
          (page_data_with_key('is_enabled_sticky_header', false) == "true" ? 'class="persist-header"' : "").html_safe
        end

        # comparison table data
        def table_data
          page_data_with_key('tableData', '').html_safe
        end

      end
    end
  end
end