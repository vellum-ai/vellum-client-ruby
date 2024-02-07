# frozen_string_literal: true

module Vellum
  # @type [WORKFLOW_EXECUTION_EVENT_ERROR_CODE]
  WORKFLOW_EXECUTION_EVENT_ERROR_CODE = {
    workflow_initialization: "WORKFLOW_INITIALIZATION",
    node_execution_count_limit_reached: "NODE_EXECUTION_COUNT_LIMIT_REACHED",
    internal_server_error: "INTERNAL_SERVER_ERROR",
    node_execution: "NODE_EXECUTION",
    llm_provider: "LLM_PROVIDER",
    invalid_template: "INVALID_TEMPLATE"
  }.freeze
end
