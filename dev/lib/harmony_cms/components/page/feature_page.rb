module HarmonyCms
  module Components
    module Page
      class FeaturePage < HarmonyCms::Components::Page::StandardPage

        def init_child_components
          add_and_init_child_component_if_exists("cq-heading")
          add_and_init_child_component_if_exists("cq-hero-container")
          add_and_init_child_component_if_exists("cq-container")
          add_and_init_child_component_if_exists("cq-banner")
          add_and_init_child_component_if_exists("cq-disclosure")
          super
        end

        def main_template
          "harmony_cms/components/page/feature_page/main"
        end

      end
    end
  end
end