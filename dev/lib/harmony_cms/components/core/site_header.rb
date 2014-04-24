module HarmonyCms::Components::Core
	class SiteHeader < ShowroomCms::Component
        def init_child_components
          #init cq-nav
          add_and_init_child_components(%w(cq-nav))
        end
    end
end
