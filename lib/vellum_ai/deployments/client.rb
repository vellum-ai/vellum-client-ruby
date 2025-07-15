# frozen_string_literal: true
require_relative "../../requests"
require_relative "types/deployments_list_request_status"
require_relative "../types/paginated_slim_deployment_read_list"
require_relative "../types/deployment_read"
require_relative "../types/deployment_history_item"
require_relative "types/list_deployment_release_tags_request_source"
require_relative "../types/paginated_deployment_release_tag_read_list"
require_relative "../types/deployment_release_tag_read"
require_relative "../types/prompt_deployment_release"
require_relative "../types/prompt_deployment_input_request"
require_relative "../types/compile_prompt_deployment_expand_meta_request"
require_relative "../types/deployment_provider_payload_response"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class DeploymentsClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::DeploymentsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Used to list all Prompt Deployments.
    #
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param status [Vellum::Deployments::DeploymentsListRequestStatus] status
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedSlimDeploymentReadList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.list
    def list(limit: nil, offset: nil, ordering: nil, status: nil, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset, "ordering": ordering, "status": status }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments"
end
      Vellum::PaginatedSlimDeploymentReadList.from_json(json_object: response.body)
    end
# Used to retrieve a Prompt Deployment given its ID or name.
    #
    # @param id [String] Either the Prompt Deployment's ID or its unique name
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DeploymentRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.retrieve(id: "id")
    def retrieve(id:, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments/#{id}"
end
      Vellum::DeploymentRead.from_json(json_object: response.body)
    end
# DEPRECATED: This endpoint is deprecated and will be removed in a future release.
#  Please use the
#  `retrieve_prompt_deployment_release` xendpoint instead.
    #
    # @param history_id_or_release_tag [String] Either the UUID of Deployment History Item you'd like to retrieve, or the name
#  of a Release Tag that's pointing to the Deployment History Item you'd like to
#  retrieve.
    # @param id [String] Either the Prompt Deployment's ID or its unique name
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DeploymentHistoryItem]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.deployment_history_item_retrieve(history_id_or_release_tag: "history_id_or_release_tag", id: "id")
    def deployment_history_item_retrieve(history_id_or_release_tag:, id:, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments/#{history_id_or_release_tag}/history/#{id}"
end
      Vellum::DeploymentHistoryItem.from_json(json_object: response.body)
    end
# List Release Tags associated with the specified Prompt Deployment
    #
    # @param id [String] Either the Prompt Deployment's ID or its unique name
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param source [Vellum::Deployments::ListDeploymentReleaseTagsRequestSource] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedDeploymentReleaseTagReadList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.list_deployment_release_tags(id: "id")
    def list_deployment_release_tags(id:, limit: nil, offset: nil, ordering: nil, source: nil, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset, "ordering": ordering, "source": source }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments/#{id}/release-tags"
end
      Vellum::PaginatedDeploymentReleaseTagReadList.from_json(json_object: response.body)
    end
# Retrieve a Deployment Release Tag by tag name, associated with a specified
#  Deployment.
    #
    # @param id [String] Either the Prompt Deployment's ID or its unique name
    # @param name [String] The name of the Release Tag associated with this Deployment that you'd like to
#  retrieve.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DeploymentReleaseTagRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.retrieve_deployment_release_tag(id: "id", name: "name")
    def retrieve_deployment_release_tag(id:, name:, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments/#{id}/release-tags/#{name}"
end
      Vellum::DeploymentReleaseTagRead.from_json(json_object: response.body)
    end
# Updates an existing Release Tag associated with the specified Prompt Deployment.
    #
    # @param id [String] Either the Prompt Deployment's ID or its unique name
    # @param name [String] The name of the Release Tag associated with this Deployment that you'd like to
#  update.
    # @param history_item_id [String] The ID of the Release to tag
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DeploymentReleaseTagRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.update_deployment_release_tag(id: "id", name: "name")
    def update_deployment_release_tag(id:, name:, history_item_id: nil, request_options: nil)
      response = @request_client.conn.patch do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), history_item_id: history_item_id }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments/#{id}/release-tags/#{name}"
end
      Vellum::DeploymentReleaseTagRead.from_json(json_object: response.body)
    end
# Retrieve a specific Prompt Deployment Release by either its UUID or the name of
#  a Release Tag that points to it.
    #
    # @param id [String] Either the Prompt Deployment's ID or its unique name
    # @param release_id_or_release_tag [String] Either the UUID of Prompt Deployment Release you'd like to retrieve, or the name
