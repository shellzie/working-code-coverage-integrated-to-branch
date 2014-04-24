module HarmonyCms
  module Components
    module Page
      class StandardPage < HarmonyCms::Components::Page::BasePage

        def init_child_components
          add_and_init_child_components(%w(cq-header cq-footer))
          add_and_init_child_component("main-container") if properties.has_key?("main-container")
          add_and_init_child_component("cq-nav-promo")  if properties.has_key?("cq-nav-promo")
          add_and_init_child_component("cq-bottom-promo")  if properties.has_key?("cq-bottom-promo")
        super
        end

        def body_template
          "harmony_cms/components/page/standard_page/body"
        end

        def header_template
          "harmony_cms/components/page/standard_page/header"
        end

        def main_template
          "harmony_cms/components/page/standard_page/main"
        end

        def footer_template
          "harmony_cms/components/page/standard_page/footer"
        end

      end
    end
  end
end
