module HarmonyCms
  module Components
    module Prod
      class FeaturesSaas < ShowroomCms::Component

        def init_child_components
          add_and_init_child_component_if_exists('features_carousel')
          add_and_init_child_component_if_exists('features2')
        end

      end
    end
  end
end