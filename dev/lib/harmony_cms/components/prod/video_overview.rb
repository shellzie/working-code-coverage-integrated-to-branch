module HarmonyCms
  module Components
    module Prod
      class VideoOverview < ShowroomCms::Component

        def init_child_components
          add_and_init_child_component("cq-video")
        end

        def sec_header
          page_data_with_key("section_header","Enter your h2").html_safe
        end

        def sec_text
          page_data_with_key("section_text","Enter your text").html_safe
        end

        def link_text
          page_data_with_key("link_text","")
        end

        def link_url
          page_data_with_key("link_url","")
        end

        def link_target
          page_data_with_key("link_target","")
        end

        def sc_data_link
          page_data_with_key('sc_data_link','')
        end

        def sc_data_event
          page_data_with_key('sc_data_event','')
        end

        def modal_content_path
          page.url_from_cq_page_path(page_data_with_key('modal_content_path',''))
        end

        def display_link?
          (link_text.empty? || link_url.empty? || link_target.empty? || modal_content_path.present?) ? false : true
        end

        def display_modal?
          (link_text.empty? || link_target.empty? || modal_content_path.empty?)? false : true
        end
      end
    end
  end
end
