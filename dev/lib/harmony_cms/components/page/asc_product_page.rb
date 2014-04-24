module HarmonyCms::Components::Page
    class AscProductPage < HarmonyCms::Components::Page::BasePage
        def init_child_components
		  add_and_init_child_components_if_exists(%w(cq-nav-promo cq-header cq-hero-promo cq-footer cq-hero cq-container cq-bottom-promo))
          super
        end

        def body_template
          "harmony_cms/components/page/asc_product_page/body"
        end

        def main_template
          "harmony_cms/components/page/asc_product_page/main"
        end
    end
end