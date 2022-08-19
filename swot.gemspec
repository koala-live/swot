Gem::Specification.new do |s|
  s.name                  = 'swot'
  s.version               = '0.4.2'
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
end
