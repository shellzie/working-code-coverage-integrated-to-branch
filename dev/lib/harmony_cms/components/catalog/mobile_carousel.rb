module HarmonyCms
  module Components::Catalog
    class MobileCarousel < ShowroomCms::Component

      def init_child_components
        add_and_init_child_component_if_exists("header")

				add_and_init_child_component_if_exists("ipad-text")
				add_and_init_child_component_if_exists("iphone-text")
				add_and_init_child_component_if_exists("android-text")

        (1..num_slides_ipad).each do |i|
          add_and_init_child_component_if_exists("ipad-slide-#{i}")
				end

        (1..num_slides_iphone).each do |i|
          add_and_init_child_component_if_exists("iphone-slide-#{i}")
				end

        (1..num_slides_android).each do |i|
          add_and_init_child_component_if_exists("android-slide-#{i}")
        end
      end

			def num_slides_ipad
				page_data_with_key('num_slides_ipad', 4).to_i
			end

			def num_slides_iphone
				page_data_with_key('num_slides_iphone', 4).to_i
			end

			def num_slides_android
				page_data_with_key('num_slides_android', 4).to_i
			end

			def data_link_ipad
				page_data_with_key('data_link_ipad', "").force_encoding('UTF-8').html_safe
			end

			def data_link_iphone
				page_data_with_key('data_link_iphone', "").force_encoding('UTF-8').html_safe
			end

			def data_link_android
				page_data_with_key('data_link_android', "").force_encoding('UTF-8').html_safe
			end

    end
  end
end
