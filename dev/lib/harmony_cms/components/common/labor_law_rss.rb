require 'ostruct'
module HarmonyCms
  module Components::Common
    class LaborLawRss < ShowroomCms::Component
        
        include ShowroomCms::FeedProcessor

        MAX_CHARS   = 100

        attr_reader :rss_data_federal, :rss_data_other  , :processor, :errors

        def init
          @max_chars = self.class::MAX_CHARS
          rss_data = get_feed #Get RSS Data
          @rss_data_federal = []
          @rss_data_other = []
          rss_data.each do |rss_data|
            if rss_data['category'].match(/federal/i)
              @rss_data_federal << rss_data
            else
              @rss_data_other << rss_data
            end
          end
        end

        def dropdown_title
          page_data_with_key("dropdown_title", "Select")
        end

        def list_type
          page_data_with_key("list_type", "")
        end

        def manual_list
          page_data_with_key("manual_data_list", "")

        end

        def json_path
          page_data_with_key("json_path", "")
        end

        def collection_for_dropdown
          json = eval(read_cq_resource(json_path))
          json.inject([]) do |arr, e|
            return "" if e[:name].blank? or e[:value].blank?
            arr << OpenStruct.new(:name => e[:name], :value => e[:value])
          end
        end

        # Proccessing of RSS Feed

        def get_feed_url
          page_data_with_key("feed_url", "")
        end

        def get_max_chars
          @max_chars
        end

        def set_max_chars(int)
          @max_chars = int if int.is_a? Integer
        end

        def get_feed
          rss_data = []
          feed = get_feed_object(get_feed_url)
          if (!feed['rss'].blank? && !feed['rss']['channel'].blank? && !feed['rss']['channel']['item'].blank?)
            rss_data = feed['rss']['channel']['item']
            _process(rss_data)
          end
          return rss_data
        end

        protected

        def _process(items)
          items.map {
              |item|

            _process_lb_title(item)          if self.respond_to?('_process_lb_title')
            _process_lb_description(item)    if self.respond_to?('_process_lb_description')
            _process_lb_date(item)           if self.respond_to?('_process_lb_date')
            _process_lb_category(item)       if self.respond_to?('_process_lb_category')
          }
        end

        # format DateTime
        def _process_lb_date(item)
          item['formatted_date'] = DateTime.parse(item['pubDate']).strftime('%h %d, %Y')
        end

        def _process_lb_description(item)
          item['description'] = ActionView::Base.full_sanitizer.sanitize(item['description']).strip
          _split_description(item)
        end

        def _process_lb_title(item)
          item['title'] = ActionView::Base.full_sanitizer.sanitize(item['title'])
        end

        def _process_lb_category(item)
          item['category'] = ActionView::Base.full_sanitizer.sanitize(item['category'][1])
        end

        def _split_description(item)
          description = item['description']
          return if description.size <= get_max_chars
          split_point = description[0..get_max_chars].rindex(' ')
          item['description'] = description[0..(split_point-1)]
          item['description_more'] = description[split_point..-1]
        end

    end
  end
end

