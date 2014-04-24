module HarmonyCms
  module Components
    module Home
      class HeroRtJust < ShowroomCms::Component
        def init_child_components
          add_and_init_child_components_if_exists(%w(cq-cta))
        end
      end
    end
  end
end