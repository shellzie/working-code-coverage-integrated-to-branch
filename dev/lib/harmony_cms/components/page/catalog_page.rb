module HarmonyCms
  module Components
    module Page
      class CatalogPage < HarmonyCms::Components::Page::StandardPage

        def init_child_components
          add_and_init_child_component_if_exists("cq-container")
          super
        end

        def main_template
          "harmony_cms/components/page/catalog_page/main"
        end

      end
    end
  end
end
