# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in packwerk-haml.gemspec
gemspec

gem("packwerk", git: "https://github.com/richardmarbach/packwerk", branch: "configurable_parser_interface")

gem("rubocop-performance", require: false)
gem("rubocop-sorbet", require: false)
gem("rubocop-shopify", require: false)

group :development do
  gem("minitest-focus", require: false)
  gem("ruby-lsp", "~> 0.2.1")

  gem("m")
  gem("rake")
  gem("tapioca", require: false)
  gem("sorbet-static-and-runtime")
end
