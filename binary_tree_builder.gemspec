require_relative 'lib/binary_tree_builder/version'

Gem::Specification.new do |spec|
  spec.name          = "binary_tree_builder"
  spec.version       = BinaryTreeBuilder::VERSION
  spec.authors       = ["miyado"]
  spec.email         = ["hmiyado@gmail.com"]

  spec.summary       = %q{create binary tree}
  spec.description   = %q{create binary tree}
  spec.homepage      = "https://github.com/hmiyado"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/hmiyado"
  spec.metadata["changelog_uri"] = "https://github.com/hmiyado"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
