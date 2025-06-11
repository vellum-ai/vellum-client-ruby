# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/metric_definition_input"
require_relative "../types/metric_definition_execution"
require_relative "../types/metric_definition_history_item"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class MetricDefinitionsClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::MetricDefinitionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param id [String] Either the Metric Definition's ID or its unique name
    # @param inputs [Array<Hash>] Request of type Array<Vellum::MetricDefinitionInput>, as a Hash
    # @param release_tag [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::MetricDefinitionExecution]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.metric_definitions.execute_metric_definition(id: "id", inputs: [{ name: "name", type: "STRING", value: "value" }])
    def execute_metric_definition(id:, inputs:, release_tag: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), inputs: inputs, release_tag: release_tag }.compact
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/metric-definitions/#{id}/execute"
end
      Vellum::MetricDefinitionExecution.from_json(json_object: response.body)
    end
    # @param history_id_or_release_tag [String] Either the UUID of Metric Definition History Item you'd like to retrieve, or the
#  name of a Release Tag that's pointing to the Metric Definition History Item
#  you'd like to retrieve.
    # @param id [String] A UUID string identifying this metric definition.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::MetricDefinitionHistoryItem]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.metric_definitions.metric_definition_history_item_retrieve(history_id_or_release_tag: "history_id_or_release_tag", id: "id")
    def metric_definition_history_item_retrieve(history_id_or_release_tag:, id:, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/metric-definitions/#{history_id_or_release_tag}/history/#{id}"
end
      Vellum::MetricDefinitionHistoryItem.from_json(json_object: response.body)
    end
  end
  class AsyncMetricDefinitionsClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncMetricDefinitionsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param id [String] Either the Metric Definition's ID or its unique name
    # @param inputs [Array<Hash>] Request of type Array<Vellum::MetricDefinitionInput>, as a Hash
    # @param release_tag [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::MetricDefinitionExecution]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.metric_definitions.execute_metric_definition(id: "id", inputs: [{ name: "name", type: "STRING", value: "value" }])
    def execute_metric_definition(id:, inputs:, release_tag: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), inputs: inputs, release_tag: release_tag }.compact
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/metric-definitions/#{id}/execute"
end
        Vellum::MetricDefinitionExecution.from_json(json_object: response.body)
      end
    end
    # @param history_id_or_release_tag [String] Either the UUID of Metric Definition History Item you'd like to retrieve, or the
#  name of a Release Tag that's pointing to the Metric Definition History Item
#  you'd like to retrieve.
    # @param id [String] A UUID string identifying this metric definition.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::MetricDefinitionHistoryItem]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.metric_definitions.metric_definition_history_item_retrieve(history_id_or_release_tag: "history_id_or_release_tag", id: "id")
    def metric_definition_history_item_retrieve(history_id_or_release_tag:, id:, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/metric-definitions/#{history_id_or_release_tag}/history/#{id}"
end
        Vellum::MetricDefinitionHistoryItem.from_json(json_object: response.body)
      end
    end
  end
end