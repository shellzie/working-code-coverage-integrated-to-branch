module HarmonyCms
  module Components::Core
    class Table < ShowroomCms::PricingComponent

      #def cacheable
      #  true
      #end

      def table_data
        page_data_with_key('tableData', '').force_encoding('UTF-8').html_safe
      end

    end
  end
end
