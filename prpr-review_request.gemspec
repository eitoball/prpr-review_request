# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prpr/review_request/version'

Gem::Specification.new do |spec|
  spec.authors = ['Eito Katagiri']
  spec.files = [
    'Dockerfile',
    'LICENSE.txt',
    'Rakefile',
    'README.md',
    'lib/prpr/action/review_request/requested.rb',
    'lib/prpr/handler/review_request.rb',
    'lib/prpr/review_request.rb',
    'lib/prpr/review_request/version.rb',
    'prpr-review_request.gemspec'
  ]
  spec.name = 'prpr-review_request'
  spec.summary = 'Prpr plugin to notify when a pull request review is requested, or when a review request is removed'
  spec.version = Prpr::ReviewRequest::VERSION

  spec.description = 'Prpr plugin to notify when a pull request review is requested, or when a review request is removed'
  spec.email = ['eitoball@gmail.com']
  spec.homepage = 'https://github.com/eitoball/prpr-review_request'
  spec.license = 'MIT'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'test-unit'
  spec.add_development_dependency 'test-unit-rr'
  spec.add_runtime_dependency 'prpr'
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.3.0'

  spec.test_files = [
    'test/lib/prpr/action/review_request/test_requested.rb',
    'test/test_helper.rb'
  ]
end
