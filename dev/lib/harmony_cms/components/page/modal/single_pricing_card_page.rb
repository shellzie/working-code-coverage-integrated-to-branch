module HarmonyCms
  module Components
    module Page
      module Modal
        class SinglePricingCardPage < HarmonyCms::Components::Page::Modal::ModalPage

          def init_child_components
            add_and_init_child_components_if_exists(%w(cq-text cq-cta cq-disclosure cq-label cq-card))
          end

          def main_template
            File.join('harmony_cms', 'components', 'page', 'modal', 'single_pricing_card_page', 'main')
          end

          def card_template
            File.join('harmony_cms', 'components', 'page', 'modal', 'single_pricing_card_page', 'card')
          end

        end
      end
    end
  end
end
