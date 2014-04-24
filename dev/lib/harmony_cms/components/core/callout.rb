module HarmonyCms::Components::Core
    class Callout < ShowroomCms::Component
      def init
        init_child_components
      end
      def init_child_components
        add_and_init_child_component_if_exists('callout-container')
      end	  
	  def bg_color
		page_data_with_key('bg_color', 'bg-white')
	  end	
    end
  end

