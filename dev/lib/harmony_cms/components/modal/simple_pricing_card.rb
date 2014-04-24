module HarmonyCms
  module Components
    module Modal
      class SimplePricingCard < HarmonyCms::Components::Modal::PricingCardComponent
        attr_reader :per_period

        def init
          monthly_price = page_data_with_key('monthly_price', '')
          annual_price = page_data_with_key('annual_price', '')
          if !monthly_price.empty?
            @price = monthly_price
            @per_period = 'month'
          elsif !annual_price.empty?
            @price = annual_price
            @per_period = 'year'
          end
          init_child_components
        end

        def superscript_number
          page_data_with_key('superscript_number', '')
        end

        def init_child_components
          add_and_init_child_component_if_exists("cq-header")
          add_and_init_child_component_if_exists("cq-cta")
          super
        end

        def currency_symbol
          page_data_with_key('currency_sign', '$')
        end

        def dynamic_price
          output = super
          return output unless output.nil?
          return nil if @price.nil?
          {
              'regPrice' => @price,
              'salePrice' => @price,
              'currency' => currency_symbol,
              'separator' => '.',
              'discount' => nil
          }
        end
		
		def omniture_data_link
          page_data_with_key('omniture_data_link', '')
        end

      end
    end
  end
end
