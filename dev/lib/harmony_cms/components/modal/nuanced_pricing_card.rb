module HarmonyCms
  module Components
    module Modal
      class NuancedPricingCard < HarmonyCms::Components::Modal::PricingCardComponent
        def init_child_components
          add_and_init_child_components_if_exists(%w(cq-header cq-cta cq-text))
          super
        end
      end
    end
  end
end
