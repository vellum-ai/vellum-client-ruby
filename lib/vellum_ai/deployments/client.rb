# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/deployments_list_request_status"
require_relative "../types/paginated_slim_deployment_read_list"
require_relative "../types/deployment_read"
require_relative "../types/prompt_deployment_input_request"
require_relative "../types/deployment_provider_payload_response"
require "async"

module Vellum
  class DeploymentsClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [DeploymentsClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param status [DEPLOYMENTS_LIST_REQUEST_STATUS] status
    # @param request_options [RequestOptions]
    # @return [PaginatedSlimDeploymentReadList]
    def list(limit: nil, offset: nil, ordering: nil, status: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "limit": limit,
          "offset": offset,
          "ordering": ordering,
          "status": status
        }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/deployments"
      end
      PaginatedSlimDeploymentReadList.from_json(json_object: response.body)
    end

    # Used to retrieve a deployment given its ID or name.
    #
    # @param id [String] Either the Deployment's ID or its unique name
    # @param request_options [RequestOptions]
    # @return [DeploymentRead]
    def retrieve(id:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/deployments/#{id}"
      end
      DeploymentRead.from_json(json_object: response.body)
    end

    # @param deployment_id [String] The ID of the deployment. Must provide either this or deployment_name.
    # @param deployment_name [String] The name of the deployment. Must provide either this or deployment_id.
    # @param inputs [Array<Hash>] The list of inputs defined in the Prompt's deployment with their corresponding values.Request of type Array<PromptDeploymentInputRequest>, as a Hash
    # @param request_options [RequestOptions]
    # @return [DeploymentProviderPayloadResponse]
    def retrieve_provider_payload(inputs:, deployment_id: nil, deployment_name: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          deployment_id: deployment_id,
          deployment_name: deployment_name,
          inputs: inputs
        }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/deployments/provider-payload"
      end
      DeploymentProviderPayloadResponse.from_json(json_object: response.body)
    end
  end

  class AsyncDeploymentsClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncDeploymentsClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param status [DEPLOYMENTS_LIST_REQUEST_STATUS] status
    # @param request_options [RequestOptions]
    # @return [PaginatedSlimDeploymentReadList]
    def list(limit: nil, offset: nil, ordering: nil, status: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "limit": limit,
            "offset": offset,
            "ordering": ordering,
            "status": status
          }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/deployments"
        end
        PaginatedSlimDeploymentReadList.from_json(json_object: response.body)
      end
    end

    # Used to retrieve a deployment given its ID or name.
    #
    # @param id [String] Either the Deployment's ID or its unique name
    # @param request_options [RequestOptions]
    # @return [DeploymentRead]
    def retrieve(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/deployments/#{id}"
        end
        DeploymentRead.from_json(json_object: response.body)
      end
    end

    # @param deployment_id [String] The ID of the deployment. Must provide either this or deployment_name.
    # @param deployment_name [String] The name of the deployment. Must provide either this or deployment_id.
    # @param inputs [Array<Hash>] The list of inputs defined in the Prompt's deployment with their corresponding values.Request of type Array<PromptDeploymentInputRequest>, as a Hash
    # @param request_options [RequestOptions]
    # @return [DeploymentProviderPayloadResponse]
    def retrieve_provider_payload(inputs:, deployment_id: nil, deployment_name: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            deployment_id: deployment_id,
            deployment_name: deployment_name,
            inputs: inputs
          }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/deployments/provider-payload"
        end
        DeploymentProviderPayloadResponse.from_json(json_object: response.body)
      end
    end
  end
end
