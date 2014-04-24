module HarmonyCms
  module Components
    module Common
      class HeroCarousel < ShowroomCms::Component

        attr_accessor :viewport_id

        def init_child_components
          slides.each do |cur|
            if cur && (cur =~ /|/)
              slide_id, container_align, bg_color_class = cur.split("|")
              img_path = "img-" + slide_id
              add_and_init_child_component(img_path) unless page_data_with_key(img_path).blank?
              add_and_init_child_component(slide_id) unless page_data_with_key(slide_id).blank?
            end
          end
        end

        def slide_speed
          page_data_with_key('slide_speed',600).to_i
        end

        def autoslide_speed
          auto_slide = page_data_with_key('auto_slide', false)
          auto_speed = auto_slide ? page_data_with_key("autoslide_speed",5000) : 0
        end

        def slides
            page_data_with_key('slides',[])
        end

        def carousel_name
          page_data_with_key('carousel_name', 'hero-carousel')
        end

        def viewport_id
          @viewport_id = carousel_name + '-carviewport'
        end

      end
    end
  end
end