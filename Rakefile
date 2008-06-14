require 'rubygems'
require 'rake'

## Configuration
GEM_NAME = "primehosting"
SUMMARY  = "Capistrano recipes for deployment to Primehosting accounts"
HOMEPAGE = "http://primehosting.co.uk/"
AUTHORS = ["Geoff Garside", "Anthony Underwood"]
EMAIL = "primehosting@geoffgarside.co.uk"

## Obtained settings
require './lib/primehosting/version'
VER = Primehosting::VERSION::STRING
FILES = Dir["lib/**/*.rb", "script/**/*", "spec/**/*.rb", 
            "README", "LICENCE", "History.txt"]

## Tasks
namespace :gemspec do
  desc "Creates the .gemspec file"
  task :generate do
    File.open("#{GEM_NAME}.gemspec", "w") do |f|
      f.write <<-EOF
Gem::Specification.new do |s|
  s.name = "#{GEM_NAME}"
  s.version = "#{VER}"
  s.summary = "#{SUMMARY}"
  s.homepage = "#{HOMEPAGE}"
  s.rubyforge_project = "#{GEM_NAME}"
  
  s.authors = #{AUTHORS.inspect}
  s.email = "#{EMAIL}"
  
  s.files = #{FILES.inspect}
  
  s.has_rdoc = true
  s.add_dependency "capistrano", ">= 2.0.0"
  s.add_dependency "highline", ">= 1.4.0"
  s.extra_rdoc_files = ["README", "History.txt", "LICENCE"]
end
EOF
    end
  end
  
  desc "Removes the .gemspec file"
  task :destroy do
    File.unlink("#{GEM_NAME}.gemspec") if File.exists?("#{GEM_NAME}.gemspec")
  end
end

task :package do
  spec = Gem::Specification.load("#{GEM_NAME}.gemspec")
  Gem::Builder.new(spec).build
end

task :clean do
  File.unlink("#{GEM_NAME}-#{VER}.gem")
end