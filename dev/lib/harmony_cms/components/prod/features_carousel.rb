module HarmonyCms
  module Components::Prod
    class FeaturesCarousel < ShowroomCms::Component

      def init_child_components
        add_and_init_child_component_if_exists("header")

        (1..num_slides).each do |i|
          add_and_init_child_component_if_exists("feature#{i}-text")
          add_and_init_child_component_if_exists("feature#{i}-media")
        end
      end

			def num_slides
				page_data_with_key('num_slides', 3).to_i
			end

    end
  end
end
