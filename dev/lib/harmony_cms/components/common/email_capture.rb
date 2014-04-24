module HarmonyCms
  module Components
    module Common
      class EmailCapture < ShowroomCms::Component

        attr_accessor :css_color
        
        def init
          text_color
          super
        end

        def email_heading
          page_data_with_key('email_heading', 'Sign up to take discounts, small business tips and information.')
        end

        def email_text
          page_data_with_key('email_text', 'Your email address')
        end

        def success_msg
          page_data_with_key('success_msg', 'Thanks for signing up')
        end

        def error_msg
          page_data_with_key('error_msg', 'Please enter valid email address')
        end

        def text_color
          color_check = page_data_with_key('text_color', 'text-black')
          @css_color = ""
          if color_check.eql?('text-white')
              @css_color = "white";
          end
        end

      end
    end
  end
end