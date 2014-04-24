module HarmonyCms::Processors::Home::ReviewsCarouselRss::Feeds

  # Default feed class - all other feeds will inherit from this class
  class Default

    # inherit methods from mixin
    include ShowroomCms::FeedProcessor

    # default amount of allowed characters for a review before it's split into visible/hidden section
    MAX_CHARS   = 100

    attr_reader :feed_url

    def initialize(feed_url)
      @feed_url = feed_url
      @max_chars = self.class::MAX_CHARS
    end

    def get_feed_url
      feed_url
    end

    def get_max_chars
      @max_chars
    end

    def set_max_chars(int)
      @max_chars = int if int.is_a? Integer
    end

    def get_reviews
      reviews = []
      feed = get_feed_object(get_feed_url)
      if (!feed['rss'].blank? && !feed['rss']['channel'].blank? && !feed['rss']['channel']['item'].blank?)
        reviews = feed['rss']['channel']['item']
        _process(reviews)
      end
      return reviews
    end

    protected

    def _process(items)
      items.map {
          |item|

        _process_title(item)          if self.respond_to?('_process_title')
        _process_description(item)    if self.respond_to?('_process_description')
        _process_date(item)           if self.respond_to?('_process_title')
      }
    end

    # format date
    def _process_date(item)
      item['formatted_date'] = DateTime.parse(item['date']).strftime('%h %d, %Y')
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