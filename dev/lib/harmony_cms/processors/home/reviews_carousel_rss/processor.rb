module HarmonyCms
  module Processors
    module Home
      module ReviewsCarouselRss
        class Processor < HarmonyCms::Processors::AbstractProcessor

          def create(url)
            case
              when !url.index('zuberance.com').nil?
                HarmonyCms::Processors::Home::ReviewsCarouselRss::Feeds::Zuberance.new(url)
              else
                HarmonyCms::Processors::Home::ReviewsCarouselRss::Feeds::Default.new(url)
            end
          end

        end
      end
    end
  end
end

# add required files
require 'harmony_cms/processors/home/reviews_carousel_rss/feeds/default.rb'
require 'harmony_cms/processors/home/reviews_carousel_rss/feeds/zuberance.rb'