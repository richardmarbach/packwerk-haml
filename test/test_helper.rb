# typed: false
# frozen_string_literal: true

require "pathname"

ROOT = Pathname.new(__dir__).join("..").expand_path

require "packwerk_haml"

require "minitest/autorun"
require "minitest/focus"
