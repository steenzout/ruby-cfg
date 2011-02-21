require 'rake'

spec = Gem::Specification.new do |s|

  s.name         = 'steenzout-cfg'
  s.version      = '1.0.0'

  s.authors      = ['steenzout']

  s.platform     = Gem::Platform::RUBY

  s.homepage     = 'https://github.com/steenzout/steenzout-cfg'

  s.summary      = 'Steenzout configuration management gem.'
  s.description = <<EOF
This gem provides configuration management functionality through a simple convention.
EOF

  s.has_rdoc     = true
  s.extra_rdoc_files = ["README.textile"]


  s.require_path = 'lib'
  s.files        = FileList["{lib}/**/*"].to_a
  s.test_files   = FileList["{test}/**/*test.rb"].to_a

end
