$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'subscribem/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'subscribem'
  s.version     = Subscribem::VERSION
  s.authors     = ['TODO: Your name']
  s.email       = ['TODO: Your email']
  s.homepage    = 'TODO'
  s.summary     = 'TODO: Summary of Subscribem.'
  s.description = 'TODO: Description of Subscribem.'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.0.3'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl', '4.1.0'
  s.add_dependency 'bcrypt-ruby', '3.1.2'
  s.add_dependency 'warden', '1.2.3'
end
