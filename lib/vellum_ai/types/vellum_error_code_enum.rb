# frozen_string_literal: true

module Vellum
  # @type [VELLUM_ERROR_CODE_ENUM]
  VELLUM_ERROR_CODE_ENUM = {
    invalid_request: "INVALID_REQUEST",
    provider_error: "PROVIDER_ERROR",
    internal_server_error: "INTERNAL_SERVER_ERROR"
  }.freeze
end
