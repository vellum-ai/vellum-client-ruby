# frozen_string_literal: true

module Vellum
  # @type [INDEXING_STATE_ENUM]
  INDEXING_STATE_ENUM = {
    awaiting_processing: "AWAITING_PROCESSING",
    queued: "QUEUED",
    indexing: "INDEXING",
    indexed: "INDEXED",
    failed: "FAILED"
  }.freeze
end
