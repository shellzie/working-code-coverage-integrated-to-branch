module HarmonyCms
  module Components
    module Core
      class Divider < ShowroomCms::Component

        def divider_style
          page_data_with_key('divider_style', '').force_encoding('UTF-8').html_safe
        end

      end
    end
  end
end
