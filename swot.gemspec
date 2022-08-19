$:.push File.expand_path('lib', __dir__)
require 'swot'

Gem::Specification.new do |s|
  s.name                  = 'swot'
  s.version               = Swot::VERSION
  s.homepage              = 'https://github.com/leereilly/swot'
  s.license               = 'MIT'
  s.summary               = 'Identify email addresses or domains names that belong to colleges or universities.'
  s.description           = 'Identify email addresses or domains names that belong to colleges or universities. Help automate the process of approving or rejecting academic discounts.'
  s.email                 = 'lee@leereilly.net'
  s.authors               = ['Lee Reilly']

  s.required_ruby_version = Gem::Requirement.new('>= 3.1.2')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'naughty_or_nice', '~> 2.0'
  s.add_runtime_dependency 'public_suffix'
end
