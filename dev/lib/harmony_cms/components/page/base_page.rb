module HarmonyCms
  module Components
    module Page
      class BasePage < ShowroomCms::PageComponent
        include HarmonyCms::Components::Page::LivePerson
        include HarmonyCms::Components::Page::DfaTracking

        def layout
          File.join('harmony_cms', 'components', 'page', 'base_page')
        end

        def view
          File.join('harmony_cms', 'components', 'page', 'base_page')
        end

        def body_template
          File.join('harmony_cms', 'components', 'page', 'base_page', 'body')
        end

        def page_title
          title = page_data_with_key('pageTitle', nil)
          title = page_data_with_key('jcr:title', "") if title.nil?
          title.force_encoding("UTF-8").html_safe
        end

        def meta_tags
          page_data_with_key("meta_tags", "")
        end

        def description
          page_data_with_key("jcr:description", "")
        end

        def viewport?
          page_data_with_key("enable_responsive_viewport", "false") == "true" ? true : false
        end

        def robots
          page_data_with_key("robots", "")
        end

        def register?
          page_registry =  page_data_with_key("registry", "false")
          if (!page_registry.eql?("false"))
              enable_page_registry = page_registry["register"] == "true" ? true : false
              @page_id =  page_registry["page_id"]
          end
          enable_page_registry
        end

        def page_id
         @page_id
        end

        def canonical
          page_data_with_key("canonical_url", "")
        end

        def enable_survey?
          page_data_with_key("survey", "false") == "true" ? true : false
        end

        #Feedback card is included if the page property is un checked and exluded if checked
        def enable_feedbackcard?
          page_data_with_key("feedbackcard", "false") == "false" ? true : false
        end

        def do_channel_attribution?
          page_data_with_key("do_channel_attribution", "false") == "true" ? true : false
        end

        def enable_google_analytics?
          page_data_with_key("enable_ga_analytics", "false") == "true" ? true : false
        end

        def enable_optimizely_for_global?
          page_data_with_key("enable_optimizely", "false") == "true" ? true : false
        end

        def enable_geo_targeting?
          page_data_with_key("enable_geo_targeting", "false") == "true" ? true : false
        end

        def enable_site_catalyst?
          page_data_with_key("enable_site_catalyst", "false") == "true" ? true : false
        end

        def sc_version
          page_data_with_key("sc_version", 14).to_i
        end

        def enable_latest_site_catalyst?
            if enable_site_catalyst? & (sc_version > 14) then
              true
            else
              false
            end

        end

        def site_name
          page_data_with_key("site_name", "")
        end

        def site_group
          page_data_with_key("site_group", "")
        end

        def site_host
          page_data_with_key("site_host", "")
        end

        def products
          page_data_with_key("products", "").html_safe
        end

        def init_child_components
          add_and_init_child_component("cq-container") if properties.has_key?("cq-container")
          super
        end
      end
    end
  end
end
