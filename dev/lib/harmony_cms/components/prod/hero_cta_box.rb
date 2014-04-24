module HarmonyCms::Components::Prod
  class HeroCtaBox < ShowroomCms::PricingComponent
    def heading
      page_data_with_key('h3', '').force_encoding('UTF-8').html_safe
    end

    def pricing_text
      page_data_with_key('p2', '').force_encoding('UTF-8').html_safe
    end

    def pricing_per
      page_data_with_key('per', '').force_encoding('UTF-8').html_safe
    end

    def init_child_components
      add_and_init_child_components(%w(cq-cta))
    end

    def dynamic_price
      output = super
      return nil if output.nil?
      output['strike_through_text'] = page_data_with_key('strikethrough_price_text', '')
      output
    end
  end
end