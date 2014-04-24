module HarmonyCms
  module Components::Core
    class Video < ShowroomCms::Component

      def video_id
        page_data_with_key('video_id', nil)
      end

      def autoplay
        autoplay = page_data_with_key('autoplay', 'off')
        return 'on' if autoplay.eql?('true')
        autoplay
      end

      def sc_data_link
        page_data_with_key('sc_data_link','')
      end

      def sc_data_event
        page_data_with_key('sc_data_event','')
      end
    end
  end
end