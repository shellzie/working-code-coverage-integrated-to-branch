module HarmonyCms
  module Components
    module Page
      class LandingPage < HarmonyCms::Components::Page::BasePage

        def init_child_components
          add_and_init_child_components_if_exists(%w(cq-header cq-footer cq-container0 cq-container1 cq-container2 cq-container3 cq-container4 cq-disclosure))
          super
        end

        def body_template
          "harmony_cms/components/page/landing_page/body"
        end

        def main_template
          "harmony_cms/components/page/landing_page/main"
        end

      end
    end
  end
end
