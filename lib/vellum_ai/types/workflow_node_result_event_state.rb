# frozen_string_literal: true

module Vellum
  # @type [WORKFLOW_NODE_RESULT_EVENT_STATE]
  WORKFLOW_NODE_RESULT_EVENT_STATE = {
    initiated: "INITIATED",
    streaming: "STREAMING",
    fulfilled: "FULFILLED",
    rejected: "REJECTED"
  }.freeze
end
