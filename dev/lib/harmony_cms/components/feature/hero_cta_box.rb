module HarmonyCms
  module Components
    module Feature
      class HeroCtaBox < ShowroomCms::Component
        def init_child_components
          add_and_init_child_component_if_exists("cq-text")
          add_and_init_child_component_if_exists("cq-text2")
          add_and_init_child_component_if_exists("cq-cta")
        end
      end
    end
  end
end