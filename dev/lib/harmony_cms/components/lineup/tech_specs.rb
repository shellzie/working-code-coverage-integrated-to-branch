module HarmonyCms
  module Components
    module Lineup
      class TechSpecs < ShowroomCms::Component
        def init_child_components
          add_and_init_child_component("cq-p1") if properties.has_key?("cq-p1")
          add_and_init_child_component("cq-text1") if properties.has_key?("cq-text1")
          add_and_init_child_component("cq-text2") if properties.has_key?("cq-text2")
        end
      end
    end
  end
end
