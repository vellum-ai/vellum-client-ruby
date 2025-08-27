# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/workflow_event"
require_relative "../types/event_create_response"
require "async"
require_relative "../../requests"

module Vellum
  class EventsClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::EventsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Accept an event and publish it to ClickHouse for analytics processing.
    #
    # @param request [Vellum::NodeExecutionInitiatedEvent, Vellum::NodeExecutionStreamingEvent, Vellum::NodeExecutionFulfilledEvent, Vellum::NodeExecutionRejectedEvent, Vellum::NodeExecutionPausedEvent, Vellum::NodeExecutionResumedEvent, Vellum::WorkflowExecutionInitiatedEvent, Vellum::WorkflowExecutionStreamingEvent, Vellum::WorkflowExecutionRejectedEvent, Vellum::WorkflowExecutionFulfilledEvent, Vellum::WorkflowExecutionPausedEvent, Vellum::WorkflowExecutionResumedEvent, Vellum::WorkflowExecutionSnapshottedEvent] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::EventCreateResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.events.create(request: { name: "node.execution.initiated", body: { node_definition: { name: "name", module_: ["module", "module"], id: "id" }, inputs: { "inputs": {"key":"value"} } }, id: "id", timestamp: DateTime.parse("2024-01-15T09:30:00.000Z"), trace_id: "trace_id", span_id: "span_id" })
    def create(request:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/monitoring/v1/events"
end
      Vellum::EventCreateResponse.from_json(json_object: response.body)
    end
  end
  class AsyncEventsClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncEventsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Accept an event and publish it to ClickHouse for analytics processing.
    #
    # @param request [Vellum::NodeExecutionInitiatedEvent, Vellum::NodeExecutionStreamingEvent, Vellum::NodeExecutionFulfilledEvent, Vellum::NodeExecutionRejectedEvent, Vellum::NodeExecutionPausedEvent, Vellum::NodeExecutionResumedEvent, Vellum::WorkflowExecutionInitiatedEvent, Vellum::WorkflowExecutionStreamingEvent, Vellum::WorkflowExecutionRejectedEvent, Vellum::WorkflowExecutionFulfilledEvent, Vellum::WorkflowExecutionPausedEvent, Vellum::WorkflowExecutionResumedEvent, Vellum::WorkflowExecutionSnapshottedEvent] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::EventCreateResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.events.create(request: { name: "node.execution.initiated", body: { node_definition: { name: "name", module_: ["module", "module"], id: "id" }, inputs: { "inputs": {"key":"value"} } }, id: "id", timestamp: DateTime.parse("2024-01-15T09:30:00.000Z"), trace_id: "trace_id", span_id: "span_id" })
    def create(request:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/monitoring/v1/events"
end
        Vellum::EventCreateResponse.from_json(json_object: response.body)
      end
    end
  end
end