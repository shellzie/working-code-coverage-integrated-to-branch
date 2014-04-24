module HarmonyCms
  module Components
    module Feature
      class HeroLtJust < ShowroomCms::Component
        def init_child_components
          add_and_init_child_component_if_exists("cq-hero-cta")
        end
      end
    end
  end
end