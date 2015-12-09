Gem::Specification.new do |s|
  s.name          = 'pi-station'
  s.version       = File.read(File.expand_path('../VERSION', __FILE__)).strip
  s.date          = '2015-12-08'
  s.summary       = 'Raspberry Pi Weather Reporter'
  s.description   = 'Reports values around the Raspberry Pi to Elasticsearch'
  s.authors       = 'Philippe Haessig'
  s.email         = 'phil@neckhair.ch'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.homepage      = 'http://rubygems.org/gems/pi-station'
  s.license       = 'MIT'

  s.add_runtime_dependency 'commander', '~> 4.3.5'
  s.add_development_dependency 'rspec', '~> 3.4.0'
  s.add_development_dependency 'timecop'
end
