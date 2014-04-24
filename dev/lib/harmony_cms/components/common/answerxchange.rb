module HarmonyCms
  module Components
    module Common
      class Answerxchange < ShowroomCms::Component

        # add FeedProcessor as a mixin
        include ShowroomCms::FeedProcessor

        DEFAULT_ITEMS_COUNT     = 3
        DEFAULT_CTA_TEXT        = 'Ask'
        DEFAULT_PARTIAL         = 'default'

        attr_accessor :partial, :context_items, :errors

        #TODO: will have to fix the per component JS or CSS inclusion, seems to be something that's not currently supported
        def init
          @errors = []
          @context_items ||= _get_feed
          # partial name set according to widget name, if none, will default do DEFAULT_PARTIAL
          @partial = File.join(@partial, widget_name)
          _check_search_target
        end

        def api_url
          @api_url ||= page_data_with_key('api_url', nil)
          @api_url
        end

        def widget_header
          page_data_with_key('widget_header', '')
        end

        def has_search_enabled
          page_data_with_key('is_search_enabled', nil).eql?('true') ? true : false
        end

        def search_target
          page_data_with_key('search_target', nil)
        end

        def cta_text
          page_data_with_key('cta_text', DEFAULT_CTA_TEXT)
        end

        def widget_name
          page_data_with_key('widget_name', DEFAULT_PARTIAL)
        end

        def items_count
          tmp = page_data_with_key('items_count', DEFAULT_ITEMS_COUNT)
          tmp.to_i
        end

        protected

        def _check_search_target
          @errors << 'AnswerXchange::Search target not specified' if has_search_enabled && search_target.nil?
        end

        def _get_feed
          if api_url.nil?
            @errors << 'AnswerXchange::Missing AnswerXchange API url'
            return {}
          end

          pagesize = "pagesize=#{items_count}"
          separator = api_url.include?('?') ? '&' : '?'
          feed_url = api_url + separator + pagesize

          feed = get_feed_object(feed_url)
          return {} if (feed.blank? || !feed.has_key?('posts'))
          feed['posts']
        end

      end
    end
  end
end