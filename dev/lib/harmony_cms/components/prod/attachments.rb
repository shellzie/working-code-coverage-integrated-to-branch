module HarmonyCms
  module Components::Prod
		class Attachments < ShowroomCms::Component

			def init_child_components
				(1..3).each do |i|
					if properties.has_key?("item-#{i}")
						add_and_init_child_component("item-#{i}")
					end
				end
			end

		end
	end
end
