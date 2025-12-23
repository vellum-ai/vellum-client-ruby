# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/components_schemas_composio_tool_definition"
require_relative "../types/paginated_slim_tool_definition_list"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class IntegrationProvidersClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::IntegrationProvidersClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve a specific integration tool definition.
    #
    # @param integration_name [String] The integration name
    # @param integration_provider [String] The integration provider name
    # @param tool_name [String] The tool's unique name, as specified by the integration provider
    # @param toolkit_version [String] The version of the toolkit to use. Pass 'latest' to get the latest version, or a
#  specific version string to pin it. If not provided, uses the provider's default.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::COMPONENTS_SCHEMAS_COMPOSIO_TOOL_DEFINITION]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integration_providers.retrieve_integration_provider_tool_definition(
#    integration_name: "integration_name",
#    integration_provider: "integration_provider",
#    tool_name: "tool_name"
#  )
    def retrieve_integration_provider_tool_definition(integration_name:, integration_provider:, tool_name:, toolkit_version: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "toolkit_version": toolkit_version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/integration-providers/#{integration_name}/integrations/#{integration_provider}/tools/#{tool_name}"
end
      Vellum::ComposioToolDefinition.from_json(json_object: response.body)
    end
# List all integration tools for a given provider and integration.
    #
    # @param integration_provider [String] The integration provider name
    # @param important [Boolean] Whether to filter the tools by important
    # @param include_deprecated [Boolean] Whether to include deprecated tools
    # @param integration_name [String] The Vellum Integration name
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param search [String] The search term to filter the tools by
    # @param toolkit_version [String] The version of the toolkit to lookup. Pass 'latest' to get the latest version,
#  or a specific version string to pin it. If not provided, uses the provider's
#  default.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedSlimToolDefinitionList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integration_providers.list_integration_tools(integration_provider: "integration_provider")
    def list_integration_tools(integration_provider:, important: nil, include_deprecated: nil, integration_name: nil, limit: nil, offset: nil, search: nil, toolkit_version: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "important": important, "include_deprecated": include_deprecated, "integration_name": integration_name, "limit": limit, "offset": offset, "search": search, "toolkit_version": toolkit_version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/integration-providers/#{integration_provider}/tools"
end
      Vellum::PaginatedSlimToolDefinitionList.from_json(json_object: response.body)
    end
  end
  class AsyncIntegrationProvidersClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncIntegrationProvidersClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve a specific integration tool definition.
    #
    # @param integration_name [String] The integration name
    # @param integration_provider [String] The integration provider name
    # @param tool_name [String] The tool's unique name, as specified by the integration provider
    # @param toolkit_version [String] The version of the toolkit to use. Pass 'latest' to get the latest version, or a
#  specific version string to pin it. If not provided, uses the provider's default.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::COMPONENTS_SCHEMAS_COMPOSIO_TOOL_DEFINITION]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integration_providers.retrieve_integration_provider_tool_definition(
#    integration_name: "integration_name",
#    integration_provider: "integration_provider",
#    tool_name: "tool_name"
#  )
    def retrieve_integration_provider_tool_definition(integration_name:, integration_provider:, tool_name:, toolkit_version: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "toolkit_version": toolkit_version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/integration-providers/#{integration_name}/integrations/#{integration_provider}/tools/#{tool_name}"
end
        Vellum::ComposioToolDefinition.from_json(json_object: response.body)
      end
    end
# List all integration tools for a given provider and integration.
    #
    # @param integration_provider [String] The integration provider name
    # @param important [Boolean] Whether to filter the tools by important
    # @param include_deprecated [Boolean] Whether to include deprecated tools
    # @param integration_name [String] The Vellum Integration name
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param search [String] The search term to filter the tools by
    # @param toolkit_version [String] The version of the toolkit to lookup. Pass 'latest' to get the latest version,
#  or a specific version string to pin it. If not provided, uses the provider's
#  default.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedSlimToolDefinitionList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integration_providers.list_integration_tools(integration_provider: "integration_provider")
    def list_integration_tools(integration_provider:, important: nil, include_deprecated: nil, integration_name: nil, limit: nil, offset: nil, search: nil, toolkit_version: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "important": important, "include_deprecated": include_deprecated, "integration_name": integration_name, "limit": limit, "offset": offset, "search": search, "toolkit_version": toolkit_version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/integration-providers/#{integration_provider}/tools"
end
        Vellum::PaginatedSlimToolDefinitionList.from_json(json_object: response.body)
      end
    end
  end
end