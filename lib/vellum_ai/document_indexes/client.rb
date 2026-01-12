# frozen_string_literal: true
require_relative "../../requests"
require_relative "types/document_indexes_list_request_status"
require_relative "../types/paginated_document_index_read_list"
require_relative "../types/entity_status"
require_relative "../types/document_index_indexing_config_request"
require_relative "../types/document_index_read"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class DocumentIndexesClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::DocumentIndexesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Used to retrieve a list of Document Indexes.
    #
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param search [String] Search for document indices by name or label
    # @param status [Vellum::DocumentIndexes::DocumentIndexesListRequestStatus] Filter down to only document indices that have a status matching the status
#  specified
#  * `ACTIVE` - Active
#  * `ARCHIVED` - Archived
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedDocumentIndexReadList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.list
    def list(limit: nil, offset: nil, ordering: nil, search: nil, status: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset, "ordering": ordering, "search": search, "status": status }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/document-indexes"
end
      Vellum::PaginatedDocumentIndexReadList.from_json(json_object: response.body)
    end
# Creates a new document index.
    #
    # @param label [String] A human-readable label for the document index
    # @param name [String] A name that uniquely identifies this index within its workspace
    # @param status [Vellum::EntityStatus] The current status of the document index
#  * `ACTIVE` - Active
#  * `ARCHIVED` - Archived
    # @param indexing_config [Hash] Request of type Vellum::DocumentIndexIndexingConfigRequest, as a Hash
    #   * :vectorizer (Hash)
    #   * :chunking (Hash)
    # @param copy_documents_from_index_id [String] Optionally specify the id of a document index from which you'd like to copy and
#  re-index its documents into this newly created index
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DocumentIndexRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.create(
#    label: "x",
#    name: "x",
#    indexing_config: {  }
#  )
    def create(label:, name:, status: nil, indexing_config:, copy_documents_from_index_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), label: label, name: name, status: status, indexing_config: indexing_config, copy_documents_from_index_id: copy_documents_from_index_id }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/document-indexes"
end
      Vellum::DocumentIndexRead.from_json(json_object: response.body)
    end
# Used to retrieve a Document Index given its ID or name.
    #
    # @param id [String] Either the Document Index's ID or its unique name
    # @param mask_indexing_config [Boolean] Whether to mask the indexing configuration in the response
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DocumentIndexRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.retrieve(id: "id")
    def retrieve(id:, mask_indexing_config: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "mask_indexing_config": mask_indexing_config }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/document-indexes/#{id}"
end
      Vellum::DocumentIndexRead.from_json(json_object: response.body)
    end
# Used to fully update a Document Index given its ID or name.
    #
    # @param id [String] Either the Document Index's ID or its unique name
    # @param label [String] A human-readable label for the document index
    # @param status [Vellum::EntityStatus] The current status of the document index
#  * `ACTIVE` - Active
#  * `ARCHIVED` - Archived
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DocumentIndexRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.update(id: "id", label: "x")
    def update(id:, label:, status: nil, request_options: nil)
      response = @request_client.conn.put do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), label: label, status: status }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/document-indexes/#{id}"
end
      Vellum::DocumentIndexRead.from_json(json_object: response.body)
    end
# Used to delete a Document Index given its ID or name.
    #
    # @param id [String] Either the Document Index's ID or its unique name
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.destroy(id: "id")
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
  req.url "#{@request_client.get_url(environment: Documents, request_options: request_options)}/v1/document-indexes/#{id}"
end
    end
# Used to partial update a Document Index given its ID or name.
    #
    # @param id [String] Either the Document Index's ID or its unique name
    # @param label [String] A human-readable label for the document index
    # @param status [Vellum::EntityStatus] The current status of the document index
#  * `ACTIVE` - Active
#  * `ARCHIVED` - Archived
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DocumentIndexRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.partial_update(id: "id")
    def partial_update(id:, label: nil, status: nil, request_options: nil)
      response = @request_client.conn.patch do | req |
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
  req.body = { **(request_options&.additional_body_parameters || {}), label: label, status: status }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/document-indexes/#{id}"
end
      Vellum::DocumentIndexRead.from_json(json_object: response.body)
    end
# Adds a previously uploaded Document to the specified Document Index.
    #
    # @param id [String] Either the Vellum-generated ID or the originally specified name that uniquely
#  identifies the Document Index to which you'd like to add the Document.
    # @param document_id [String] Either the Vellum-generated ID or the originally supplied external_id that
