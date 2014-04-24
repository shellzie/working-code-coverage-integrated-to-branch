module HarmonyCms

  module Components::Core

    class Grid < ShowroomCms::Component
      def initialize(*args)
        super
      end

      def grid_styles
        page_data_with_key("grid_style", "span8-span4").split("-")
      end

      def grid_columns
        columns = Hash.new
        grid_styles.each_index do | index |
          col_no = grid_styles[index].gsub(/[^\d]/, '')
          if (col_no.to_i <= 2)
            resp_mo_col_value = "col-xs-2"
          else
            resp_mo_colvalue =  "col-xs-#{col_no}"
          end
          columns[index] = {
                             "non-resp" => "span#{col_no}",
                             "resp-dt" =>  "col-md-#{col_no}",
                             "resp-tb" =>  "col-sm-#{col_no}",
                             "resp-mo" =>  resp_mo_col_value
                            }
          end
        columns
      end

      def init_child_components
        grid_styles.each_index do |index|
          if properties.has_key?("col#{index}")
            #TODO: Hack to get around the fact that a container component could not have sling:resourceType
            properties["col#{index}"]["sling:resourceType"] = "harmony_cms/components/core/container" unless properties["col#{index}"].has_key?("sling:resourceType")
            component_name = "col#{index}"
            add_and_init_child_component(component_name)
          end
        end
      end

    end

  end

end
