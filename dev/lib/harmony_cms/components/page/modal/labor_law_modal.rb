module HarmonyCms
  module Components
    module Page
      module Modal
        class LaborLawModal < HarmonyCms::Components::Page::Modal::ModalPage

          def init_child_components
            add_and_init_child_component_if_exists("cq-heading-labor")
			      add_and_init_child_component_if_exists("cq-body-labor")
			      add_and_init_child_component_if_exists("cq-footer-labor")
			      
            super
          end

          def main_template
            File.join('harmony_cms', 'components', 'page', 'modal', 'labor_law_modal', 'main')
          end

        end
      end
    end
  end
end
