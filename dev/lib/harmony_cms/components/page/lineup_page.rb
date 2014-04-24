module HarmonyCms
  module Components
    module Page
      class LineupPage < HarmonyCms::Components::Page::StandardPage

        def init_child_components
          add_and_init_child_component_if_exists("cq-headings")
          add_and_init_child_component_if_exists("cq-container")
          add_and_init_child_component_if_exists("cq-disclosure")
          super
        end

        def main_template
          "harmony_cms/components/page/lineup_page/main"
        end

      end
    end
  end
end
