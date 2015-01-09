module TwitterBootstrapCombo
  module ViewHelpers
    # Accepts a container and return a string of combo_box items. If +selected+
    # is specified, the corresponding item is marked as active.
    def options_for_combo_box(container, selected = nil)
      return container if String === container

      container.map do |element|
        if Array === element then
          text, value = element
        else
          text, value = element, element
        end
        css_class = []
        if selected == value then
          css_class << "active"
        end
        content_tag(:li, :class => css_class.join(" ")) do
          link_to(text, '#', :class => "combo_box_item", :data => { :value => value })
        end
      end.join().html_safe
    end

    # Returns a string of combo_box items that have been compiled by iterating
    # over the +collection+ and assigning the result of the call to the
    # +value_method+ as the item value and the +text_method+ as the item text.
    # If +selected+ is specified, the item with the corresponding value is
    # marked as selected.
    def options_from_collection_for_combo_box(collection, value_method, text_method, selected = nil)
      options = collection.map do |element|
        [ element.send(text_method), element.send(value_method) ]
      end

      options_for_combo_box(options, selected)
    end

    # Returns a complete Twitter Bootstrap widget tailored for accessing a
    # specified attribute (identified by +method+) on an object assigned to the
    # template (identified by +object+) using a Twitter Bootstrap menu with
    # +choices+. Additional options can be passed as a hash with +options+ and
    # +html_options+.
    #
    # Supported +options+:
    # - <tt>:include_blank</tt> - If set to true, an empty option will be created.
    #
    # Supported +html_options+:
    # - None yet
    #
    # Examples:
    #   combo_box(:event, :calendar_id, [ [ "Calendar 1", 1 ], [ "Calendar 2", 2] ])
    #
    #   container(:event, :calendar_id, options_from_collection_for_combo_box(Calendar.all, :id, :name, @event.calendar_id), :include_blank => true)
    def combo_box(object, method, choices, options = {}, html_options = {})
      current_value = self.instance_variable_get("@#{object}").instance_variable_get("@attributes")[method.to_s].value

      current_text = "(None)"
      if Array === choices then
        if ! Array === choices[0] then
          current_text = current_value
        else
          choices.each do |element|
            if current_value == element[1] then
              current_text = element[0]
            end
          end
        end
      end

      hidden_field(object, method) +
      content_tag(:div, :class => "btn-group") do
        link_to(content_tag(:span, strip_tags(current_text), :class => "combo_box_text") + " " + content_tag(:i, "", :class => "fa fa-caret-down"), "#", :class => "btn btn-default dropdown-toggle", :data => { :toggle => "dropdown" }) +
        content_tag(:ul, :class => "dropdown-menu", :data => { :for => "#{object}_#{method}" }) do
          if options[:include_blank] then
            css_class = []
            if current_value == 0 then
              css_class << "active"
            end
            content_tag(:li, :class => css_class.join(" ")) do
              link_to("(None)", '#', :class => "combo_box_item")
            end + content_tag(:li, "", :class => "divider")
          else
            "".html_safe
          end +
          options_for_combo_box(choices, current_value)
        end
      end
    end
  end
end
