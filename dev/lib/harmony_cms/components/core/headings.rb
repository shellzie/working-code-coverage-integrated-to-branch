module HarmonyCms

  module Components

    module Core

      class Headings < ShowroomCms::Component
  
        def initialize(name, style, properties, parent, options={})
          super(name, style, properties, parent, options)
        end
  
        def main_heading
          page_data_with_key("main_heading", "").html_safe
        end
  
        def sub_heading
          page_data_with_key("sub_heading", "").html_safe
        end
      end

    end

  end

end
