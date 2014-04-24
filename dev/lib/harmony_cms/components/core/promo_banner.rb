require 'showroom_cms/image_source'


module HarmonyCms

  module Components::Core

    class PromoBanner < ShowroomCms::Component

      attr_reader :image_url, :image_alt, :image_align, :lazy_load, :bg_color, :image_height, :image_width, :text_color

      def init
        image_node = page_data_with_key("image")
        if !image_node.nil? && image_node.has_key?("fileReference")
          image_src =  ShowroomCms::ImageSource.new(image_node["fileReference"])
          @image_url = image_src.src
          @image_height = image_src.length.nil? ? 0 : image_src.length
          @image_width = image_src.width.nil? ? 0 : image_src.width
          @image_alt = image_node.has_key?("alt") ? image_node["alt"] : ""
          @image_align = image_node.has_key?("align") ? image_node["align"] : "center"
          @lazy_load = image_node.has_key?("lazy_load") ? image_node["lazy_load"] : ""
          @image_align = "" if @image_align == "left"
        end
        @bg_color = page_data_with_key("promo_bg_color", "none")
        @bg_color = "" if @bg_color == "none"
        @text_color = page_data_with_key("promo_text_color", "")
        init_child_components
      end

      def init_child_components
        unless page_data_with_key("promo_banner_grid").nil?
          properties["promo_banner_grid"]["sling:resourceType"] = "harmony_cms/components/core/grid" unless properties["promo_banner_grid"].has_key?("sling:resourceType")
          add_and_init_child_component("promo_banner_grid") 
        end
      end
      
      def promo_banner_link
        page_data_with_key('promo_banner_link', '')
      end
      
      def promo_banner_data_link
        page_data_with_key('promo_banner_data_link', '')
      end

      def promo_banner_data_event
        page_data_with_key('promo_banner_data_event', '')
      end

      def promo_banner_disclosure_text
        page_data_with_key('promo_banner_disclosure_text', '').force_encoding("UTF-8").html_safe
      end

      def promo_banner_activation_status
        promotion_status
        #page_data_with_key('trueActivation_of_calendar', '')
      end
    
      #overriding this because it also depends on image. i.e someone can change image without changing the image name.
      def cache_key
        unless @image_url.nil?
          @ck ||= Digest::MD5.hexdigest(@image_url + super)
        else
          @ck ||= super
        end
      end
      
      

      def image_class
        if "true" == lazy_load
          "lazy #{image_align}"
        else
          image_align
        end
      end


      private

      def promotion_status
          output = "deactivated"
          status = page_data_with_key('promo_banner_activation_status', 'deactive') == "active" ? "activated" : "deactivated"
          start_date = DateTime.parse(page_data_with_key('promo_banner_start_date')) unless page_data_with_key('promo_banner_start_date').nil?
          stop_date = DateTime.parse(page_data_with_key('promo_banner_stop_date')) unless page_data_with_key('promo_banner_stop_date').nil?
          current_date = DateTime.now
          if !Rails.env.eql?("production") && !Rails.env.eql?("lvdc_production")
            if page.request.params["currentDate"].present?
              current_date = Date.parse(page.request.params["currentDate"])
            end
          end
          frequency = page_data_with_key("is_activation_enabled","always");
          if !status.eql?("deactivated") && !stop_date.nil? && !start_date.nil? && current_date >= start_date && current_date <= stop_date
            case frequency
              when "always"
                output = "activated"
              when "weekly"
                begin
                  recurrence_days = page_data_with_key('promo_banner_recurrence', '')
                  recurrence_interval = page_data_with_key('weekly_recurrence_interval',nil)
                  day_of_week = current_date.wday
                      output = "activated"  if recurrence_days.include?(day_of_week.to_s()) && ((recurrence_interval.nil?) || (((current_date.cweek - start_date.cweek) % recurrence_interval.to_i)==0))
                  end
              when "monthly_by_days"
                begin
                  monthly_days_frequency = page_data_with_key("monthly_days_frequency",nil);
                  days_of_week = page_data_with_key("days_dropdown",nil);
                  day_of_week = current_date.wday
                  if days_of_week.include?(day_of_week.to_s)
                     if monthly_days_frequency.include?((((current_date.day - 1) / 7) + 1).to_s)
                       output = "activated"
                     elsif monthly_days_frequency.include?("last")
                       last_date_month = Date.new(current_date.year, current_date.month, -1)
                       last_date_month -= (last_date_month.wday - day_of_week) % 7
                       output = "activated" if current_date == last_date_month
                     end
                  end
                end

              when "monthly_by_date"
                begin
                  recurrence_interval = page_data_with_key('monthly_recurrence_interval',nil)
                  output = "activated" if ((recurrence_interval.nil?) && (current_date.mday) == start_date.mday)  || ((!recurrence_interval.nil?) && (current_date.mday) == recurrence_interval.to_i)
                end
            end
          end
          output
        end

    end

  end

end
