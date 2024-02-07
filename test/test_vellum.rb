# frozen_string_literal: true

require_relative "test_helper"
require "async"

class TestVellum < Minitest::Test
  def test_vellum
    client = Vellum::Client.new(api_key: "YOUR_API_KEY")
  end
end
