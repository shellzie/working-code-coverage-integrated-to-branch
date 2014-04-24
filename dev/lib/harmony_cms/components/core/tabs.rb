module HarmonyCms
  module Components
    module Core
      class Tabs < ShowroomCms::Component

        def active_tab
          page_data_with_key("active_tab", "1")
        end
        def has_text_image
          page_data_with_key("has_text_image","false")
        end

        def stabclass
          (page_data_with_key("tab_text_4","").eql?("")) ? " tabwidth2 " : " tabwidth1 "
        end

        def tab_text
          tabs = {}
          (1..6).each do |i|
            my_key = "tab_text_#{i}"
            if properties.has_key?(my_key)
              tabs[my_key] = page_data_with_key(my_key)
            end
          end
          return tabs
        end

        def tab_sc
          tabs_sc = {}
          (1..6).each do |i|
            sc_key = "tracking_tab_#{i}"
            if properties.has_key?(sc_key)
              tabs_sc[sc_key] = " data-wa-link=#{page_data_with_key(sc_key)} "
            end
          end
          return tabs_sc
        end

        def has_text_image
          page_data_with_key("has_text_image", "") == "true" ? "tab-icons" : ""
        end
      end
    end
  end
end
