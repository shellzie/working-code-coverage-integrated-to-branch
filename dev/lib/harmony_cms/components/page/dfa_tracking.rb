module HarmonyCms
  module Components::Page
    module DfaTracking

      def add_dfa?
        page_data_with_key('add_dfa', false)
      end

      def dfa_type
        page_data_with_key('dfa_type', nil)
      end

      def dfa_cat
        page_data_with_key('dfa_cat', nil)
      end

      def dfa_tagserver
        page_data_with_key('dfa_tagserver', nil)
      end
      
      def dfa_ord
        page_data_with_key('dfa_ord', nil)
      end
      
      def dfa_optional_params
        page_data_with_key('dfa_param', nil)
      end

    end
  end
end