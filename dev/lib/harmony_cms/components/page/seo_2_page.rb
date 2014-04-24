module HarmonyCms
  module Components
    module Page
      class Seo2Page < HarmonyCms::Components::Page::StandardPage

        def init_child_components
          add_and_init_child_components_if_exists(%w(cq-container cq-hero cq-container2))
          super
        end

        def main_template
          "harmony_cms/components/page/seo_2_page/main"
        end
      end
    end
  end
end
