lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ghost_schema/version"

Gem::Specification.new do |spec|
  spec.name          = "ghost_schema"
  spec.version       = GhostSchema::VERSION
  spec.authors       = ["meganemura"]
  spec.email         = ["meganemura@users.noreply.github.com"]

  spec.summary       = "Improve development experience of rollbacking Rails missing migrations"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/meganemura/ghost_schema"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
