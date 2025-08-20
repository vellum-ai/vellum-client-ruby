# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/workspace_secret_read"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class WorkspaceSecretsClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::WorkspaceSecretsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Used to retrieve a Workspace Secret given its ID or name.
    #
    # @param id [String] Either the Workspace Secret's ID or its unique name
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkspaceSecretRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workspace_secrets.retrieve(id: "id")
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workspace-secrets/#{id}"
end
      Vellum::WorkspaceSecretRead.from_json(json_object: response.body)
    end
# Used to update a Workspace Secret given its ID or name.
    #
    # @param id [String] Either the Workspace Secret's ID or its unique name
    # @param label [String] 
    # @param value [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkspaceSecretRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workspace_secrets.partial_update(id: "id")
    def partial_update(id:, label: nil, value: nil, request_options: nil)
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
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), label: label, value: value }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workspace-secrets/#{id}"
end
      Vellum::WorkspaceSecretRead.from_json(json_object: response.body)
    end
  end
  class AsyncWorkspaceSecretsClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncWorkspaceSecretsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Used to retrieve a Workspace Secret given its ID or name.
    #
    # @param id [String] Either the Workspace Secret's ID or its unique name
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkspaceSecretRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workspace_secrets.retrieve(id: "id")
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workspace-secrets/#{id}"
end
        Vellum::WorkspaceSecretRead.from_json(json_object: response.body)
      end
    end
# Used to update a Workspace Secret given its ID or name.
    #
    # @param id [String] Either the Workspace Secret's ID or its unique name
    # @param label [String] 
    # @param value [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkspaceSecretRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workspace_secrets.partial_update(id: "id")
    def partial_update(id:, label: nil, value: nil, request_options: nil)
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
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), label: label, value: value }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workspace-secrets/#{id}"
end
        Vellum::WorkspaceSecretRead.from_json(json_object: response.body)
      end
    end
  end
end