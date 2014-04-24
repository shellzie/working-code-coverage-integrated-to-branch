module HarmonyCms
  module Components
    module Core
      class TextIcon < ShowroomCms::Component
        def init_child_components
          add_and_init_child_component("cq-image") if properties.has_key?("cq-image")
          add_and_init_child_component("cq-text") if properties.has_key?("cq-text")
        end
      end
    end
  end
end
