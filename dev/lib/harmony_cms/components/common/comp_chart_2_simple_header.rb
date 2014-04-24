module HarmonyCms
  module Components
    module Common
      class CompChart2SimpleHeader < ShowroomCms::Component

        def init

          init_child_components
        end

        def init_child_components

          add_and_init_child_component_if_exists('cq-text-header')
        end

        def background_color
          page_data_with_key('header_bg', 'grey-bg')
        end

      end
    end
  end
end
