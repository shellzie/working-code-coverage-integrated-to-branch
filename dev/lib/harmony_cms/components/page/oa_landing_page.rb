module HarmonyCms::Components::Page
    class OaLandingPage < HarmonyCms::Components::Page::BasePage
        def init_child_components
		  add_and_init_child_components_if_exists(%w(cq-nav-promo cq-header cq-footer cq-headings cq-container cq-disclosure cq-bottom-promo))
          super
        end

        def body_template
          "harmony_cms/components/page/oa_landing_page/body"
        end

        def main_template
          "harmony_cms/components/page/oa_landing_page/main"
        end
    end
end
