module HarmonyCms
  module Components
    module Core
      class TabsHeadings < ShowroomCms::Component
        def init_child_components
          add_and_init_child_component("cq-headings1") if properties.has_key?("cq-headings1")
          add_and_init_child_component("cq-tabs1") if properties.has_key?("cq-tabs1")
        end
      end
    end
  end
end
