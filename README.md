# TwitterBootstrapCombo

Advanced combo-box using Twitter-Bootstrap

## Installation

Add this line to your application's Gemfile:

    gem 'twitter_bootstrap_combo'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twitter_bootstrap_combo

## Usage

Add this line to `app/assets/javascripts/application.js`:

~~~js
//= twitter_bootstrap_combo
~~~

Then in your views, use:

~~~erb
<%= combo_box(:calendar, :parent_id, Calendar.all.collect { |c| [ (content_tag(:i, "", :class => "icon-angle-right") * c.level + c.name).html_safe, c.id ] }, :include_blank => true) %>
~~~

to produce:

~~~html
<input id="calendar_parent_id" name="calendar[parent_id]" type="hidden" value="6" /><div class="btn-group"><a href="#" class="btn dropdown-toggle" data-toggle="dropdown"><span class="combo_box_text">Child 1</span> <i class="icon-caret-down"></i></a><ul class="dropdown-menu" data-for="calendar_parent_id"><li class=""><a href="#" class="combo_box_item">(None)</a></li><li class=""><a href="#" class="combo_box_item" data-value="5">Root</a></li><li class="active"><a href="#" class="combo_box_item" data-value="6"><i class="icon-angle-right"></i>Child 1</a></li><li class=""><a href="#" class="combo_box_item" data-value="8"><i class="icon-angle-right"></i><i class="icon-angle-right"></i>SubChild 1</a></li><li class=""><a href="#" class="combo_box_item" data-value="9"><i class="icon-angle-right"></i><i class="icon-angle-right"></i>SubChild 2</a></li><li class=""><a href="#" class="combo_box_item" data-value="7"><i class="icon-angle-right"></i>Child 2</a></li></ul></div>
~~~

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
