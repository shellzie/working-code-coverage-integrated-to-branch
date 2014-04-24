module HarmonyCms
  module Components
    module Page
      class SeoPage < HarmonyCms::Components::Page::StandardPage

        def init_child_components
          add_and_init_child_components_if_exists(%w(cq-headings cq-container cq-hero cq-disclosure))
          super
        end

        def main_template
          "harmony_cms/components/page/seo_page/main"
        end
      end
    end
  end
end
