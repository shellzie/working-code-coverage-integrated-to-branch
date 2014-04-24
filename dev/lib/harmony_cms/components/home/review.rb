module HarmonyCms
  module Components::Home
    class Review < ShowroomCms::Component

      def cacheable
        true
      end

      def init_child_components
        add_and_init_child_component_if_exists('text')
      end

      def title
        page_data_with_key('title', '(No review title found)').force_encoding('UTF-8').html_safe
      end

      def date
        page_data_with_key('date', '(No review date found)').force_encoding('UTF-8').html_safe
      end

      def rating
        page_data_with_key('rating', '(No rating found)').force_encoding('UTF-8').html_safe
      end

      def product
        page_data_with_key('product', '(No product detected)').force_encoding('UTF-8').html_safe
      end

      def product_url
        case self.product.downcase
          when 'quickbooks online'
            return '//quickbooks.intuit.com/online/'
          when 'quickbooks pro'
            return '//quickbooks.intuit.com/pro/'
          when 'quickbooks premier'
            return '//quickbooks.intuit.com/premier/'
          when 'intuit gopayment'
            return '//payments.intuit.com/mobile-credit-card-processing/'
          when 'quickbooks payments'
            return '//quickbooks.intuit.com/payments/accept-credit-cards-echecks/'
          when 'intuit online household payroll'
            return '//payroll.intuit.com/payroll-services/household-payroll/'
          when 'intuit online payroll'
            return '//payroll.intuit.com/payroll-services/online-payroll/'
          when 'intuit health benefits marketplace'
            return '//payroll.intuit.com/additional-services/affordable-health-insurance/'
          when 'intuit pos'
            return '//quickbooks.intuit.com/point-of-sale/'
          else
            return ''
        end
      end

    end
  end
end
