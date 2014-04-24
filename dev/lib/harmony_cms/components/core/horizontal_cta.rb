module HarmonyCms::Components::Core
    class HorizontalCta < ShowroomCms::Component
	  def init
        init_child_components
      end
      def init_child_components
		add_and_init_child_component_if_exists('cq-cta-1')
		add_and_init_child_component_if_exists('cq-cta-2')
      end
	  def align
		page_data_with_key('align', 'center')
	  end
	  def sidebyside
		page_data_with_key('sidebyside', '')
	  end
    end
end
