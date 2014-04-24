module HarmonyCms
	module Components
		module Page
			module Modal
				class ModalFormPage < HarmonyCms::Components::Page::Modal::ModalPage
					def init_child_components
						add_and_init_child_component_if_exists("cq-headings")
						add_and_init_child_component_if_exists("cq-container")
					end
					def main_template
						File.join('harmony_cms', 'components', 'page', 'modal', 'modal_form_page', 'main')
					end
				end
			end
		end
	end
end
