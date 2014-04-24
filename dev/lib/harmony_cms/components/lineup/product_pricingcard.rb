module HarmonyCms::Components::Lineup
  class ProductPricingcard < ShowroomCms::PricingComponent

    attr_reader :price, :per_period, :per_period_class, :dollar, :cents, :is_horizontal_price_icon_class, :is_price_icon_class,
                :section_icon_enabled_class, :section_icon_left_class, :sup_free_class, :section_footnote

    def init
      @dollar = '0'
      @cents = '00'
      @per_period = 'month'
      @price = '0.00'
      @per_period_class = ''
      @section_icon_enabled_class = ''
      @section_icon_left_class = ''
      @sup_free_class = "";
      @section_footnote = terms;

      if price_type.eql?('monthly')
        @price = monthly_price
        @per_period = '/month'
        @per_period_class = ''
      elsif price_type.eql?('annual')
         @price = annual_price
         @per_period = '/year'
         @per_period_class = ''
      elsif price_type.eql?('onetime')
        @price = onetime_price
        @per_period = ''
        @per_period_class = ' onetime'
        @sup_free_class = "onetime-c";
      elsif price_type.eql?('free')
        @price = free_price + '.' + terms
        @per_period = ''
        @per_period_class = ' free'
        @dollar = free_price;
        @cents = terms;
        @sup_free_class = 'free';
      elsif price_type.eql?('none')
        @price = none_price + '.' + terms
        @per_period = ''
        @per_period_class = ' none'
        @dollar = free_price;
        @cents = terms;
        @sup_free_class = 'none';
      end

      if (index >=0)
        @dollar, @cents = price.split('.')
      end
      init_child_components
    end


    def init_child_components
      add_and_init_child_component_if_exists('cq-text1')
      add_and_init_child_component_if_exists('cq-cta1')
      add_and_init_child_component_if_exists('cq-image1')
    end

    def top_label
      page_data_with_key('top_label', '').force_encoding('UTF-8').html_safe
    end

    def bot_label
      page_data_with_key('bot_label', '').force_encoding('UTF-8').html_safe
    end

    def header_icon_text
      page_data_with_key('header_icon_text', '').force_encoding('UTF-8').html_safe
    end

    def price_type
      page_data_with_key('price_type', '').force_encoding('UTF-8').html_safe
    end

    def annual_price
      page_data_with_key('annual_price', '0.00').force_encoding('UTF-8').html_safe
    end

    def monthly_price
      page_data_with_key('monthly_price', '0.00').force_encoding('UTF-8').html_safe
    end

    def onetime_price
      page_data_with_key('onetime_price', '0.00').force_encoding('UTF-8').html_safe
    end

    def free_price
      page_data_with_key('freestyle_price', '&nbsp;').force_encoding('UTF-8').html_safe
    end

    def none_price
      page_data_with_key('none_price', '&nbsp;').force_encoding('UTF-8').html_safe
    end

    def terms
      page_data_with_key('terms', '&nbsp;').force_encoding('UTF-8').html_safe
    end

    def is_header_icon_enabled
      page_data_with_key('is_header_icon_enabled', 'false')
    end

    def is_section_icon_enabled
      page_data_with_key('is_section_icon_enabled', 'false')
    end

    def section_icon_position
      page_data_with_key('section_icon_position', 'top')
    end

    def is_section_price_footnote_enabled
      page_data_with_key('is_section_price_footnote_enabled', 'false')
    end

    def is_section_additional_fee_enabled
      page_data_with_key('is_section_additional_fee_enabled', 'false')
    end

    def section_additional_fee
      page_data_with_key('section_additional_fee', 'Enter additional fee info here')
    end

    def index
      price.index('.')
    end

    def dynamic_price
      output = super
      output = {
          'regPrice' => @price,
          'salePrice' => @price,
          'currency' => '$',
          'separator' => '.',
          'discount' => nil
      } if output.nil?
      output['strike_through_text'] = page_data_with_key('strikethrough_price_text', '')
      output['discount_static'] = page_data_with_key('header_icon_text', '')
      output
    end


  end
end