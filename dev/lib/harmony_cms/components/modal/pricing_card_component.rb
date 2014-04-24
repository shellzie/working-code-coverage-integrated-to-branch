module HarmonyCms::Components::Modal
  class PricingCardComponent < ShowroomCms::PricingComponent

    def duration_text
      page_data_with_key('duration_text', '')
    end

    def price_only
      return 'price_only' if (self.duration_text.empty? && self.get_strikethrough_text.empty?)
      ''
    end

    def label
      page_data_with_key('label', '')
    end

    def get_percentage_off(key = nil)
      case key
        when 'annual'
          page_data_with_key('annual_percentage_off', nil)
        when 'monthly'
          page_data_with_key('monthly_percentage_off', nil)
        else
          page_data_with_key('percentage_off', nil)
      end
    end


    def get_strikethrough_text(key = nil)
      case key
        when 'annual'
          page_data_with_key('annual_strikethrough_price_text', '')
        when 'monthly'
          page_data_with_key('monthly_strikethrough_price_text', '')
        else
          page_data_with_key('strikethrough_price_text', '')
      end
    end

    def dynamic_price (key = ShowroomCms::PricingComponent::DEFAULT_KEY)
      output = super
      return nil if output.nil?
      output['strike_through_text'] = get_strikethrough_text key
      output['discount_static'] = get_percentage_off key
      output
    end
	
	def omniture_data_link
	  page_data_with_key('omniture_data_link', '')
    end
  end
end