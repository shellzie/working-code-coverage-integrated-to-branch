module HarmonyCms
  module Components
    module Page
      module Modal
        class ModalPage < ShowroomCms::PageComponent

          def init_child_components
            add_and_init_child_component_if_exists("cq-container")
            super
          end

          def layout
            File.join('harmony_cms', 'components', 'page', 'modal', 'modal_page')
          end

          def view
            File.join('harmony_cms', 'components', 'page', 'modal', 'modal_page')
          end

          def main_template
            File.join('harmony_cms', 'components', 'page', 'modal', 'modal_page', 'main')
          end
        end
      end
    end
  end
end
