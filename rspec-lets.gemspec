Gem::Specification.new do |s|
  s.name        = "rspec-lets"
  s.version     = File.read('VERSION').strip
  s.authors     = ["Brent Vatne"]
  s.email       = %w[brent.vatne@gmail.com]
  s.homepage    = "https://github.com/brentvatne/rspec-lets"
  s.summary     = "lets and lets! to declare multiple variables in one call."
  s.description = "lets and lets! to declare multiple variables in one call."

  s.files = Dir["{lib}/**/*"] + %w{README.md}
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "activesupport", ">= 2.3.8"
end
