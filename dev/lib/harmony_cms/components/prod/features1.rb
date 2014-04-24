module HarmonyCms
  module Components::Prod
		class Features1 < ShowroomCms::Component

			def init_child_components
				(1..3).each do |i|
					if properties.has_key?("image-#{i}")
						add_and_init_child_component("image-#{i}")
					end

					if properties.has_key?("text-#{i}")
						add_and_init_child_component("text-#{i}")
					end
				end

				if properties.has_key?("cta")
					add_and_init_child_component("cta")
				end
			end

			def f1_header
				page_data_with_key('f1_header', '').force_encoding('UTF-8').html_safe
			end

			def f1_cta_label
				page_data_with_key('f1_cta_label', '').force_encoding('UTF-8').html_safe
			end

			def is_hide_header
				page_data_with_key('is_hide_header', 'false')
			end

		end
  end
end
