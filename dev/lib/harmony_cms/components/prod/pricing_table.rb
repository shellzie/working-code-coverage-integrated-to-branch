module HarmonyCms
  module Components
    module Prod
      class PricingTable < ShowroomCms::PricingComponent

        def init_child_components
          (0..5).each do |index|
            if properties.has_key?("pricing_table_cta#{index}")
              #properties["pricing_table_cta#{index}"]["sling:resourceType"] = "intuit/cmt/components/cta"
              component_name = "pricing_table_cta#{index}"
              add_and_init_child_component(component_name)
            end
            if properties.has_key?("pricing_table_cta#{index}_annual")
              #properties["pricing_table_cta#{index}"]["sling:resourceType"] = "intuit/cmt/components/cta"
              component_name = "pricing_table_cta#{index}_annual"
              add_and_init_child_component(component_name)
            end
          end
          add_and_init_child_component("pricing_table_tabs") if include_tabs == "true"
          add_and_init_child_component("pricing_table_badge_text")
        end

        def pricing_table_data
          page_data_with_key("pricing_table", "").force_encoding("UTF-8").html_safe
        end

        def include_tabs
          page_data_with_key("include_tabs","false")
        end

        def aria_desc
          if (include_tabs)
            " aria-describedby='ctabs_1' "
          else
            ""
          end
        end

        def section_title
          page_data_with_key("section_title", "Pricing").force_encoding("UTF-8").html_safe
        end

        def price_cents(col="col_1")
          my_col = "#{col}_price"
          my_price = page_data_with_key(my_col,"1.11").force_encoding("UTF-8").html_safe
          format_price_cents(my_price.to_s)
        end

        def price_dollars(col="col_1")
          my_col = "#{col}_price"
          my_price = page_data_with_key(my_col,"1.11").force_encoding("UTF-8").html_safe
          format_price_dollars(my_price.to_s)
        end

        def is_3_col_table?
          if page_data_with_key("col_4_price","0").eql?("0")
            true
          else
            false
          end
        end

        def last_cell_for_3_col_table
          if is_3_col_table?
            "last-cell"
          else
            ""
          end
        end

        def is_2_col_table?
          if page_data_with_key("col_3_price","0").eql?("0")
            true
          else
            false
          end
        end

        def last_cell_for_2_col_table
          if is_2_col_table?
            "last-cell"
          else
            ""
          end
        end

        def headers_for_2_col_table (col=1)
          col -= 1
          header = ['Annual','Monthly']
          header[col]
        end

        def users_text (col=1)
          col -= 1
          users_txt = ["User","Users","Users","Users","Users"]
          users_txt[col]
        end

        def per_mo_year_text (col=1)
          col -= 1
          per_mo_year_txt = ["/year","/month","","",""]
          per_mo_year_txt[col]
        end



        def format_price_dollars(price='')
          price.gsub(/\.\d*/,'')
        end

        def format_price_cents(price='')
          return '00' if price.index('.').nil?
          price.gsub(/\d*\./,'').gsub(/\./,'')
        end

        def currency_symbol
          page_data_with_key('currency_sign', '$')
        end

        def dynamic_price(key)
          return nil if key.nil?
          output = super
          if output.nil?
            price = price_dollars(key) << '.' << price_cents(key) if output.nil?
            output = {
                'regPrice' => price,
                'salePrice' => price,
                'currency' => currency_symbol,
                'separator' => '.',
                'discount' => nil
            }
          end
          output['strike_through_text'] = page_data_with_key('strikethrough_price_text', '')
          output
        end

      end
    end
  end
end
