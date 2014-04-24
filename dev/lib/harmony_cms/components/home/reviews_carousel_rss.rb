module HarmonyCms
  module Components::Home
    class ReviewsCarouselRss < ShowroomCms::Component

      # Although we call this a "component", it's in essence a controller.
      # As such, it should function as a data relay throughout the processing chain.
      #
      # examples: it SHOULD fetch data from CQ nodes, it SHOULD relay data to view, etc.
      #           it SHOULD NOT know where the data is coming from or the rules according to which the
      #           data should be massaged
      #
      # In essence, it should not have the role of a model or handle business logic - that's the job of
      # another entity.
      #
      # I am pleased to introduce the "Processor".
      #
      # It's responsible for instantiating the correct processing class based on the requested URL,
      # class that will get the data and process it according to the individual needs and peculiarities
      # of the data model.
      #
      # This controller is UNAWARE of what the model does, it only knows how to consume its services and
      # relay the data back to the view.
      #
      # We could in theory change whatever we want in the way we process the data stream, without ever
      # coming back to change the code in this component.

      attr_reader :reviews, :processor, :errors

      def init
        super
        @errors       = []
        @processor  ||= HarmonyCms::Processors::Home::ReviewsCarouselRss::Processor.instance.create(get_feed_url)
        _set_reviews
      end

      def child_components_map
        {'carousel-header' => '/apps/harmony/components/core/text'}
      end

      # get a unique carousel ID to prevent DOM ID conflicts if page contains multiple carousels
      def carousel_id
        @carousel_id ||= ('A'..'Z').to_a.concat(('a'..'z').to_a).to_a.shuffle[0,10].join
      end

      def get_feed_url
        URI.parse(URI.encode(page_data_with_key('feed_url', nil))).to_s
      rescue
        @errors << {'error'=>'Missing feed URL. Reviews carousel requires an RSS feed URL.'}
      ensure
        ''
      end

      def background
        bg = page_data_with_key('bg_color', 'white')
        bg.eql?('white') ? 'bg-white' : 'darker'
      end

      protected

      # gets the reviews from the processor and makes them available to the @reviews instance variable
      def _set_reviews
        @reviews ||= processor.get_reviews[0..(page_data_with_key('num_slides', 5).to_i - 1)]
      end

    end
  end
end