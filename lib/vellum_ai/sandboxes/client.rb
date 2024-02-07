# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/scenario_input_request"
require_relative "../types/sandbox_scenario"
require "async"

module Vellum
  class SandboxesClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [SandboxesClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Upserts a new scenario for a sandbox, keying off of the optionally provided scenario id.
    #
    # If an id is provided and has a match, the scenario will be updated. If no id is provided or no match
    # is found, a new scenario will be appended to the end.
    #
    # Note that a full replacement of the scenario is performed, so any fields not provided will be removed
    # or overwritten with default values.
    #
    # @param id [String] A UUID string identifying this sandbox.
    # @param label [String]
    # @param inputs [Array<Hash>] The inputs for the scenarioRequest of type Array<ScenarioInputRequest>, as a Hash
    #   * :key (String)
    #   * :type (SCENARIO_INPUT_TYPE_ENUM)
    #   * :value (String)
    #   * :chat_history (Array<ChatMessageRequest>)
    # @param scenario_id [String] The id of the scenario to update. If none is provided, an id will be generated and a new scenario will be appended.
    # @param request_options [RequestOptions]
    # @return [SandboxScenario]
    def upsert_sandbox_scenario(id:, inputs:, label: nil, scenario_id: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          label: label,
          inputs: inputs,
          scenario_id: scenario_id
        }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/sandboxes/#{id}/scenarios"
      end
      SandboxScenario.from_json(json_object: response.body)
    end

    # Deletes an existing scenario from a sandbox, keying off of the provided scenario id.
    #
    # @param id [String] A UUID string identifying this sandbox.
    # @param scenario_id [String] An id identifying the scenario that you'd like to delete
    # @param request_options [RequestOptions]
    # @return [Void]
    def delete_sandbox_scenario(id:, scenario_id:, request_options: nil)
      @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/sandboxes/#{id}/scenarios/#{scenario_id}"
      end
    end
  end

  class AsyncSandboxesClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncSandboxesClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Upserts a new scenario for a sandbox, keying off of the optionally provided scenario id.
    #
    # If an id is provided and has a match, the scenario will be updated. If no id is provided or no match
    # is found, a new scenario will be appended to the end.
    #
    # Note that a full replacement of the scenario is performed, so any fields not provided will be removed
    # or overwritten with default values.
    #
    # @param id [String] A UUID string identifying this sandbox.
    # @param label [String]
    # @param inputs [Array<Hash>] The inputs for the scenarioRequest of type Array<ScenarioInputRequest>, as a Hash
    #   * :key (String)
    #   * :type (SCENARIO_INPUT_TYPE_ENUM)
    #   * :value (String)
    #   * :chat_history (Array<ChatMessageRequest>)
    # @param scenario_id [String] The id of the scenario to update. If none is provided, an id will be generated and a new scenario will be appended.
    # @param request_options [RequestOptions]
    # @return [SandboxScenario]
    def upsert_sandbox_scenario(id:, inputs:, label: nil, scenario_id: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            label: label,
            inputs: inputs,
            scenario_id: scenario_id
          }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/sandboxes/#{id}/scenarios"
        end
        SandboxScenario.from_json(json_object: response.body)
      end
    end

    # Deletes an existing scenario from a sandbox, keying off of the provided scenario id.
    #
    # @param id [String] A UUID string identifying this sandbox.
    # @param scenario_id [String] An id identifying the scenario that you'd like to delete
    # @param request_options [RequestOptions]
    # @return [Void]
    def delete_sandbox_scenario(id:, scenario_id:, request_options: nil)
      Async do
        @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/sandboxes/#{id}/scenarios/#{scenario_id}"
        end
      end
    end
  end
end
