# frozen_string_literal: true

module Vellum
  # @type [TEST_SUITE_RUN_STATE]
  TEST_SUITE_RUN_STATE = {
    queued: "QUEUED",
    running: "RUNNING",
    complete: "COMPLETE",
    failed: "FAILED",
    cancelled: "CANCELLED"
  }.freeze
end
