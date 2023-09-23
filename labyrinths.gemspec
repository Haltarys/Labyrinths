# frozen_string_literal: true

require_relative "lib/labyrinths/version"

Gem::Specification.new do |spec|
  spec.name = "labyrinths"
  spec.version = Labyrinths::VERSION
  spec.authors = ["Haltarys"]
  spec.email = ["45515869+Haltarys@users.noreply.github.com"]

  spec.summary = "A library to procedurally generate mazes in Ruby in the terminal."
  spec.description = "Fiddling with computer-generated mazes in Ruby."
  spec.homepage = "https://github.com/Haltarys/Labyrinths"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Haltarys/Labyrinths"
  spec.metadata["changelog_uri"] = "https://github.com/Haltarys/Labyrinths/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.platform = Gem::Platform::RUBY

  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "thor", "~> 1.2"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
