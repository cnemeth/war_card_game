# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'war/version'

Gem::Specification.new do |s|
  s.name        = 'csn_war'
  s.version     = CsnWar.version
  s.authors     = ["Csaba S. Nemeth"]
  s.email       = 'cnemeth9@gmail.com'

  s.date        = '2016-07-01'
  s.summary     = "War card game"
  s.description = "War card game simulation for 2, 3 or 4 players"
  s.homepage    = 'http://rubygems.org/gems/csn_war'
  s.license     = 'MIT'

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.licenses = ['MIT']

  s.required_ruby_version = "~> 2.3.1"
  s.required_rubygems_version = ">= 2.5.6"

  s.add_development_dependency "bundler", "~> 1.11"
  s.add_development_dependency "rake", "~> 11.2"
  s.add_development_dependency "pry", "~> 0.10"
  s.add_development_dependency "pry-byebug", "~> 3.4"
  s.add_development_dependency "rspec", "3.5"
  s.add_development_dependency "faker", "~> 1.6"
  s.add_development_dependency "awesome_print", "~> 1.6"
  s.add_development_dependency "timecop", "~> 0.8"
  s.add_development_dependency "simplecov", "~> 0.10"

  s.add_runtime_dependency 'faker', "~>1.6"
end
