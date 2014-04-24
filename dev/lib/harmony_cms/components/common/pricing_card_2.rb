module HarmonyCms
  module Components
    module Common
      class PricingCard2 < ShowroomCms::PricingComponent

        def init
          init_child_components
        end

        def init_child_components
            add_and_init_child_component_if_exists('cq-content-header')
            add_and_init_child_component_if_exists('cq-content-container-0')
            add_and_init_child_component_if_exists('cq-content-container-1')
            add_and_init_child_component_if_exists('cq-content-container-2')
            add_and_init_child_component_if_exists('cq-content-burst-0')
            add_and_init_child_component_if_exists('cq-content-burst-1')
            add_and_init_child_component_if_exists('cq-content-burst-2')
            add_and_init_child_component_if_exists('cq-content-pricing-0')
            add_and_init_child_component_if_exists('cq-content-pricing-1')
            add_and_init_child_component_if_exists('cq-content-pricing-2')
            add_and_init_child_component_if_exists('cq-content-list-0')
            add_and_init_child_component_if_exists('cq-content-list-1')
            add_and_init_child_component_if_exists('cq-content-list-2')
            add_and_init_child_component_if_exists('cq-content-cta-0')
            add_and_init_child_component_if_exists('cq-content-cta-1')
            add_and_init_child_component_if_exists('cq-content-cta-2')
        end

        #
        #
        # Get the number of pricing columns for this card
        def num_of_prices
          page_data_with_key('num_of_prices', '1').to_i
        end

        def is_enabled_adv_edit
          page_data_with_key('is_enabled_adv_edit', false)
        end

        # Evenly distribute the column with based on the number of price columns selected
        def pricing_card_content_width

          case num_of_prices
            when 1
              "100%" # Single column pricing card
            when 2
              "50%"  # Two column pricing card
            when 3
              "33.3%" # Three column pricing card
            else
              "100%"
          end
        end

        # clean this shit up when you have time
        def is_enabled_burst_0
          page_data_with_key('is_enabled_burst_0', false)
        end

        def is_enabled_burst_1
          page_data_with_key('is_enabled_burst_1', false)
        end

        def is_enabled_burst_2
          page_data_with_key('is_enabled_burst_2', false)
        end

        def burst_placement_0
          page_data_with_key('burst_placement_0', 'right')
        end

        def burst_placement_1
          page_data_with_key('burst_placement_1', 'right')
        end

        def burst_placement_2
          page_data_with_key('burst_placement_2', 'right')
        end

        def burst_pushdown_0
          " pricing-content-burst-wrapper-push-down" unless page_data_with_key('burst_pushdown_0').nil?
        end

        def burst_pushdown_1
          " pricing-content-burst-wrapper-push-down" unless page_data_with_key('burst_pushdown_1').nil?
        end

        def burst_pushdown_2
          " pricing-content-burst-wrapper-push-down" unless page_data_with_key('burst_pushdown_2').nil?
        end

      end
    end
  end
end
