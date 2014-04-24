module HarmonyCms

  module Components

    module Core

      class Htmlblock < ShowroomCms::Component
  
        attr_reader :content
  
        def init
          content_path = ensure_design_data_with_key('contentPath')
          @content = ShowroomCms.cache.fetch "#{content_path}" do
            ShowroomCms::CqConnector.retrieve_utf8_encoded_content(content_path)
          end
          @content.html_safe unless @content.nil?
        end
  
      end

    end

  end

end
