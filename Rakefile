# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "knife-vmware/version"

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "knife-vmware"
  gem.version = Knife::VMWare::VERSION
  gem.platform = Gem::Platform::RUBY
  gem.homepage = "http://github.com/seryl/knife-vmware"
  gem.license = "MIT"
  gem.summary = %Q{VMware Support for Chef's Knife Command}
  gem.description = gem.summary
  gem.email = "jtoft@zinio.com"
  gem.authors = ["Josh Toft"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = Knife::VMWare::VERSION

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "knife-vmware #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
