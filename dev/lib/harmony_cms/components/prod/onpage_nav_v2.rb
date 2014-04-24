module HarmonyCms
  module Components::Prod
    class OnpageNavV2 < ShowroomCms::Component
      def no_of_links
        page_data_with_key('no_of_links', 4).to_i
      end

      def init_child_components
        add_and_init_child_component_if_exists("cta")
        add_and_init_child_component_if_exists("cq-headings")
        (0..no_of_links-1).each do |i|
          puts "NO of LInks", i
          add_and_init_child_component_if_exists("icon-#{i}")
          add_and_init_child_component_if_exists("title-#{i}")
          add_and_init_child_component_if_exists("icon-hover#{i}")
        end
      end

    end
  end
end