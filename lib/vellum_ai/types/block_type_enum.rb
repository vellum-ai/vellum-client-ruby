# frozen_string_literal: true

module Vellum
  # @type [BLOCK_TYPE_ENUM]
  BLOCK_TYPE_ENUM = {
    chat_message: "CHAT_MESSAGE",
    chat_history: "CHAT_HISTORY",
    jinja: "JINJA",
    function_definition: "FUNCTION_DEFINITION"
  }.freeze
end
