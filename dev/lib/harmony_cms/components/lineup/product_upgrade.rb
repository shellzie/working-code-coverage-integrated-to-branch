module HarmonyCms
	module Components
		module Lineup
			class ProductUpgrade < ShowroomCms::Component
  
				attr_reader :section_icon_enabled_class, :section_icon_left_class

				def init
				  @section_icon_enabled_class = ''
				  @section_icon_left_class = ''	  
				  init_child_components
				end

				def init_child_components
				  add_and_init_child_component_if_exists('card-section-text')
				  add_and_init_child_component_if_exists('card-section-cta')
				end

				def top_label
				  page_data_with_key('top_label', '').force_encoding('UTF-8').html_safe
				end

				def bot_label
				  page_data_with_key('bot_label', '').force_encoding('UTF-8').html_safe
				end

				def header_icon_text
				  page_data_with_key('header_icon_text', '').force_encoding('UTF-8').html_safe
				end

				def is_header_icon_enabled
				  page_data_with_key('is_header_icon_enabled', 'false')
				end

				def is_section_icon_enabled
				  page_data_with_key('is_section_icon_enabled', 'false')
				end

				def section_icon_position
				  page_data_with_key('section_icon_position', 'top')
				end
    
			end
		end
	end
end