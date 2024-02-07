# frozen_string_literal: true

module Vellum
  # @type [MODEL_VERSION_READ_STATUS_ENUM]
  MODEL_VERSION_READ_STATUS_ENUM = {
    creating: "CREATING",
    ready: "READY",
    creation_failed: "CREATION_FAILED",
    disabled: "DISABLED"
  }.freeze
end
