require "twitter_bootstrap_combo/view_helpers"

module TwitterBootstrapCombo
  module Rails
    class Engine < ::Rails::Engine
      initializer "twitter_bootstrap_combo" do |app|
        ActionView::Base.send :include, TwitterBootstrapCombo::ViewHelpers
      end
    end
  end
end
