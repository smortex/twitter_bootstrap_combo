module TwitterBootstrapCombo
  module ViewHelpers
    def combo_box(object, method, choices, options = {}, html_options = {})
      current_value = self.instance_variable_get("@#{object}").instance_variable_get("@attributes")[method.to_s].to_i

      curent = choices.select { |c| c[1] == current_value }.first
      if curent.nil? then
        current_text = "(None)"
      else
	current_text = curent[0]
      end

      hidden_field(object, method) +
      content_tag(:div, :class => "btn-group") do
	link_to(content_tag(:span, strip_tags(current_text), :class => "combo_box_text") + " " + content_tag(:i, "", :class => "icon-caret-down"), "#", :class => "btn dropdown-toggle", :data => { :toggle => "dropdown" }) +
	content_tag(:ul, :class => "dropdown-menu", :data => { :for => "#{object}_#{method}" }) do
	  if options[:include_blank] then
	    css_class = []
	    if current_value == 0 then
	      css_class << "active"
	    end
	    content_tag(:li, :class => css_class.join(" ")) do
	      link_to("(None)", '#', :class => "combo_box_item")
	    end
	  else
	    "".html_safe
	  end +
	  choices.collect do |o|
	    css_class = []
	    if current_value == o[1] then
	      css_class << "active"
	    end
	    content_tag(:li, :class => css_class.join(" ")) do
	      link_to(o[0], '#', :class => "combo_box_item", :data => { :value => o[1] })
	    end
	  end.join().html_safe
	end
      end
    end
  end
end
