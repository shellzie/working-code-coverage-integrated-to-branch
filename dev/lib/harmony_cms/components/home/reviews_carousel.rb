module HarmonyCms
  module Components::Home
    class ReviewsCarousel < ShowroomCms::Component

      def cacheable
        true
      end

      def init_child_components
        add_and_init_child_component_if_exists("header")

        (1..num_slides).each do |i|
          add_and_init_child_component_if_exists("review-#{i}")
        end
      end

      def num_slides
        page_data_with_key('num_slides', 7).to_i
      end

    end
  end
end
