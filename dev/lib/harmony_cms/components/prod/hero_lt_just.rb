module HarmonyCms
  module Components
    module Prod
      class HeroLtJust < ShowroomCms::Component
        def init_child_components
          add_and_init_child_components(%w(cq-text cq-cta))
        end
      end
    end
  end
end