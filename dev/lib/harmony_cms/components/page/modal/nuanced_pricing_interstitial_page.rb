module HarmonyCms
  module Components
    module Page
      module Modal
        class NuancedPricingInterstitialPage < HarmonyCms::Components::Page::Modal::SinglePricingInterstitialPage

          def card_template
            File.join('harmony_cms', 'components', 'page', 'modal', 'nuanced_pricing_interstitial_page', 'card')
          end

        end
      end
    end
  end
end