#  of a Release Tag that's pointing to the Prompt Deployment Release you'd like to
#  retrieve.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PromptDeploymentRelease]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.retrieve_prompt_deployment_release(id: "id", release_id_or_release_tag: "release_id_or_release_tag")
    def retrieve_prompt_deployment_release(id:, release_id_or_release_tag:, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments/#{id}/releases/#{release_id_or_release_tag}"
end
      Vellum::PromptDeploymentRelease.from_json(json_object: response.body)
    end
# Given a set of input variable values, compile the exact payload that Vellum
#  would send to the configured model provider
#  for execution if the execute-prompt endpoint had been invoked. Note that this
#  endpoint does not actually execute the
#  prompt or make an API call to the model provider.
#  This endpoint is useful if you don't want to proxy LLM provider requests through
#  Vellum and prefer to send them directly
#  to the provider yourself. Note that no guarantees are made on the format of this
#  API's response schema, other than
#  that it will be a valid payload for the configured model provider. It's not
#  recommended that you try to parse or
#  derive meaning from the response body and instead, should simply pass it
#  directly to the model provider as is.
#  We encourage you to seek advise from Vellum Support before integrating with this
#  API for production use.
    #
    # @param deployment_id [String] The ID of the deployment. Must provide either this or deployment_name.
    # @param deployment_name [String] The name of the deployment. Must provide either this or deployment_id.
    # @param inputs [Array<Hash>] The list of inputs defined in the Prompt's deployment with their corresponding
#  values.Request of type Array<Vellum::PromptDeploymentInputRequest>, as a Hash
    # @param release_tag [String] Optionally specify a release tag if you want to pin to a specific release of the
#  Workflow Deployment
    # @param expand_meta [Hash] Request of type Vellum::CompilePromptDeploymentExpandMetaRequest, as a Hash
    #   * :model_name (Boolean) 
    #   * :deployment_release_tag (Boolean) 
    #   * :prompt_version_id (Boolean) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DeploymentProviderPayloadResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.retrieve_provider_payload(inputs: [{ name: "x", type: "STRING", value: "value" }, { name: "x", type: "STRING", value: "value" }])
    def retrieve_provider_payload(deployment_id: nil, deployment_name: nil, inputs:, release_tag: nil, expand_meta: nil, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), deployment_id: deployment_id, deployment_name: deployment_name, inputs: inputs, release_tag: release_tag, expand_meta: expand_meta }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments/provider-payload"
end
      Vellum::DeploymentProviderPayloadResponse.from_json(json_object: response.body)
    end
  end
  class AsyncDeploymentsClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncDeploymentsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Used to list all Prompt Deployments.
    #
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param status [Vellum::Deployments::DeploymentsListRequestStatus] status
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedSlimDeploymentReadList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.list
    def list(limit: nil, offset: nil, ordering: nil, status: nil, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset, "ordering": ordering, "status": status }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments"
end
        Vellum::PaginatedSlimDeploymentReadList.from_json(json_object: response.body)
      end
    end
# Used to retrieve a Prompt Deployment given its ID or name.
    #
    # @param id [String] Either the Prompt Deployment's ID or its unique name
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DeploymentRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.retrieve(id: "id")
    def retrieve(id:, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments/#{id}"
end
        Vellum::DeploymentRead.from_json(json_object: response.body)
      end
    end
# DEPRECATED: This endpoint is deprecated and will be removed in a future release.
#  Please use the
#  `retrieve_prompt_deployment_release` xendpoint instead.
    #
    # @param history_id_or_release_tag [String] Either the UUID of Deployment History Item you'd like to retrieve, or the name
#  of a Release Tag that's pointing to the Deployment History Item you'd like to
#  retrieve.
    # @param id [String] Either the Prompt Deployment's ID or its unique name
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DeploymentHistoryItem]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.deployment_history_item_retrieve(history_id_or_release_tag: "history_id_or_release_tag", id: "id")
    def deployment_history_item_retrieve(history_id_or_release_tag:, id:, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments/#{history_id_or_release_tag}/history/#{id}"
end
        Vellum::DeploymentHistoryItem.from_json(json_object: response.body)
      end
    end
# List Release Tags associated with the specified Prompt Deployment
    #
    # @param id [String] Either the Prompt Deployment's ID or its unique name
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param source [Vellum::Deployments::ListDeploymentReleaseTagsRequestSource] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedDeploymentReleaseTagReadList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.list_deployment_release_tags(id: "id")
    def list_deployment_release_tags(id:, limit: nil, offset: nil, ordering: nil, source: nil, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset, "ordering": ordering, "source": source }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments/#{id}/release-tags"
end
        Vellum::PaginatedDeploymentReleaseTagReadList.from_json(json_object: response.body)
      end
    end
# Retrieve a Deployment Release Tag by tag name, associated with a specified
#  Deployment.
    #
    # @param id [String] Either the Prompt Deployment's ID or its unique name
    # @param name [String] The name of the Release Tag associated with this Deployment that you'd like to
#  retrieve.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DeploymentReleaseTagRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.retrieve_deployment_release_tag(id: "id", name: "name")
    def retrieve_deployment_release_tag(id:, name:, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments/#{id}/release-tags/#{name}"
end
        Vellum::DeploymentReleaseTagRead.from_json(json_object: response.body)
      end
    end
# Updates an existing Release Tag associated with the specified Prompt Deployment.
    #
    # @param id [String] Either the Prompt Deployment's ID or its unique name
    # @param name [String] The name of the Release Tag associated with this Deployment that you'd like to
#  update.
    # @param history_item_id [String] The ID of the Release to tag
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DeploymentReleaseTagRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.update_deployment_release_tag(id: "id", name: "name")
    def update_deployment_release_tag(id:, name:, history_item_id: nil, request_options: nil)
      Async do
        response = @request_client.conn.patch do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), history_item_id: history_item_id }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments/#{id}/release-tags/#{name}"