#  uniquely identifies the Document you'd like to add.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.add_document(id: "id", document_id: "document_id")
    def add_document(id:, document_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/document-indexes/#{id}/documents/#{document_id}"
end
    end
# Removes a Document from a Document Index without deleting the Document itself.
    #
    # @param id [String] Either the Vellum-generated ID or the originally specified name that uniquely
#  identifies the Document Index from which you'd like to remove a Document.
    # @param document_id [String] Either the Vellum-generated ID or the originally supplied external_id that
#  uniquely identifies the Document you'd like to remove.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.remove_document(id: "id", document_id: "document_id")
    def remove_document(id:, document_id:, request_options: nil)
      response = @request_client.conn.delete do | req |
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
  req.url "#{@request_client.get_url(environment: Documents, request_options: request_options)}/v1/document-indexes/#{id}/documents/#{document_id}"
end
    end
  end
  class AsyncDocumentIndexesClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncDocumentIndexesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Used to retrieve a list of Document Indexes.
    #
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param search [String] Search for document indices by name or label
    # @param status [Vellum::DocumentIndexes::DocumentIndexesListRequestStatus] Filter down to only document indices that have a status matching the status
#  specified
#  * `ACTIVE` - Active
#  * `ARCHIVED` - Archived
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedDocumentIndexReadList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.list
    def list(limit: nil, offset: nil, ordering: nil, search: nil, status: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset, "ordering": ordering, "search": search, "status": status }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/document-indexes"
end
        Vellum::PaginatedDocumentIndexReadList.from_json(json_object: response.body)
      end
    end
# Creates a new document index.
    #
    # @param label [String] A human-readable label for the document index
    # @param name [String] A name that uniquely identifies this index within its workspace
    # @param status [Vellum::EntityStatus] The current status of the document index
#  * `ACTIVE` - Active
#  * `ARCHIVED` - Archived
    # @param indexing_config [Hash] Request of type Vellum::DocumentIndexIndexingConfigRequest, as a Hash
    #   * :vectorizer (Hash)
    #   * :chunking (Hash)
    # @param copy_documents_from_index_id [String] Optionally specify the id of a document index from which you'd like to copy and
#  re-index its documents into this newly created index
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DocumentIndexRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.create(
#    label: "x",
#    name: "x",
#    indexing_config: {  }
#  )
    def create(label:, name:, status: nil, indexing_config:, copy_documents_from_index_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), label: label, name: name, status: status, indexing_config: indexing_config, copy_documents_from_index_id: copy_documents_from_index_id }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/document-indexes"
end
        Vellum::DocumentIndexRead.from_json(json_object: response.body)
      end
    end
# Used to retrieve a Document Index given its ID or name.
    #
    # @param id [String] Either the Document Index's ID or its unique name
    # @param mask_indexing_config [Boolean] Whether to mask the indexing configuration in the response
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DocumentIndexRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.retrieve(id: "id")
    def retrieve(id:, mask_indexing_config: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "mask_indexing_config": mask_indexing_config }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/document-indexes/#{id}"
end
        Vellum::DocumentIndexRead.from_json(json_object: response.body)
      end
    end
# Used to fully update a Document Index given its ID or name.
    #
    # @param id [String] Either the Document Index's ID or its unique name
    # @param label [String] A human-readable label for the document index
    # @param status [Vellum::EntityStatus] The current status of the document index
#  * `ACTIVE` - Active
#  * `ARCHIVED` - Archived
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DocumentIndexRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.update(id: "id", label: "x")
    def update(id:, label:, status: nil, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), label: label, status: status }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/document-indexes/#{id}"
end
        Vellum::DocumentIndexRead.from_json(json_object: response.body)
      end
    end
# Used to delete a Document Index given its ID or name.
    #
    # @param id [String] Either the Document Index's ID or its unique name
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.destroy(id: "id")
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
  req.url "#{@request_client.get_url(environment: Documents, request_options: request_options)}/v1/document-indexes/#{id}"
end
      end
    end
# Used to partial update a Document Index given its ID or name.
    #
    # @param id [String] Either the Document Index's ID or its unique name
    # @param label [String] A human-readable label for the document index
    # @param status [Vellum::EntityStatus] The current status of the document index
#  * `ACTIVE` - Active
#  * `ARCHIVED` - Archived
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DocumentIndexRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.partial_update(id: "id")
    def partial_update(id:, label: nil, status: nil, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), label: label, status: status }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/document-indexes/#{id}"
end
        Vellum::DocumentIndexRead.from_json(json_object: response.body)
      end
    end
# Adds a previously uploaded Document to the specified Document Index.
    #
    # @param id [String] Either the Vellum-generated ID or the originally specified name that uniquely
#  identifies the Document Index to which you'd like to add the Document.
    # @param document_id [String] Either the Vellum-generated ID or the originally supplied external_id that
#  uniquely identifies the Document you'd like to add.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.add_document(id: "id", document_id: "document_id")
    def add_document(id:, document_id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/document-indexes/#{id}/documents/#{document_id}"
end
      end
    end
# Removes a Document from a Document Index without deleting the Document itself.
    #
    # @param id [String] Either the Vellum-generated ID or the originally specified name that uniquely
#  identifies the Document Index from which you'd like to remove a Document.
    # @param document_id [String] Either the Vellum-generated ID or the originally supplied external_id that
#  uniquely identifies the Document you'd like to remove.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.document_indexes.remove_document(id: "id", document_id: "document_id")
    def remove_document(id:, document_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(environment: Documents, request_options: request_options)}/v1/document-indexes/#{id}/documents/#{document_id}"
end
      end
    end
  end
end