module HarmonyCms::Components::Core
  class Cta < ShowroomCms::Component

    CART_URL = '%s/commerce/e2e/checkout/redirect_to_cart.jsp?%s&priorityCode=%s&successUrl=%s/commerce/e2e/cart/shopping_cart.jsp'

    def cta_id
      page_data_with_key('cta_id', '')
    end

    def cta_text
      page_data_with_key('cta_text', 'CTA')
    end

    def modal
      is_modal = page_data_with_key('is_modal', '')
      #only add modal class if both is_modal is true and there is a modal_content_path
      modal_path =  page_data_with_key('modal_content_path', '')
      if is_modal == 'true' && modal_path.length != 0
        'modal'
      end
    end

    def cta_link
      modal_path = ''
      #only set modal_path is is_modal is true
      if page_data_with_key('is_modal', '') == 'true'
        modal_path =  page_data_with_key('modal_content_path', '')
      end

      output = page_data_with_key('cta_link', 'http://intuit.com')
      output = add_to_cart_link if page_data_with_key('is_add_to_cart', false) && !page_data_with_key('pricing_id', nil).nil?
      output = page.url_from_cq_page_path(modal_path) unless modal_path.empty?

      output
    end

    def cta_new_tab
      target=""
      open_new_tab = page_data_with_key('cta_new_tab', '')
      #only allow target to open in a new window if the cta is NOT a modal
      if open_new_tab == 'true' &&  modal != 'modal'
        target = "_blank"
      end
      target
    end

    def data_cta_link
      return add_to_cart_link if page_data_with_key('is_add_to_cart', false) && !page_data_with_key('pricing_id', nil).nil? && !page_data_with_key('modal_content_path', '').empty? && page_data_with_key('is_modal', '') == 'true'
      nil
    end

    def cta_style
      page_data_with_key('cta_style', 'primary')
    end

    def cta_align
      page_data_with_key('cta_align', 'left')
    end

    def cta_visually_hidden_text
      hidden_text = page_data_with_key('cta_visually_hidden_text', '')
      hidden_text = "#{hidden_text}" unless hidden_text.empty?
      hidden_text
    end

    def cta_data_link
      page_data_with_key('cta_data_link', '')
    end

    def cta_data_event
      page_data_with_key('cta_data_event', '')
    end

    def cta_data_onclose_url
      page_data_with_key('cta_data_onclose_url', '')
    end

    def cta_modal_page_tracking
      page_data_with_key('cta_modal_page_tracking', '')
    end

    def add_to_cart_link
      cta_link = _get_cta_link
      pricing_id = page_data_with_key('pricing_id')
      output = pricing_id[0..3] == ShowroomCms::AggregateProcessor::DynamicPricing::PREFIX_OFFERING_ID ? 'quantity=1&offeringId=' : 'optionalItem=false&cpcInstanceId='
      output << pricing_id[4..-1]
      sprintf CART_URL, cta_link, output, page.response.cookies['priorityCode'] ? page.response.cookies['priorityCode'] : '*', cta_link
    end

    protected

    def _get_cta_link
      cta_link = page_data_with_key('cta_link', 'https://intuit.com')
      cta_link.strip!
      cta_link = "https://#{cta_link}" if cta_link[0..3] != 'http'
      uri = URI(cta_link)
      "https://#{uri.host}"
    end

  end
end
