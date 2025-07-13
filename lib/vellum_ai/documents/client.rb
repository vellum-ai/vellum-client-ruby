# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/paginated_slim_document_list"
require_relative "../types/document_read"
require_relative "../types/document_status"
require_relative "../types/upload_document_response"
require_relative "../../core/file_utilities"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class DocumentsClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::DocumentsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Used to list documents. Optionally filter on supported fields.
    #
    # @param document_index_id [String] Filter down to only those documents that are included in the specified index.
#  You may provide either the Vellum-generated ID or the unique name of the index
#  specified upon initial creation.
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param search [String] A search term.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedSlimDocumentList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.documents.list
    def list(document_index_id: nil, limit: nil, offset: nil, ordering: nil, search: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "document_index_id": document_index_id, "limit": limit, "offset": offset, "ordering": ordering, "search": search }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/documents"
end
      Vellum::PaginatedSlimDocumentList.from_json(json_object: response.body)
    end
# Retrieve a Document, keying off of either its Vellum-generated ID or its
#  external ID.
    #
    # @param id [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DocumentRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.documents.retrieve(id: "id")
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/documents/#{id}"
end
      Vellum::DocumentRead.from_json(json_object: response.body)
    end
# Delete a Document, keying off of either its Vellum-generated ID or its external
#  ID.
    #
    # @param id [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.documents.destroy(id: "id")
    def destroy(id:, request_options: nil)
      response = @request_client.conn.delete do | req |
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
  req.url "#{@request_client.get_url(environment: Documents, request_options: request_options)}/v1/documents/#{id}"
end
    end
# Update a Document, keying off of either its Vellum-generated ID or its external
#  ID. Particularly useful for updating its metadata.
    #
    # @param id [String] 
    # @param label [String] A human-readable label for the document. Defaults to the originally uploaded
#  file's file name.
    # @param status [Vellum::DOCUMENT_STATUS] The current status of the document
#  * `ACTIVE` - Active
    # @param keywords [Array<String>] A list of keywords that'll be associated with the document. Used as part of
#  keyword search.
    # @param metadata [Hash{String => Object}] A JSON object containing any metadata associated with the document that you'd
#  like to filter upon later.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DocumentRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.documents.partial_update(id: "id")
    def partial_update(id:, label: nil, status: nil, keywords: nil, metadata: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), label: label, status: status, keywords: keywords, metadata: metadata }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/documents/#{id}"
end
      Vellum::DocumentRead.from_json(json_object: response.body)
    end
# Upload a document to be indexed and used for search.
#  **Note:** Uses a base url of `https://documents.vellum.ai`.
    #
    # @param add_to_index_names [Array<String>] Optionally include the names of all indexes that you'd like this document to be
#  included in
    # @param external_id [String] Optionally include an external ID for this document. This is useful if you want
#  to re-upload the same document later when its contents change and would like it
#  to be re-indexed.
    # @param label [String] A human-friendly name for this document. Typically the filename.
    # @param contents [String, IO] 
    # @param keywords [Array<String>] Optionally include a list of keywords that'll be associated with this document.
#  Used when performing keyword searches.
    # @param metadata [String] A stringified JSON object containing any metadata associated with the document
#  that you'd like to filter upon later.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::UploadDocumentResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.documents.upload(contents: my_file.txt)
    def upload(add_to_index_names: nil, external_id: nil, label:, contents:, keywords: nil, metadata: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), add_to_index_names: add_to_index_names, external_id: external_id, label: label, contents: Vellum::FileUtilities.as_faraday_multipart(file_like: contents), keywords: keywords, metadata: metadata }.compact
  req.url "#{@request_client.get_url(environment: Documents, request_options: request_options)}/v1/upload-document"
end
      Vellum::UploadDocumentResponse.from_json(json_object: response.body)
    end
  end
  class AsyncDocumentsClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncDocumentsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Used to list documents. Optionally filter on supported fields.
    #
    # @param document_index_id [String] Filter down to only those documents that are included in the specified index.
#  You may provide either the Vellum-generated ID or the unique name of the index
#  specified upon initial creation.
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param search [String] A search term.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedSlimDocumentList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.documents.list
    def list(document_index_id: nil, limit: nil, offset: nil, ordering: nil, search: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "document_index_id": document_index_id, "limit": limit, "offset": offset, "ordering": ordering, "search": search }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/documents"
end
        Vellum::PaginatedSlimDocumentList.from_json(json_object: response.body)
      end
    end
# Retrieve a Document, keying off of either its Vellum-generated ID or its
#  external ID.
    #
    # @param id [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DocumentRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.documents.retrieve(id: "id")
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/documents/#{id}"
end
        Vellum::DocumentRead.from_json(json_object: response.body)
      end
    end
# Delete a Document, keying off of either its Vellum-generated ID or its external
#  ID.
    #
    # @param id [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.documents.destroy(id: "id")
    def destroy(id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do | req |
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
  req.url "#{@request_client.get_url(environment: Documents, request_options: request_options)}/v1/documents/#{id}"
end
      end
    end
# Update a Document, keying off of either its Vellum-generated ID or its external
#  ID. Particularly useful for updating its metadata.
    #
    # @param id [String] 
    # @param label [String] A human-readable label for the document. Defaults to the originally uploaded
#  file's file name.
    # @param status [Vellum::DOCUMENT_STATUS] The current status of the document
#  * `ACTIVE` - Active
    # @param keywords [Array<String>] A list of keywords that'll be associated with the document. Used as part of
#  keyword search.
    # @param metadata [Hash{String => Object}] A JSON object containing any metadata associated with the document that you'd
#  like to filter upon later.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DocumentRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.documents.partial_update(id: "id")
    def partial_update(id:, label: nil, status: nil, keywords: nil, metadata: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), label: label, status: status, keywords: keywords, metadata: metadata }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/documents/#{id}"
end
        Vellum::DocumentRead.from_json(json_object: response.body)
      end
    end
# Upload a document to be indexed and used for search.
#  **Note:** Uses a base url of `https://documents.vellum.ai`.
    #
    # @param add_to_index_names [Array<String>] Optionally include the names of all indexes that you'd like this document to be
#  included in
    # @param external_id [String] Optionally include an external ID for this document. This is useful if you want
#  to re-upload the same document later when its contents change and would like it
#  to be re-indexed.
    # @param label [String] A human-friendly name for this document. Typically the filename.
    # @param contents [String, IO] 
    # @param keywords [Array<String>] Optionally include a list of keywords that'll be associated with this document.
#  Used when performing keyword searches.
    # @param metadata [String] A stringified JSON object containing any metadata associated with the document
#  that you'd like to filter upon later.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::UploadDocumentResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.documents.upload(contents: my_file.txt)
    def upload(add_to_index_names: nil, external_id: nil, label:, contents:, keywords: nil, metadata: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), add_to_index_names: add_to_index_names, external_id: external_id, label: label, contents: Vellum::FileUtilities.as_faraday_multipart(file_like: contents), keywords: keywords, metadata: metadata }.compact
  req.url "#{@request_client.get_url(environment: Documents, request_options: request_options)}/v1/upload-document"
end
        Vellum::UploadDocumentResponse.from_json(json_object: response.body)
      end
    end
  end
end