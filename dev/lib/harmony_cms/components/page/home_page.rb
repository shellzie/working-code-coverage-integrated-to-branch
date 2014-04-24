module HarmonyCms
  module Components
    module Page
      class HomePage < HarmonyCms::Components::Page::StandardPage

        def init_child_components
          add_and_init_child_component_if_exists("cq-hero")
          add_and_init_child_component_if_exists("benefits-title")
          add_and_init_child_component_if_exists("reviews_carousel")
          add_and_init_child_component_if_exists("attachments")
          add_and_init_child_component_if_exists("banner")
          add_and_init_child_component_if_exists("cq-container")
          add_and_init_child_component_if_exists("cq-hero-promo")

					(1..3).each do |i|
						add_and_init_child_component_if_exists("benefit#{i}-media")
						add_and_init_child_component_if_exists("benefit#{i}-text")
						add_and_init_child_component_if_exists("benefit#{i}-cta")
					end

          super
        end

        def main_template
          "harmony_cms/components/page/home_page/main"
        end

      end
    end
  end
end