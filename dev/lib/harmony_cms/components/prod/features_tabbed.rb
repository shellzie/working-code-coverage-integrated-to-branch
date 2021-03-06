module HarmonyCms
  module Components
    module Prod
      class FeaturesTabbed < ShowroomCms::Component
        attr_reader :items_list, :item_tokens
        def init
          @items_list = %w("general-business" "contractor")
          item_token = %w()
          cq_tabs = page_data_with_key("cq-tabs")
          (0..5).each { |index|
            j = index + 1
            if cq_tabs.has_key?("tab_text_#{j}")
              item_tokens = cq_tabs["tab_text_#{j}"].downcase.split(/[\s&_,]+/)
              @items_list[index] =  item_tokens.join("-");
            end
          }
          init_child_components
        end
        def heading
          page_data_with_key('heading', 'Lets not waste time. The features.')
        end
        def active_option
          page_data_with_key('active_option', '1')
        end
        def init_child_components
          (0...@items_list.length).each do |index|
            component_name = "cq-features1-#{index}"
            add_and_init_child_component(component_name)
          end
          add_and_init_child_component("cq-tabs")
        end
      end
    end
  end
end