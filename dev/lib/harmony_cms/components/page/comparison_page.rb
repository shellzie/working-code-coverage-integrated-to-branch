module HarmonyCms
  module Components
    module Page
      class ComparisonPage < HarmonyCms::Components::Page::StandardPage

        def init_child_components
          add_and_init_child_component("cq-comp-table-template-disclaimer") if properties.has_key?("cq-comp-table-template-disclaimer")
          add_and_init_child_component("cq-container") if properties.has_key?("cq-container")
          super
        end

        def main_template
          "harmony_cms/components/page/comparison_page/main"
        end

      end
    end
  end
end
