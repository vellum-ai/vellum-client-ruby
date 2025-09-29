# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/paginated_slim_integration_auth_config_read_list"
require "async"
require_relative "../../requests"

module Vellum
  class IntegrationAuthConfigsClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::IntegrationAuthConfigsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# List Integration Auth Configs
    #
    # @param expand [String] The response fields to expand for more information.
#  - 'integration_credentials' expands the list of integration credentials that the
#  authenticated entity has access to for the auth config.
    # @param integration_name [String] 
    # @param integration_provider [String] 
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param search [String] A search term.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedSlimIntegrationAuthConfigReadList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integration_auth_configs.list_integration_auth_configs
    def list_integration_auth_configs(expand: nil, integration_name: nil, integration_provider: nil, limit: nil, offset: nil, ordering: nil, search: nil, request_options: nil)
      response = @request_client.conn.get do | req |
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
  req.params = { **(request_options&.additional_query_parameters || {}), "expand": expand, "integration_name": integration_name, "integration_provider": integration_provider, "limit": limit, "offset": offset, "ordering": ordering, "search": search }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/integration-auth-configs"
end
      Vellum::PaginatedSlimIntegrationAuthConfigReadList.from_json(json_object: response.body)
    end
  end
  class AsyncIntegrationAuthConfigsClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncIntegrationAuthConfigsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# List Integration Auth Configs
    #
    # @param expand [String] The response fields to expand for more information.
#  - 'integration_credentials' expands the list of integration credentials that the
#  authenticated entity has access to for the auth config.
    # @param integration_name [String] 
    # @param integration_provider [String] 
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param search [String] A search term.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedSlimIntegrationAuthConfigReadList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integration_auth_configs.list_integration_auth_configs
    def list_integration_auth_configs(expand: nil, integration_name: nil, integration_provider: nil, limit: nil, offset: nil, ordering: nil, search: nil, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "expand": expand, "integration_name": integration_name, "integration_provider": integration_provider, "limit": limit, "offset": offset, "ordering": ordering, "search": search }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/integration-auth-configs"
end
        Vellum::PaginatedSlimIntegrationAuthConfigReadList.from_json(json_object: response.body)
      end
    end
  end
end