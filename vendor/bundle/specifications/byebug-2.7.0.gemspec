# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "byebug"
  s.version = "2.7.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Rodriguez", "Kent Sibilev", "Mark Moseley"]
  s.date = "2014-02-24"
  s.description = "Byebug is a Ruby 2 debugger. It's implemented using the\n    Ruby 2 TracePoint C API for execution control and the Debug Inspector C API\n    for call stack navigation.  The core component provides support that\n    front-ends can build on. It provides breakpoint handling and bindings for\n    stack frames among other things and it comes with an easy to use command\n    line interface."
  s.email = "deivid.rodriguez@mail.com"
  s.executables = ["byebug"]
  s.extensions = ["ext/byebug/extconf.rb"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["bin/byebug", "README.md", "ext/byebug/extconf.rb"]
  s.homepage = "http://github.com/deivid-rodriguez/byebug"
  s.licenses = ["BSD"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.0.14"
  s.summary = "Ruby 2.0 fast debugger - base + cli"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<columnize>, ["~> 0.3"])
      s.add_runtime_dependency(%q<debugger-linecache>, ["~> 1.2"])
      s.add_development_dependency(%q<rake>, ["~> 10.1"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 0.9"])
      s.add_development_dependency(%q<mocha>, ["~> 1.0"])
      s.add_development_dependency(%q<minitest>, ["~> 5.2"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.7"])
    else
      s.add_dependency(%q<columnize>, ["~> 0.3"])
      s.add_dependency(%q<debugger-linecache>, ["~> 1.2"])
      s.add_dependency(%q<rake>, ["~> 10.1"])
      s.add_dependency(%q<rake-compiler>, ["~> 0.9"])
      s.add_dependency(%q<mocha>, ["~> 1.0"])
      s.add_dependency(%q<minitest>, ["~> 5.2"])
      s.add_dependency(%q<coveralls>, ["~> 0.7"])
    end
  else
    s.add_dependency(%q<columnize>, ["~> 0.3"])
    s.add_dependency(%q<debugger-linecache>, ["~> 1.2"])
    s.add_dependency(%q<rake>, ["~> 10.1"])
    s.add_dependency(%q<rake-compiler>, ["~> 0.9"])
    s.add_dependency(%q<mocha>, ["~> 1.0"])
    s.add_dependency(%q<minitest>, ["~> 5.2"])
    s.add_dependency(%q<coveralls>, ["~> 0.7"])
  end
end
