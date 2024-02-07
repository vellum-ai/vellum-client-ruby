# frozen_string_literal: true

module Vellum
  # @type [PROCESSING_STATE_ENUM]
  PROCESSING_STATE_ENUM = {
    queued: "QUEUED",
    processing: "PROCESSING",
    processed: "PROCESSED",
    failed: "FAILED"
  }.freeze
end
