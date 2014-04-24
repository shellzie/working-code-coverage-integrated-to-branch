module HarmonyCms::Processors::Home::ReviewsCarouselRss::Feeds
  class Zuberance < HarmonyCms::Processors::Home::ReviewsCarouselRss::Feeds::Default

    MAX_CHARS               = 300

    SEPARATOR_RATING        = '*'
    SEPARATOR_PRODUCT_NAME  = ' | '

    # in order to be able to show property name we need a flag guaranteed set to true
    def get_feed_url
      uri = URI(feed_url)
      query = Rack::Utils.parse_nested_query(uri.query || '')
      query['appendProdNameToTitle'] = 'true'
      uri.query = query.to_param
      uri.to_s
    end

    protected

    # zuberance decided to send markup, therefore it's in the "encoded" field - strip it and move it to "description"
    def _process_description(item)
      item['description'] = ActionView::Base.full_sanitizer.sanitize(item['encoded']).strip
      _split_description(item)
    end

    # zuberance feed has the peculiarity of loading the title with a bunch of other info - seek & destroy ... err, reallocate
    def _process_title(item)
      title = item['title']

      # check for ratings
      unless title[SEPARATOR_RATING].nil?
        rating_index_start = title.index(SEPARATOR_RATING)
        rating_index_end = title.rindex(SEPARATOR_RATING)
        item['rating'] = (rating_index_end + 1) - rating_index_start
        item['title'] = title[0, rating_index_start - 1]
      end

      # check for product name
      unless title[SEPARATOR_PRODUCT_NAME].nil?
        product_name_tokes = title.split(SEPARATOR_PRODUCT_NAME)
        item['productName'] = product_name_tokes[product_name_tokes.size - 1]
      end

    end

  end
end

