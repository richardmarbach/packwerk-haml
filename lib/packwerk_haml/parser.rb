# typed: true
# frozen_string_literal: true

require "haml"
require "ast/node"

module PackwerkHaml
  class Parser
    extend T::Sig

    include ::Packwerk::FileParser

    sig { params(haml_compiler: T.untyped, ruby_parser: ::Packwerk::Parsers::Ruby).void }
    def initialize(haml_compiler: ::Haml::Engine.new, ruby_parser: ::Packwerk::Parsers::Ruby.new)
      @haml_compiler = haml_compiler
      @ruby_parser = ruby_parser
    end

    sig { override.params(io: T.any(StringIO, IO), file_path: String).returns(T.untyped) }
    def call(io:, file_path: "<unknown>")
      parse_template(io.read, file_path: file_path)
    end

    sig { override.params(path: String).returns(T::Boolean) }
    def match?(path:)
      File.extname(path) == ".haml"
    end

    private

    def parse_template(template, file_path:)
      compiled = @haml_compiler.call(template)
      to_ruby_ast(compiled, file_path)
    rescue EncodingError => e
      result = ::Packwerk::Parsers::ParseResult.new(file: file_path, message: e.message)
      raise ::Packwerk::Parsers::ParseError, result
    rescue ::Parser::SyntaxError => e
      result = ::Packwerk::Parsers::ParseResult.new(file: file_path, message: "Syntax error: #{e}")
      raise ::Packwerk::Parsers::ParseError, result
    end

    def to_ruby_ast(code, file_path)
      @ruby_parser.call(
        io: StringIO.new(code),
        file_path: file_path,
      )
    end
  end
end
