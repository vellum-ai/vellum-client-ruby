# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/components_schemas_composio_tool_definition"
require_relative "../types/components_schemas_composio_execute_tool_request"
require_relative "../types/components_schemas_composio_execute_tool_response"
require_relative "../types/paginated_slim_integration_read_list"
require_relative "../types/integration_read"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class IntegrationsClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::IntegrationsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
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
#  api.integrations.retrieve_integration_tool_definition(
#    integration_name: "integration_name",
#    integration_provider: "integration_provider",
#    tool_name: "tool_name"
#  )
    def retrieve_integration_tool_definition(integration_name:, integration_provider:, tool_name:, toolkit_version: nil, request_options: nil)
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/integrations/v1/providers/#{integration_name}/integrations/#{integration_provider}/tools/#{tool_name}"
end
      Vellum::ComposioToolDefinition.from_json(json_object: response.body)
    end
    # @param integration_name [String] The integration name
    # @param integration_provider [String] The integration provider name
    # @param tool_name [String] The tool's unique name, as specified by the integration provider
    # @param request [Hash] Request of type Vellum::COMPONENTS_SCHEMAS_COMPOSIO_EXECUTE_TOOL_REQUEST, as a Hash
    #   * :provider (String) 
    #   * :arguments (Hash{String => Object}) 
    #   * :toolkit_version (String) 
    #   * :integration (String) 
    #   * :tool (String) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::COMPONENTS_SCHEMAS_COMPOSIO_EXECUTE_TOOL_RESPONSE]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integrations.execute_integration_tool(
#    integration_name: "integration_name",
#    integration_provider: "integration_provider",
#    tool_name: "tool_name",
#    request: { provider: "COMPOSIO", arguments: { "arguments": {"key":"value"} } }
#  )
    def execute_integration_tool(integration_name:, integration_provider:, tool_name:, request:, request_options: nil)
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
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/integrations/v1/providers/#{integration_name}/integrations/#{integration_provider}/tools/#{tool_name}/execute"
end
      Vellum::ComposioExecuteToolResponse.from_json(json_object: response.body)
    end
# List all integrations
    #
    # @param integration_provider [String] * `COMPOSIO` - Composio
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param search [String] A search term.
    # @param supports_integration_triggers [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedSlimIntegrationReadList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integrations.list
    def list(integration_provider: nil, limit: nil, offset: nil, ordering: nil, search: nil, supports_integration_triggers: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "integration_provider": integration_provider, "limit": limit, "offset": offset, "ordering": ordering, "search": search, "supports_integration_triggers": supports_integration_triggers }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/integrations"
end
      Vellum::PaginatedSlimIntegrationReadList.from_json(json_object: response.body)
    end
# Retrieve an integration
    #
    # @param id [String] A UUID string identifying this integration.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::IntegrationRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integrations.retrieve(id: "id")
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
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/integrations/#{id}"
end
      Vellum::IntegrationRead.from_json(json_object: response.body)
    end
  end
  class AsyncIntegrationsClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncIntegrationsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
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
#  api.integrations.retrieve_integration_tool_definition(
#    integration_name: "integration_name",
#    integration_provider: "integration_provider",
#    tool_name: "tool_name"
#  )
    def retrieve_integration_tool_definition(integration_name:, integration_provider:, tool_name:, toolkit_version: nil, request_options: nil)
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/integrations/v1/providers/#{integration_name}/integrations/#{integration_provider}/tools/#{tool_name}"
end
        Vellum::ComposioToolDefinition.from_json(json_object: response.body)
      end
    end
    # @param integration_name [String] The integration name
    # @param integration_provider [String] The integration provider name
    # @param tool_name [String] The tool's unique name, as specified by the integration provider
    # @param request [Hash] Request of type Vellum::COMPONENTS_SCHEMAS_COMPOSIO_EXECUTE_TOOL_REQUEST, as a Hash
    #   * :provider (String) 
    #   * :arguments (Hash{String => Object}) 
    #   * :toolkit_version (String) 
    #   * :integration (String) 
    #   * :tool (String) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::COMPONENTS_SCHEMAS_COMPOSIO_EXECUTE_TOOL_RESPONSE]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integrations.execute_integration_tool(
#    integration_name: "integration_name",
#    integration_provider: "integration_provider",
#    tool_name: "tool_name",
#    request: { provider: "COMPOSIO", arguments: { "arguments": {"key":"value"} } }
#  )
    def execute_integration_tool(integration_name:, integration_provider:, tool_name:, request:, request_options: nil)
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
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/integrations/v1/providers/#{integration_name}/integrations/#{integration_provider}/tools/#{tool_name}/execute"
end
        Vellum::ComposioExecuteToolResponse.from_json(json_object: response.body)
      end
    end
# List all integrations
    #
    # @param integration_provider [String] * `COMPOSIO` - Composio
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param search [String] A search term.
    # @param supports_integration_triggers [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedSlimIntegrationReadList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integrations.list
    def list(integration_provider: nil, limit: nil, offset: nil, ordering: nil, search: nil, supports_integration_triggers: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "integration_provider": integration_provider, "limit": limit, "offset": offset, "ordering": ordering, "search": search, "supports_integration_triggers": supports_integration_triggers }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/integrations"
end
        Vellum::PaginatedSlimIntegrationReadList.from_json(json_object: response.body)
      end
    end
# Retrieve an integration
    #
    # @param id [String] A UUID string identifying this integration.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::IntegrationRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integrations.retrieve(id: "id")
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
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/integrations/#{id}"
end
        Vellum::IntegrationRead.from_json(json_object: response.body)
      end
    end
  end
end