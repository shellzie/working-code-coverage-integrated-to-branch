module HarmonyCms
  module Components::Core
    class Flash < ShowroomCms::Component
      attr_reader :flash_path_url, :preview_image_url, :video_icon_url

      def init
        begin
        flash_path = page_data_with_key('flash_path', '')
        preview_image_path = page_data_with_key('preview_image', '')
        video_play_icon_path = page_data_with_key('video_play_icon', '')

        flash_source = FlashSource.new(flash_path)
        image_preview = ShowroomCms::ImageSource.new(preview_image_path)
        play_icon = ShowroomCms::ImageSource.new(video_play_icon_path)

        @preview_image_url = "/showroom_cms/image#{image_preview.file_resource}"
        @video_icon_url = "/showroom_cms/image#{play_icon.file_resource}"
        @flash_path_url = flash_source.src
        end
      end

      def inline_height
        page_data_with_key('inline_height', '230')
      end

      def inline_width
        page_data_with_key('inline_width', '410')
      end

      def varinlineheight
        inline_height.to_i/2 - 36
      end

      def varinlinewidth
        inline_width.to_i/2 -36
      end

      def div_id
        flash_path_url.gsub(/\/|\./, "_")
      end

      def preview_poster
        page_data_with_key('preview_poster', 'off')
      end

    end
  end
end
