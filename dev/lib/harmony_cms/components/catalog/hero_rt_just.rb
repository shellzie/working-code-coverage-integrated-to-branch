module HarmonyCms
  module Components
    module Catalog
      class HeroRtJust < ShowroomCms::Component
        def init_child_components
          add_and_init_child_components(%w(cq-text))
          add_and_init_child_components(%w(cq-text2))
          add_and_init_child_components(%w(cq-cta))
        end
      end
    end
  end
end