end
        Vellum::DeploymentReleaseTagRead.from_json(json_object: response.body)
      end
    end
# Retrieve a specific Prompt Deployment Release by either its UUID or the name of
#  a Release Tag that points to it.
    #
    # @param id [String] Either the Prompt Deployment's ID or its unique name
    # @param release_id_or_release_tag [String] Either the UUID of Prompt Deployment Release you'd like to retrieve, or the name
#  of a Release Tag that's pointing to the Prompt Deployment Release you'd like to
#  retrieve.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PromptDeploymentRelease]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.retrieve_prompt_deployment_release(id: "id", release_id_or_release_tag: "release_id_or_release_tag")
    def retrieve_prompt_deployment_release(id:, release_id_or_release_tag:, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments/#{id}/releases/#{release_id_or_release_tag}"
end
        Vellum::PromptDeploymentRelease.from_json(json_object: response.body)
      end
    end
# Given a set of input variable values, compile the exact payload that Vellum
#  would send to the configured model provider
#  for execution if the execute-prompt endpoint had been invoked. Note that this
#  endpoint does not actually execute the
#  prompt or make an API call to the model provider.
#  This endpoint is useful if you don't want to proxy LLM provider requests through
#  Vellum and prefer to send them directly
#  to the provider yourself. Note that no guarantees are made on the format of this
#  API's response schema, other than
#  that it will be a valid payload for the configured model provider. It's not
#  recommended that you try to parse or
#  derive meaning from the response body and instead, should simply pass it
#  directly to the model provider as is.
#  We encourage you to seek advise from Vellum Support before integrating with this
#  API for production use.
    #
    # @param deployment_id [String] The ID of the deployment. Must provide either this or deployment_name.
    # @param deployment_name [String] The name of the deployment. Must provide either this or deployment_id.
    # @param inputs [Array<Hash>] The list of inputs defined in the Prompt's deployment with their corresponding
#  values.Request of type Array<Vellum::PromptDeploymentInputRequest>, as a Hash
    # @param release_tag [String] Optionally specify a release tag if you want to pin to a specific release of the
#  Workflow Deployment
    # @param expand_meta [Hash] Request of type Vellum::CompilePromptDeploymentExpandMetaRequest, as a Hash
    #   * :model_name (Boolean) 
    #   * :deployment_release_tag (Boolean) 
    #   * :prompt_version_id (Boolean) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DeploymentProviderPayloadResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.deployments.retrieve_provider_payload(inputs: [{ name: "x", type: "STRING", value: "value" }, { name: "x", type: "STRING", value: "value" }])
    def retrieve_provider_payload(deployment_id: nil, deployment_name: nil, inputs:, release_tag: nil, expand_meta: nil, request_options: nil)
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
  end
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), deployment_id: deployment_id, deployment_name: deployment_name, inputs: inputs, release_tag: release_tag, expand_meta: expand_meta }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/deployments/provider-payload"
end
        Vellum::DeploymentProviderPayloadResponse.from_json(json_object: response.body)
      end
    end
  end
end