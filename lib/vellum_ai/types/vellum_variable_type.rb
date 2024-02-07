# frozen_string_literal: true

module Vellum
  # @type [VELLUM_VARIABLE_TYPE]
  VELLUM_VARIABLE_TYPE = {
    string: "STRING",
    number: "NUMBER",
    json: "JSON",
    chat_history: "CHAT_HISTORY",
    search_results: "SEARCH_RESULTS",
    error: "ERROR",
    array: "ARRAY",
    function_call: "FUNCTION_CALL",
    image: "IMAGE"
  }.freeze
end
