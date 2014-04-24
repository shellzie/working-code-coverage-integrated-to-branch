module HarmonyCms
  module Components
    module Page
      class SquareLandingPage < HarmonyCms::Components::Page::BasePage

        def init_child_components
          add_and_init_child_component_if_exists("cq-nav-promo")
          add_and_init_child_component_if_exists("cq-middle-container")
          add_and_init_child_component_if_exists("cq-subheading")
          add_and_init_child_component_if_exists("cq-subheading02")
          add_and_init_child_component_if_exists("cq-subheading03")
          add_and_init_child_component_if_exists("cq-subheading04")
          add_and_init_child_component_if_exists("cq-heading01")
          add_and_init_child_component_if_exists("cq-subheading01")
          add_and_init_child_component_if_exists("cq-image01")
          add_and_init_child_component_if_exists("cq-image02")
          add_and_init_child_component_if_exists("cq-check01")
          add_and_init_child_component_if_exists("cq-check02")
          add_and_init_child_component_if_exists("cq-check03")
          add_and_init_child_component_if_exists("cq-disclosure")
          add_and_init_child_component_if_exists("cq-tabbed-section")
          add_and_init_child_component_if_exists("cq-bottom-promo")
          add_and_init_child_component_if_exists("cq-footer")
          super
        end

        def body_template
          "harmony_cms/components/page/square_landing_page/body"
        end

        def main_template
          "harmony_cms/components/page/square_landing_page/main"
        end

      end
    end
  end
end
