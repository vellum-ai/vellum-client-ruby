# frozen_string_literal: true
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"
require_relative "lib/gemconfig"

Gem::Specification.new do | spec |
  spec.name = "vellum_ai"
  spec.version = "1.6.2"
  spec.licenses = ["MIT"]
  spec.authors = Vellum::Gemconfig::AUTHORS
  spec.email = Vellum::Gemconfig::EMAIL
  spec.summary = Vellum::Gemconfig::SUMMARY
  spec.description = Vellum::Gemconfig::DESCRIPTION
  spec.homepage = Vellum::Gemconfig::HOMEPAGE
  spec.required_ruby_version = ">= 2.7.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = Vellum::Gemconfig::SOURCE_CODE_URI
  spec.metadata["changelog_uri"] = Vellum::Gemconfig::CHANGELOG_URI
  spec.files = Dir.glob("lib/**/*") << "LICENSE"
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "faraday", ">= 1.10", "< 3.0"
  spec.add_dependency "faraday-net_http", ">= 1.0", "< 4.0"
  spec.add_dependency "faraday-retry", ">= 1.0", "< 3.0"
  spec.add_dependency "async-http-faraday", ">= 0.0", "< 1.0"
  spec.add_dependency "mini_mime"
  spec.add_dependency "faraday-multipart", ">= 0.0", "< 2.0"
end