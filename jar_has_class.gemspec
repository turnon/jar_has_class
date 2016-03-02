Gem::Specification.new do |s|
  s.name = %q{jar_has_class}
  s.version = "0.0.3"
  s.date = %q{2016-03-02}
  s.authors = ["Zp Yuan"]
  s.summary = %q{find jar has XXX class in pwd recursively}
  s.files = Dir.glob("bin/*") + Dir.glob("lib/*")
  s.require_paths = ["lib"]
  s.executables = ["jar_has_class"]
  s.add_dependency 'colorize', '~> 0.7.7'
end
