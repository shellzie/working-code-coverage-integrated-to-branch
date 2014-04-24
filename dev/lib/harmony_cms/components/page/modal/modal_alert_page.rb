module HarmonyCms
  module Components
    module Page
      module Modal
        class ModalAlertPage < HarmonyCms::Components::Page::Modal::ModalPage

          def init_child_components
            add_and_init_child_component_if_exists("cq-headings")
			      add_and_init_child_component_if_exists("cq-modal-footer")
			      add_and_init_child_component_if_exists("cq-modal-body")
            super
          end

          def main_template
            File.join('harmony_cms', 'components', 'page', 'modal', 'modal_alert_page', 'main')
          end

        end
      end
    end
  end
end
