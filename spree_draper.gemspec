# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_draper'
  s.version     = '2.1.6'
  s.summary     = 'Use Draper gem in Spree without overriding anything'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Jakub Naliwajek'
  s.email     = 'naliwajek@gmail.com'
  s.homepage  = 'https://github.com/naliwajek/spree_draper'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.1.6'
  s.add_dependency 'draper', '~> 1.3.0'
end
