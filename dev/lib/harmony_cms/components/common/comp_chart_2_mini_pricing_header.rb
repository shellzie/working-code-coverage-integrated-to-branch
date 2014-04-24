module HarmonyCms
  module Components
    module Common
      class CompChart2MiniPricingHeader < ShowroomCms::Component

        def init

          init_child_components
        end

        def init_child_components

          add_and_init_child_component_if_exists('cq-text-header')
          add_and_init_child_component_if_exists('cq-text-top-content')
          add_and_init_child_component_if_exists('cq-cta-pricing-header')
          add_and_init_child_component_if_exists('cq-text-bot-content')
        end

        def background_color
          page_data_with_key('header_bg', 'grey-bg')
        end

      end
    end
  end
end
