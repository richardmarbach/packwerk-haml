# typed: false
# frozen_string_literal: true

require "test_helper"

module PackwerkHaml
  class ParserTest < Minitest::Test
    def test_call_returns_node_with_valid_file
      node = File.open(fixture_path("valid.haml"), "r") do |fixture|
        PackwerkHaml::Parser.new.call(io: fixture)
      end

      assert_kind_of(::AST::Node, node)
    end

    def test_node_with_valid_javascript
      node = File.open(fixture_path("javascript_valid.haml"), "r") do |fixture|
        PackwerkHaml::Parser.new.call(io: fixture)
      end

      assert_kind_of(::AST::Node, node)
    end

    def test_parse_invalid_file
      node = File.open(fixture_path("invalid.haml"), "r") do |fixture|
        PackwerkHaml::Parser.new.call(io: fixture)
      end

      assert_kind_of(::AST::Node, node)
    end

    private

    def fixture_path(name)
      ROOT.join("test/fixtures/haml", name).to_s
    end
  end
end
