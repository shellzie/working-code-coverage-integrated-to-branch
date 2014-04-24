module HarmonyCms
  module Components
    module Home
      class HeroCtaBox < ShowroomCms::Component
        def heading
          page_data_with_key('h1', 'Enter your H1')
        end

        def p1_text
          page_data_with_key('p1', 'Enter the p1 text')
        end

        def init_child_components
          add_and_init_child_components_if_exists(%w(cq-text))
          add_and_init_child_components_if_exists(%w(cq-cta))
        end
      end
    end
  end
end