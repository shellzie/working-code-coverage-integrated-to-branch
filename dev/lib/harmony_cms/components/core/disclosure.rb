module HarmonyCms

  module Components::Core

    class Disclosure < ShowroomCms::Component

      def cacheable
        true
      end

      def text_data
        page_data_with_key("text", "").force_encoding("UTF-8").html_safe
      end

      def link_name
        page_data_with_key("link_name", "Important offers, pricing details, & disclaimers")
      end

      def link_name_toggle
        page_data_with_key("link_name_toggle", "")
      end
	  
	    def link_data_link
        page_data_with_key("link_data_link", "")
      end
	  
	    def bg_color
        page_data_with_key("bg_color", "bg-grey")
      end
	  
	    def top_margin_off
		    page_data_with_key("top_margin_off", "") == "true" ? "disclosure-nomargin" : ""
      end

    end


  end

end
