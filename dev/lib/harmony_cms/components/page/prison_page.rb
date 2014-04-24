module HarmonyCms::Components::Page
    class PrisonPage < HarmonyCms::Components::Page::BasePage
        def init_child_components
		  add_and_init_child_components_if_exists(%w(cq-nav-promo cq-header cq-hero cq-footer cq-container cq-disclosure cq-bottom-promo))
          super
        end

        def body_template
          "harmony_cms/components/page/prison_page/body"
        end

        def main_template
          "harmony_cms/components/page/prison_page/main"
        end
    end
end
