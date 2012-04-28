# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pbcopy/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Josh Cheek"]
  gem.email         = ["josh.cheek@gmail.com"]
  gem.description   = %q{Replicates OSX commandline utility where piping into pbcopy places things into the clipboard}
  gem.summary       = %q{Use pbcopy in Ruby in the same way you would from the terminal}
  gem.homepage      = "https://github.com/JoshCheek/pbcopy"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "pbcopy"
  gem.require_paths = ["lib"]
  gem.add_dependency 'pasteboard', '~> 1.0'
  gem.version       = Pbcopy::VERSION
end
