module HarmonyCms
  module Components
    module Page
      class EditorialPage < HarmonyCms::Components::Page::StandardPage

        def init_child_components
          add_and_init_child_component_if_exists(%w(cq-headings cq-container))
          super
        end

        def main_template
          "harmony_cms/components/page/editorial_page/main"
        end

      end
    end
  end
end
