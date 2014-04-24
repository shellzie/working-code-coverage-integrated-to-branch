module HarmonyCms
  module Components
    module Page
      module Modal
        class DualPricingInterstitialPage < HarmonyCms::Components::Page::Modal::SinglePricingInterstitialPage

          def card_template
            File.join('harmony_cms', 'components', 'page', 'modal', 'dual_pricing_interstitial_page', 'card')
          end

        end
      end
    end
  end
end
