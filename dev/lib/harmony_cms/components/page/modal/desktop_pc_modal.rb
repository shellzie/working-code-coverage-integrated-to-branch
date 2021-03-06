module HarmonyCms
  module Components
    module Page
      module Modal
        class DesktopPcModal < HarmonyCms::Components::Page::Modal::ModalPage

          def init_child_components
            add_and_init_child_component_if_exists("cq-headings")
			add_and_init_child_component_if_exists("cq-text")
			add_and_init_child_component_if_exists("cq-label")			
			add_and_init_child_component_if_exists("cq-add-card")
			add_and_init_child_component_if_exists("cq-upgrade-card")
			add_and_init_child_component_if_exists("cq-card-footer")
			add_and_init_child_component_if_exists("cq-text-footer")
			add_and_init_child_component_if_exists("cq-text-disclosures")
            super
          end

          def main_template
            File.join('harmony_cms', 'components', 'page', 'modal', 'desktop_pc_modal', 'main')
          end

        end
      end
    end
  end
end
