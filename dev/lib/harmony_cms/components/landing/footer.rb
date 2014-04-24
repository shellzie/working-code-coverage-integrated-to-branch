module HarmonyCms
  module Components::Landing
    class Footer < ShowroomCms::Component
      def init_child_components
        add_and_init_child_components_if_exists(%w(cq-watercooler cq-legal-footer))
      end

    end
  end
end
#Just a placeholder as of now, add logic if anything changes.