# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/model_version_read"
require "async"

module Vellum
  class ModelVersionsClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [ModelVersionsClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Deprecated. Use the `deployments/provider-payload` endpoint to fetch information that we send to Model providers.
    #
    # @param id [String] A UUID string identifying this model version.
    # @param request_options [RequestOptions]
    # @return [ModelVersionRead]
    def retrieve(id:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/model-versions/#{id}"
      end
      ModelVersionRead.from_json(json_object: response.body)
    end
  end

  class AsyncModelVersionsClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncModelVersionsClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Deprecated. Use the `deployments/provider-payload` endpoint to fetch information that we send to Model providers.
    #
    # @param id [String] A UUID string identifying this model version.
    # @param request_options [RequestOptions]
    # @return [ModelVersionRead]
    def retrieve(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/model-versions/#{id}"
        end
        ModelVersionRead.from_json(json_object: response.body)
      end
    end
  end
end
