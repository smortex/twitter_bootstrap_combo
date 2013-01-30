require "twitter_bootstrap_combo/view_helpers"

module TwitterBootstrapCombo
  class Railtie < Rails::Railtie
    initializer "twitter_bootstrap_combo" do |app|
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
