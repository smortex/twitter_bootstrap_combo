# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitter_bootstrap_combo/version'

Gem::Specification.new do |gem|
  gem.name          = "twitter_bootstrap_combo"
  gem.version       = TwitterBootstrapCombo::VERSION
  gem.authors       = ["Romain Tartiere"]
  gem.email         = ["romain@blogreen.org"]
  gem.description   = %q{Advanced combo-box using Twitter-Bootstrap}
  gem.summary       = %q{twitter_bootstrap_combo workarounds limitation of SELECT tags in Rails application and provide a coherent look & feel through Twitter-Bootstraped applications.}
  gem.homepage      = "https://github.com/smortex/twitter_bootstrap_combo"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
