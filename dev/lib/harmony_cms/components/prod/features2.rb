module HarmonyCms
  module Components::Prod
		class Features2 < ShowroomCms::Component

			def init_child_components
        if properties.has_key?("image_col2")
          add_and_init_child_component("image_col2")
        end
				if properties.has_key?("cta_opt")
					add_and_init_child_component("cta_opt")
				end
			end

      def is_header
        page_data_with_key('is_header', 'false')
      end

      def header_col1
        page_data_with_key('header_col1', '').force_encoding('UTF-8').html_safe
      end

      def header_col2
        page_data_with_key('header_col2', '').force_encoding('UTF-8').html_safe
      end

      def id_features
        id_features = is_header.eql?("true") ? ' id=features' : '';
      end

      def bar_data
        return page_data_with_key('bar_data', ['50% please enter content'])
      end

      def num_bars
        return bar_data.length
      end

      def bar_percent
        bar_percent = {}
        (0..num_bars-1).each do |i|
          # split bar_data in two strings
          # create percentage. eg) '50% please enter content' outputs '50'
          bar_percent[i] = bar_data[i].split("%")[0].strip;
        end
        return bar_percent
      end

      def bar_text
        bar_text = {}
        (0..num_bars-1).each do |i|
          # split bar_data in two strings
          # create description. eg) '50% please enter content' outputs 'please enter content'
          bar_text[i] = bar_data[i].split("%")[1].strip;
        end
        return bar_text
      end

      def is_cta_and_label
        page_data_with_key('is_cta_and_label', 'false')
      end
      def cta_label
        page_data_with_key('cta_label', '').force_encoding('UTF-8').html_safe
      end

		end
  end
end
