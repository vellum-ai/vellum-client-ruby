# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/uploaded_file_read"
require_relative "../../core/file_utilities"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class UploadedFilesClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::UploadedFilesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Upload a file to be used in the Workspace
    #
    # @param file [String, IO] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::UploadedFileRead]
    def create(file:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), file: Vellum::FileUtilities.as_faraday_multipart(file_like: file) }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/uploaded-files"
end
      Vellum::UploadedFileRead.from_json(json_object: response.body)
    end
# Retrieve a previously uploaded file by its ID
    #
    # @param id [String] A UUID string identifying this uploaded file.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::UploadedFileRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.uploaded_files.retrieve(id: "id")
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/uploaded-files/#{id}"
end
      Vellum::UploadedFileRead.from_json(json_object: response.body)
    end
# Update an uploaded file by its ID
    #
    # @param id [String] A UUID string identifying this uploaded file.
    # @param file [String, IO] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::UploadedFileRead]
    def update(id:, file:, request_options: nil)
      response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), file: Vellum::FileUtilities.as_faraday_multipart(file_like: file) }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/uploaded-files/#{id}"
end
      Vellum::UploadedFileRead.from_json(json_object: response.body)
    end
  end
  class AsyncUploadedFilesClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncUploadedFilesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Upload a file to be used in the Workspace
    #
    # @param file [String, IO] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::UploadedFileRead]
    def create(file:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), file: Vellum::FileUtilities.as_faraday_multipart(file_like: file) }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/uploaded-files"
end
        Vellum::UploadedFileRead.from_json(json_object: response.body)
      end
    end
# Retrieve a previously uploaded file by its ID
    #
    # @param id [String] A UUID string identifying this uploaded file.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::UploadedFileRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.uploaded_files.retrieve(id: "id")
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/uploaded-files/#{id}"
end
        Vellum::UploadedFileRead.from_json(json_object: response.body)
      end
    end
# Update an uploaded file by its ID
    #
    # @param id [String] A UUID string identifying this uploaded file.
    # @param file [String, IO] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::UploadedFileRead]
    def update(id:, file:, request_options: nil)
      Async do
        response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), file: Vellum::FileUtilities.as_faraday_multipart(file_like: file) }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/uploaded-files/#{id}"
end
        Vellum::UploadedFileRead.from_json(json_object: response.body)
      end
    end
  end
end