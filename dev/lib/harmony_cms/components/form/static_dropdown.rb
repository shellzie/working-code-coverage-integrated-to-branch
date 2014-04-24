require 'ostruct'
module HarmonyCms
  module Components
    module Form
      class StaticDropdown < ShowroomCms::Component

        def dropdown_title
          page_data_with_key("dropdown_title", "Select")
        end

        def list_type
          page_data_with_key("list_type", "")
        end

        def manual_list
          page_data_with_key("manual_data_list", "")

        end

        def json_path
          page_data_with_key("json_path", "")
        end

        def collection_for_dropdown
          json = eval(read_cq_resource(json_path))
          json.inject([]) do |arr, e|
            return "" if e[:name].blank? or e[:value].blank?
            arr << OpenStruct.new(:name => e[:name], :value => e[:value])
          end
        end


      end
    end
  end
end