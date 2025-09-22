# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/components_schemas_composio_tool_definition"
require_relative "../types/components_schemas_composio_execute_tool_request"
require_relative "../types/components_schemas_composio_execute_tool_response"
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
    # @param integration [String] The integration name
    # @param provider [String] The integration provider name
    # @param tool_name [String] The tool's unique name, as specified by the integration provider
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::COMPONENTS_SCHEMAS_COMPOSIO_TOOL_DEFINITION]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integrations.retrieve_integration_tool_definition(
#    integration: "integration",
#    provider: "provider",
#    tool_name: "tool_name"
#  )
    def retrieve_integration_tool_definition(integration:, provider:, tool_name:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/integrations/v1/providers/#{integration}/integrations/#{provider}/tools/#{tool_name}"
end
      Vellum::ComposioToolDefinition.from_json(json_object: response.body)
    end
    # @param integration [String] The integration name
    # @param provider [String] The integration provider name
    # @param tool_name [String] The tool's unique name, as specified by the integration provider
    # @param request [Hash] Request of type Vellum::COMPONENTS_SCHEMAS_COMPOSIO_EXECUTE_TOOL_REQUEST, as a Hash
    #   * :provider (String) 
    #   * :arguments (Hash{String => Object}) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::COMPONENTS_SCHEMAS_COMPOSIO_EXECUTE_TOOL_RESPONSE]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integrations.execute_integration_tool(
#    integration: "integration",
#    provider: "provider",
#    tool_name: "tool_name",
#    request: { provider: "COMPOSIO", arguments: { "arguments": {"key":"value"} } }
#  )
    def execute_integration_tool(integration:, provider:, tool_name:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/integrations/v1/providers/#{integration}/integrations/#{provider}/tools/#{tool_name}/execute"
end
      Vellum::ComposioExecuteToolResponse.from_json(json_object: response.body)
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
    # @param integration [String] The integration name
    # @param provider [String] The integration provider name
    # @param tool_name [String] The tool's unique name, as specified by the integration provider
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::COMPONENTS_SCHEMAS_COMPOSIO_TOOL_DEFINITION]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integrations.retrieve_integration_tool_definition(
#    integration: "integration",
#    provider: "provider",
#    tool_name: "tool_name"
#  )
    def retrieve_integration_tool_definition(integration:, provider:, tool_name:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/integrations/v1/providers/#{integration}/integrations/#{provider}/tools/#{tool_name}"
end
        Vellum::ComposioToolDefinition.from_json(json_object: response.body)
      end
    end
    # @param integration [String] The integration name
    # @param provider [String] The integration provider name
    # @param tool_name [String] The tool's unique name, as specified by the integration provider
    # @param request [Hash] Request of type Vellum::COMPONENTS_SCHEMAS_COMPOSIO_EXECUTE_TOOL_REQUEST, as a Hash
    #   * :provider (String) 
    #   * :arguments (Hash{String => Object}) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::COMPONENTS_SCHEMAS_COMPOSIO_EXECUTE_TOOL_RESPONSE]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.integrations.execute_integration_tool(
#    integration: "integration",
#    provider: "provider",
#    tool_name: "tool_name",
#    request: { provider: "COMPOSIO", arguments: { "arguments": {"key":"value"} } }
#  )
    def execute_integration_tool(integration:, provider:, tool_name:, request:, request_options: nil)
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/integrations/v1/providers/#{integration}/integrations/#{provider}/tools/#{tool_name}/execute"
end
        Vellum::ComposioExecuteToolResponse.from_json(json_object: response.body)
      end
    end
  end
end