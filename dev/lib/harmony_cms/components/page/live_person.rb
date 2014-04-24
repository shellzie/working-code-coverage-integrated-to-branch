module HarmonyCms
  module Components::Page
    module LivePerson

      def lp_enabled?
        page_data_with_key('enable_liveperson', false)
      end

      def lp_deploymentid
        lp_deploymentid = page_data_with_key('lp_deploymentid', nil)
        lp_deploymentid.nil? ? 'sales' : lp_deploymentid
      end

      def lp_session_campaign
        page_data_with_key('lp_session_campaign', nil)
      end

      def lp_account_number
        page_data_with_key('lp_accountnumber', nil)
      end

      def lp_tagserver
        page_data_with_key('tagserver', nil)
      end

      def lp_server
        page_data_with_key('lp_server', nil)
      end

      def lp_unit
         lp_unit = page_data_with_key('lp_unit', nil)
         lp_unit.nil? ? 'qb-sales' : lp_unit
      end

      def product_name
        page_data_with_key('product_name', nil)
      end

      def lp_section
        page_data_with_key('lp_section', nil)
      end

      def lp_proactive_invites_enabled?
        page_data_with_key('enable_proactiveinvitations', '') == 'true' ? 'yes' : 'no'

      end

    end
  end
end