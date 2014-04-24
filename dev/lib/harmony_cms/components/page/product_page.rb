module HarmonyCms
  module Components
    module Page
      class ProductPage < HarmonyCms::Components::Page::StandardPage

        def init_child_components
          add_and_init_child_component("cq-hero") if properties.has_key?("cq-hero")
          add_and_init_child_component("cq-hero-promo") if properties.has_key?("cq-hero-promo")
          add_and_init_child_component("cq-container") if properties.has_key?("cq-container")
          super
        end

        def main_template
          "harmony_cms/components/page/product_page/main"
        end

      end
    end
  end
end

