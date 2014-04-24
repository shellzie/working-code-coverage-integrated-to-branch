module HarmonyCms
	module Components
		module Form
			class RadioSelection < ShowroomCms::Component
				def init_child_components
				  add_and_init_child_component_if_exists('cq-question')
				  add_and_init_child_component_if_exists('cq-callus')
				end

				def cancel_text
				  page_data_with_key('cancel_text', '')
				end

				def cancel_style
				  page_data_with_key('cancel_style', 'left')
				end

				def cancel_link
				  page_data_with_key('cancel_link', '')
				end

				def cancel_data_link
				  page_data_with_key('cancel_data_link', '')
				end

				def cancel_data_event
				  page_data_with_key('cancel_data_event', '')
				end

				def continue_text
				  page_data_with_key('continue_text', '')
				end

				def continue_style
				  page_data_with_key('continue_style', 'left')
				end

				def continue_link
				  page_data_with_key('continue_link', '')
				end

				def continue_data_link
				  page_data_with_key('continue_data_link', '')
				end

				def continue_data_event
				  page_data_with_key('continue_data_event', '')
				end

				def links
				  page_data_with_key('links', '')
				end
			end
		end
	end
end
