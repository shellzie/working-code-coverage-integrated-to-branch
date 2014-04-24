module HarmonyCms
  module Components::Landing
    class Header < ShowroomCms::Component
      def init_child_components
        add_and_init_child_component_if_exists("cq-textimage")
      end
    end
  end
end
#Just a placeholder as of now, add logic if anything changes.