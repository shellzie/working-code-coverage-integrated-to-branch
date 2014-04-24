module HarmonyCms
  module Components
    module Modal
      class DualPricingCard < HarmonyCms::Components::Modal::PricingCardComponent

        def init
          @monthly_price = page_data_with_key('monthly_price', '0.00')
          @annual_price = page_data_with_key('annual_price', '0.00')
          init_child_components
        end

        def optional_annual_superscript
          page_data_with_key('optional_annual_superscript', '')
        end

        def optional_monthly_superscript
          page_data_with_key('optional_monthly_superscript', '')
        end

        def init_child_components
          add_and_init_child_component_if_exists('cq-text1')
          add_and_init_child_component_if_exists('cq-cta1')
          add_and_init_child_component_if_exists('cq-text2')
          add_and_init_child_component_if_exists('cq-cta2')
          super
        end

        def get_price(key = 'annual')
          key == 'annual' ? @annual_price : @monthly_price
        end

        def dynamic_price(key)
          return nil if key.nil?

          display_as_monthly = page_data_with_key('display_as_monthly', 'false')
          optional_annual_text = page_data_with_key('optional_annual_text', '')
          price = get_price(key)

          output = super
          output = output.clone unless output.nil?
          output = {
              'regPrice' => price,
              'salePrice' => price,
              'currency' => '$',
              'separator' => '.',
              'discount' => nil
          } if output.nil?

          if ('true' == display_as_monthly && key == 'annual')
            salePrice = BigDecimal.new(output['salePrice'].to_s)
            regPrice = BigDecimal.new(output['regPrice'].to_s)
            output['display_price'] = sprintf('%.02f', salePrice == 0 ? 0 : salePrice/12)
            output['regPrice'] = sprintf('%.02f', regPrice == 0 ? 0 : regPrice/12)
          end

          output['extra_text'] = sprintf optional_annual_text, '%s' << output['salePrice'].to_s unless optional_annual_text.empty?

          output
        end
		
		def omniture_data_link
          page_data_with_key('omniture_data_link', '')
        end
		
      end
    end
  end
end
