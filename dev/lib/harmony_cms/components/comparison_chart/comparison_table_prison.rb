module HarmonyCms::Components::ComparisonChart
    class ComparisonTablePrison < ShowroomCms::Component
        def init_child_components
			add_and_init_child_components_if_exists(%w(cq-text cq-feature-text cq-pricing-2 cq-pricing-3 cq-pricing-4 cq-pricing-5))
        end

        def h2
          page_data_with_key('h2', 'QuickBooks Online').force_encoding('UTF-8').html_safe
        end
		
        def table_data
          page_data_with_key('tableData', '').force_encoding('UTF-8').html_safe
        end
    end
end
