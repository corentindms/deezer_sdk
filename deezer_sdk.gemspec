lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "deezer_sdk/version"

Gem::Specification.new do |spec|
  spec.name          = "deezer_sdk"
  spec.version       = DeezerSdk::VERSION
  spec.authors       = ["Corentin Descamps"]
  spec.email         = ["corentin.descamps@epitech.eu"]

  spec.summary       = %q{Deezer SDK}
  spec.description   = %q{This gem is a simple wrapper around deezer API}
  spec.homepage      = "https://github.com/corentindms/deezer_sdk"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage + "/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "httparty", "~> 0.18"
  spec.add_runtime_dependency "deep_merge", "~> 1.2"
end
