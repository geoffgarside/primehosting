Gem::Specification.new do |s|
  s.name = "primehosting"
  s.version = "0.0.2"
  s.summary = "Capistrano recipes for deployment to Primehosting accounts"
  s.homepage = "http://primehosting.co.uk/"
  s.rubyforge_project = "primehosting"
  
  s.authors = ["Geoff Garside", "Anthony Underwood"]
  s.email = "primehosting@geoffgarside.co.uk"
  
  s.files = ["lib/primehosting/database.rb", "lib/primehosting/mongrel.rb", "lib/primehosting/version.rb", "lib/primehosting.rb", "script/destroy", "script/generate", "spec/primehosting_spec.rb", "spec/spec_helper.rb", "README", "LICENCE", "History.txt"]
  
  s.has_rdoc = true
  s.add_dependency "capistrano", ">= 2.0.0"
  s.add_dependency "highline", ">= 1.4.0"
  s.extra_rdoc_files = ["README", "History.txt", "LICENCE"]
end
