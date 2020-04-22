# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform = Gem::Platform::RUBY
  s.name = 'refinerycms-sport_rowings'
  s.version = '1.0'
  s.description = 'Ruby on Rails Sport Rowings extension for Refinery CMS'
  s.date = '2020-04-22'
  s.summary = 'Sport Rowings extension for Refinery CMS'
  s.authors =
    s.require_paths = %w(lib)
  s.files = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency 'refinerycms-core', '~> 4.0.3'
  s.add_dependency 'acts_as_indexed', '~> 0.8.0'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 4.0.3'
end
