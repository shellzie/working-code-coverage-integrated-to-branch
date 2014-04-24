module HarmonyCms
  module Components::Core
    class Box960 < ShowroomCms::Component
      def init_child_components
        add_and_init_child_component_if_exists("box960")
      end
    end
  end
end
#Just a placeholder as of now, add logic if anything changes.