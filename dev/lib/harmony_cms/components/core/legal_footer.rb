module HarmonyCms::Components::Core
    class LegalFooter < ShowroomCms::Component
        def init_child_components
          add_and_init_child_components(%w(cq-legal-footer))
        end  
    end
end
