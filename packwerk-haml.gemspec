# frozen_string_literal: true

require_relative "lib/packwerk_haml/version"

Gem::Specification.new do |spec|
  spec.name = "packwerk-haml"
  spec.version = PackwerkHaml::VERSION
  spec.authors = ["Richard Marbach"]
  spec.email = ["rmarbach@gmail.com"]

  spec.summary = "HAML support for packwerk"
  spec.description = "HAML support for packwerk"
  spec.homepage = "https://github.com/richardmarbach/packwerk-haml"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/richardmarbach/packwerk-haml"
  spec.metadata["changelog_uri"] = "https://github.com/richardmarbach/packwerk-haml"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    %x(git ls-files -z).split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # For Ruby parsing
  spec.add_dependency("ast")
  spec.add_dependency("parser")

  # For HAML parsing
  spec.add_dependency("haml", "~>6.2")
end
