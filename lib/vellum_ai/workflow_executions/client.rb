# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/workflow_execution_detail"
require "async"
require_relative "../../requests"

module Vellum
  class WorkflowExecutionsClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::WorkflowExecutionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param execution_id [String] 
    # @param prev_span_id [String] Optional keyset cursor span_id to continue from (exclusive)
    # @param span_limit [Integer] Maximum number of spans to return (for lazy loading)
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowExecutionDetail]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_executions.retrieve_workflow_execution_detail(execution_id: "execution_id")
    def retrieve_workflow_execution_detail(execution_id:, prev_span_id: nil, span_limit: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "prev_span_id": prev_span_id, "span_limit": span_limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-executions/#{execution_id}/detail"
end
      Vellum::WorkflowExecutionDetail.from_json(json_object: response.body)
    end
  end
  class AsyncWorkflowExecutionsClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncWorkflowExecutionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param execution_id [String] 
    # @param prev_span_id [String] Optional keyset cursor span_id to continue from (exclusive)
    # @param span_limit [Integer] Maximum number of spans to return (for lazy loading)
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowExecutionDetail]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_executions.retrieve_workflow_execution_detail(execution_id: "execution_id")
    def retrieve_workflow_execution_detail(execution_id:, prev_span_id: nil, span_limit: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "prev_span_id": prev_span_id, "span_limit": span_limit }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-executions/#{execution_id}/detail"
end
        Vellum::WorkflowExecutionDetail.from_json(json_object: response.body)
      end
    end
  end
end