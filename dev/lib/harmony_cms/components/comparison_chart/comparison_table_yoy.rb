module HarmonyCms::Components::ComparisonChart
  class ComparisonTableYoy < ShowroomCms::PricingComponent
    def init_child_components
      add_and_init_child_component('cta') if properties.has_key?('cta')
    end
    def h2
      page_data_with_key('h2', 'QuickBooks Pro 2013').force_encoding('UTF-8').html_safe
    end
    def h3
      page_data_with_key('h3', 'Feature List by Version Year').force_encoding('UTF-8').html_safe
    end
    def price_text
      page_data_with_key('price_text', 'Starting at ')
    end
    def text_data
      page_data_with_key('tableData', '').force_encoding('UTF-8').html_safe
    end
    def year_names
      page_data_with_key('year_names', {})
    end
    def dynamic_price
      output = super
      return nil if output.nil?
      output['strike_through_text'] = page_data_with_key('strikethrough_price_text', '')
      output
    end
  end
end
