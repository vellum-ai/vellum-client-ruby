# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/ml_model_read"
require "async"
require_relative "../../requests"

module Vellum
  class MlModelsClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::MlModelsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve details about an ML Model
    #
    # @param id [String] Either the ML Model's ID, its unique name, or its ID in the workspace.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::MlModelRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.ml_models.retrieve(id: "id")
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/ml-models/#{id}"
end
      Vellum::MlModelRead.from_json(json_object: response.body)
    end
  end
  class AsyncMlModelsClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncMlModelsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve details about an ML Model
    #
    # @param id [String] Either the ML Model's ID, its unique name, or its ID in the workspace.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::MlModelRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.ml_models.retrieve(id: "id")
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/ml-models/#{id}"
end
        Vellum::MlModelRead.from_json(json_object: response.body)
      end
    end
  end
end