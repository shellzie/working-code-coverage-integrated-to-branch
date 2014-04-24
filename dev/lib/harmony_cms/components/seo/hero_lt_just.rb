module HarmonyCms
  module Components
    module Seo
      class HeroLtJust < ShowroomCms::Component
        def init_child_components
          add_and_init_child_components(%w(cq-image cq-text cq-text1 cq-cta cq-text2))
          super
        end
      end
    end
  end
end