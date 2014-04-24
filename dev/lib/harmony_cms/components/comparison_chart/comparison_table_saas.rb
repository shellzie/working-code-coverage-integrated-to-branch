module HarmonyCms
  module Components
    module ComparisonChart
      class ComparisonTableSaas < ShowroomCms::Component
        def init_child_components
          (1..4).each do |i|
            add_and_init_child_component_if_exists("box#{i}_cta")
          end
        end

        def h2
          page_data_with_key('h2', 'QuickBooks Online').force_encoding('UTF-8').html_safe
        end
        def hide_rows_starting_at
          page_data_with_key('hide_rows_starting_at', 14)
        end
        def price_cents(box="box1_price")
          my_price = page_data_with_key(box,"1.23").force_encoding("UTF-8").html_safe
          format_price_cents(my_price.to_s)
        end

        def price_whole(box="box1_price")
          my_price = page_data_with_key(box,"1.23").force_encoding("UTF-8").html_safe
          format_price_dollars(my_price.to_s)
        end
        def format_price_dollars(price="")
          price.gsub(/\.\d*/,'')
        end

        def format_price_cents(price="")
          price.gsub(/\d*\./,'').gsub(/\./,'')
        end
        def box1_price
          page_data_with_key('box1_price', '12.95')
        end
        def box2_price
          page_data_with_key('box2_price', '26.95')
        end
        def box3_price
          page_data_with_key('box3_price', '39.95')
        end
        def box1_title
          page_data_with_key('box1_title', 'Simple Start')
        end
        def box2_title
          page_data_with_key('box2_title', 'Essentials')
        end
        def box3_title
          page_data_with_key('box3_title', 'Plus')
        end
        def table_data
          page_data_with_key('tableData', '').force_encoding('UTF-8').html_safe
        end
        def currency_symbol
          page_data_with_key('currency_sign', '$')
        end

      end
    end
  end
end
