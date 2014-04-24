module HarmonyCms
  module Components::Prod
		class TechSpecs < ShowroomCms::Component

			def init_child_components
        add_and_init_child_component_if_exists("header")

				(1..2).each do |i|
          add_and_init_child_component_if_exists("text-#{i}")
				end
			end

		end
  end
end
