module HarmonyCms
  module Components
    module Feature
      class BannerFeaturePage < ShowroomCms::Component

				def init_child_components
          add_and_init_child_component_if_exists("banner_cta_a")
          add_and_init_child_component_if_exists("cq-text")
				end

				def banner_text
					page_data_with_key('banner_text', "").force_encoding('UTF-8').html_safe
				end

      end
    end
  end
end