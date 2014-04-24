module HarmonyCms

  module Components

    module Core

      class Footer < ShowroomCms::Component
  
        def init_child_components
          add_and_init_child_components(%w(cq-site-footer cq-watercooler cq-legal-footer))
        end
  
      end 
  
    end

  end

end
