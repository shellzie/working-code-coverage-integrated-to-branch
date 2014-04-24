module HarmonyCms
  module Components::Prod
		class WhatsNew < ShowroomCms::Component

			def init_child_components
				(1..4).each do |i|
					if properties.has_key?("image-#{i}")
						add_and_init_child_component("image-#{i}")
					end

					if properties.has_key?("text-#{i}")
						add_and_init_child_component("text-#{i}")
					end
				end
			end

			def header
				page_data_with_key('header', "What's New").force_encoding('UTF-8').html_safe
			end

		end
  end
end
