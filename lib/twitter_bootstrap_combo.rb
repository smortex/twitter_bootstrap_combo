require "rails"

module TwitterBootstrapCombo
  module Rails
    if ::Rails.version < "3.1"
      require 'twitter_bootstrap_combo/railties'
    else
      require 'twitter_bootstrap_combo/engine'
    end
  end
end
