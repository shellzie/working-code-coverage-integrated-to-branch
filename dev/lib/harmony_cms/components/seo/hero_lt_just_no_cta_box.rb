module HarmonyCms
  module Components
    module Seo
      class HeroLtJustNoCtaBox < ShowroomCms::Component
        def init_child_components
          add_and_init_child_components(%w(cq-image cq-text cq-text2))
          super
        end
      end
    end
  end
end