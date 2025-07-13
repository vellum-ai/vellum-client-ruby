# frozen_string_literal: true
require_relative "environment"
require "faraday"
require "faraday/multipart"
require "faraday/retry"
require "faraday"
require "faraday"
require "faraday/multipart"
require "async/http/faraday"
require "faraday/retry"

module Vellum
  class RequestClient
  # @return [Faraday] 
    attr_reader :conn
  # @return [String] 
    attr_reader :base_url
  # @return [String] 
    attr_reader :api_key
  # @return [String] 
    attr_reader :default_environment


    # @param base_url [String] 
    # @param environment [Vellum::Environment] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @param api_key [String] 
    # @return [Vellum::RequestClient]
    def initialize(base_url: nil, environment: Vellum::Environment::PRODUCTION, max_retries: nil, timeout_in_seconds: nil, api_key:)
      @default_environment = environment
      @api_key = api_key
      @conn = Faraday.new do | faraday |
  faraday.request :multipart
  faraday.request :json
  faraday.response :raise_error, include_request: true
  unless max_retries.nil?
    faraday.request :retry ,  { max: max_retries }
  end
  unless timeout_in_seconds.nil?
    faraday.options.timeout = timeout_in_seconds
  end
end
    end
    # @param request_options [Vellum::RequestOptions] 
    # @param environment [String] 
    # @return [String]
    def get_url(request_options: nil, environment:)
      request_options&.base_url || @default_environment[environment] || @base_url
    end
    # @return [Hash{String => String}]
    def get_headers
      headers = { "X-Fern-Language": 'Ruby', "X-Fern-SDK-Name": 'vellum_ai', "X-Fern-SDK-Version": '0.14.88' }
      headers["X-API-KEY"] = ((@api_key.is_a? Method) ? @api_key.call : @api_key) unless @api_key.nil?
 headers
    end
  end
  class AsyncRequestClient
  # @return [Faraday] 
    attr_reader :conn
  # @return [String] 
    attr_reader :base_url
  # @return [String] 
    attr_reader :api_key
  # @return [String] 
    attr_reader :default_environment


    # @param base_url [String] 
    # @param environment [Vellum::Environment] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @param api_key [String] 
    # @return [Vellum::AsyncRequestClient]
    def initialize(base_url: nil, environment: Vellum::Environment::PRODUCTION, max_retries: nil, timeout_in_seconds: nil, api_key:)
      @default_environment = environment
      @api_key = api_key
      @conn = Faraday.new do | faraday |
  faraday.request :multipart
  faraday.request :json
  faraday.response :raise_error, include_request: true
  faraday.adapter :async_http
  unless max_retries.nil?
    faraday.request :retry ,  { max: max_retries }
  end
  unless timeout_in_seconds.nil?
    faraday.options.timeout = timeout_in_seconds
  end
end
    end
    # @param request_options [Vellum::RequestOptions] 
    # @param environment [String] 
    # @return [String]
    def get_url(request_options: nil, environment:)
      request_options&.base_url || @default_environment[environment] || @base_url
    end
    # @return [Hash{String => String}]
    def get_headers
      headers = { "X-Fern-Language": 'Ruby', "X-Fern-SDK-Name": 'vellum_ai', "X-Fern-SDK-Version": '0.14.88' }
      headers["X-API-KEY"] = ((@api_key.is_a? Method) ? @api_key.call : @api_key) unless @api_key.nil?
 headers
    end
  end
# Additional options for request-specific configuration when calling APIs via the
#  SDK.
  class RequestOptions
  # @return [String] 
    attr_reader :base_url
  # @return [String] 
    attr_reader :api_key
  # @return [Hash{String => Object}] 
    attr_reader :additional_headers
  # @return [Hash{String => Object}] 
    attr_reader :additional_query_parameters
  # @return [Hash{String => Object}] 
    attr_reader :additional_body_parameters
  # @return [Long] 
    attr_reader :timeout_in_seconds


    # @param base_url [String] 
    # @param api_key [String] 
    # @param additional_headers [Hash{String => Object}] 
    # @param additional_query_parameters [Hash{String => Object}] 
    # @param additional_body_parameters [Hash{String => Object}] 
    # @param timeout_in_seconds [Long] 
    # @return [Vellum::RequestOptions]
    def initialize(base_url: nil, api_key: nil, additional_headers: nil, additional_query_parameters: nil, additional_body_parameters: nil, timeout_in_seconds: nil)
      @base_url = base_url
      @api_key = api_key
      @additional_headers = additional_headers
      @additional_query_parameters = additional_query_parameters
      @additional_body_parameters = additional_body_parameters
      @timeout_in_seconds = timeout_in_seconds
    end
  end
# Additional options for request-specific configuration when calling APIs via the
#  SDK.
  class IdempotencyRequestOptions
  # @return [String] 
    attr_reader :base_url
  # @return [String] 
    attr_reader :api_key
  # @return [Hash{String => Object}] 
    attr_reader :additional_headers
  # @return [Hash{String => Object}] 
    attr_reader :additional_query_parameters
  # @return [Hash{String => Object}] 
    attr_reader :additional_body_parameters
  # @return [Long] 
    attr_reader :timeout_in_seconds


    # @param base_url [String] 
    # @param api_key [String] 
    # @param additional_headers [Hash{String => Object}] 
    # @param additional_query_parameters [Hash{String => Object}] 
    # @param additional_body_parameters [Hash{String => Object}] 
    # @param timeout_in_seconds [Long] 
    # @return [Vellum::IdempotencyRequestOptions]
    def initialize(base_url: nil, api_key: nil, additional_headers: nil, additional_query_parameters: nil, additional_body_parameters: nil, timeout_in_seconds: nil)
      @base_url = base_url
      @api_key = api_key
      @additional_headers = additional_headers
      @additional_query_parameters = additional_query_parameters
      @additional_body_parameters = additional_body_parameters
      @timeout_in_seconds = timeout_in_seconds
    end
  end
end