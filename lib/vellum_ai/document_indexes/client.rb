# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/document_indexes_list_request_status"
require_relative "../types/paginated_document_index_read_list"
require_relative "../types/entity_status"
require_relative "../types/environment_enum"
require_relative "../types/document_index_read"
require "async"

module Vellum
  class DocumentIndexesClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [DocumentIndexesClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Used to retrieve a list of Document Indexes.
    #
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param status [DOCUMENT_INDEXES_LIST_REQUEST_STATUS] The current status of the document index
    #   - `ACTIVE` - Active
    #   - `ARCHIVED` - Archived
    # @param request_options [RequestOptions]
    # @return [PaginatedDocumentIndexReadList]
    def list(limit: nil, offset: nil, ordering: nil, status: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "limit": limit,
          "offset": offset,
          "ordering": ordering,
          "status": status
        }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/document-indexes"
      end
      PaginatedDocumentIndexReadList.from_json(json_object: response.body)
    end

    # Creates a new document index.
    #
    # @param label [String] A human-readable label for the document index
    # @param name [String] A name that uniquely identifies this index within its workspace
    # @param status [ENTITY_STATUS] The current status of the document index
    #   * `ACTIVE` - Active
    #   * `ARCHIVED` - Archived
    # @param environment [ENVIRONMENT_ENUM] The environment this document index is used in
    #   * `DEVELOPMENT` - Development
    #   * `STAGING` - Staging
    #   * `PRODUCTION` - Production
    # @param indexing_config [Hash{String => String}] Configuration representing how documents should be indexed
    # @param copy_documents_from_index_id [String] Optionally specify the id of a document index from which you'd like to copy and re-index its documents into this newly created index
    # @param request_options [RequestOptions]
    # @return [DocumentIndexRead]
    def create(label:, name:, indexing_config:, status: nil, environment: nil, copy_documents_from_index_id: nil,
               request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          label: label,
          name: name,
          status: status,
          environment: environment,
          indexing_config: indexing_config,
          copy_documents_from_index_id: copy_documents_from_index_id
        }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/document-indexes"
      end
      DocumentIndexRead.from_json(json_object: response.body)
    end

    # Used to retrieve a Document Index given its ID or name.
    #
    # @param id [String] Either the Document Index's ID or its unique name
    # @param request_options [RequestOptions]
    # @return [DocumentIndexRead]
    def retrieve(id:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/document-indexes/#{id}"
      end
      DocumentIndexRead.from_json(json_object: response.body)
    end

    # Used to fully update a Document Index given its ID.
    #
    # @param id [String] A UUID string identifying this document index.
    # @param label [String] A human-readable label for the document index
    # @param status [ENTITY_STATUS] The current status of the document index
    #   * `ACTIVE` - Active
    #   * `ARCHIVED` - Archived
    # @param environment [ENVIRONMENT_ENUM] The environment this document index is used in
    #   * `DEVELOPMENT` - Development
    #   * `STAGING` - Staging
    #   * `PRODUCTION` - Production
    # @param request_options [RequestOptions]
    # @return [DocumentIndexRead]
    def update(id:, label:, status: nil, environment: nil, request_options: nil)
      response = @request_client.conn.put do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          label: label,
          status: status,
          environment: environment
        }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/document-indexes/#{id}"
      end
      DocumentIndexRead.from_json(json_object: response.body)
    end

    # Used to delete a Document Index given its ID.
    #
    # @param id [String] A UUID string identifying this document index.
    # @param request_options [RequestOptions]
    # @return [Void]
    def destroy(id:, request_options: nil)
      @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/document-indexes/#{id}"
      end
    end

    # Used to partial update a Document Index given its ID.
    #
    # @param id [String] A UUID string identifying this document index.
    # @param label [String] A human-readable label for the document index
    # @param status [ENTITY_STATUS] The current status of the document index
    #   * `ACTIVE` - Active
    #   * `ARCHIVED` - Archived
    # @param environment [ENVIRONMENT_ENUM] The environment this document index is used in
    #   * `DEVELOPMENT` - Development
    #   * `STAGING` - Staging
    #   * `PRODUCTION` - Production
    # @param request_options [RequestOptions]
    # @return [DocumentIndexRead]
    def partial_update(id:, label: nil, status: nil, environment: nil, request_options: nil)
      response = @request_client.conn.patch do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          label: label,
          status: status,
          environment: environment
        }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/document-indexes/#{id}"
      end
      DocumentIndexRead.from_json(json_object: response.body)
    end
  end

  class AsyncDocumentIndexesClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncDocumentIndexesClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Used to retrieve a list of Document Indexes.
    #
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param status [DOCUMENT_INDEXES_LIST_REQUEST_STATUS] The current status of the document index
    #   - `ACTIVE` - Active
    #   - `ARCHIVED` - Archived
    # @param request_options [RequestOptions]
    # @return [PaginatedDocumentIndexReadList]
    def list(limit: nil, offset: nil, ordering: nil, status: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "limit": limit,
            "offset": offset,
            "ordering": ordering,
            "status": status
          }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/document-indexes"
        end
        PaginatedDocumentIndexReadList.from_json(json_object: response.body)
      end
    end

    # Creates a new document index.
    #
    # @param label [String] A human-readable label for the document index
    # @param name [String] A name that uniquely identifies this index within its workspace
    # @param status [ENTITY_STATUS] The current status of the document index
    #   * `ACTIVE` - Active
    #   * `ARCHIVED` - Archived
    # @param environment [ENVIRONMENT_ENUM] The environment this document index is used in
    #   * `DEVELOPMENT` - Development
    #   * `STAGING` - Staging
    #   * `PRODUCTION` - Production
    # @param indexing_config [Hash{String => String}] Configuration representing how documents should be indexed
    # @param copy_documents_from_index_id [String] Optionally specify the id of a document index from which you'd like to copy and re-index its documents into this newly created index
    # @param request_options [RequestOptions]
    # @return [DocumentIndexRead]
    def create(label:, name:, indexing_config:, status: nil, environment: nil, copy_documents_from_index_id: nil,
               request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            label: label,
            name: name,
            status: status,
            environment: environment,
            indexing_config: indexing_config,
            copy_documents_from_index_id: copy_documents_from_index_id
          }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/document-indexes"
        end
        DocumentIndexRead.from_json(json_object: response.body)
      end
    end

    # Used to retrieve a Document Index given its ID or name.
    #
    # @param id [String] Either the Document Index's ID or its unique name
    # @param request_options [RequestOptions]
    # @return [DocumentIndexRead]
    def retrieve(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/document-indexes/#{id}"
        end
        DocumentIndexRead.from_json(json_object: response.body)
      end
    end

    # Used to fully update a Document Index given its ID.
    #
    # @param id [String] A UUID string identifying this document index.
    # @param label [String] A human-readable label for the document index
    # @param status [ENTITY_STATUS] The current status of the document index
    #   * `ACTIVE` - Active
    #   * `ARCHIVED` - Archived
    # @param environment [ENVIRONMENT_ENUM] The environment this document index is used in
    #   * `DEVELOPMENT` - Development
    #   * `STAGING` - Staging
    #   * `PRODUCTION` - Production
    # @param request_options [RequestOptions]
    # @return [DocumentIndexRead]
    def update(id:, label:, status: nil, environment: nil, request_options: nil)
      Async do
        response = @request_client.conn.put do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            label: label,
            status: status,
            environment: environment
          }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/document-indexes/#{id}"
        end
        DocumentIndexRead.from_json(json_object: response.body)
      end
    end

    # Used to delete a Document Index given its ID.
    #
    # @param id [String] A UUID string identifying this document index.
    # @param request_options [RequestOptions]
    # @return [Void]
    def destroy(id:, request_options: nil)
      Async do
        @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/document-indexes/#{id}"
        end
      end
    end

    # Used to partial update a Document Index given its ID.
    #
    # @param id [String] A UUID string identifying this document index.
    # @param label [String] A human-readable label for the document index
    # @param status [ENTITY_STATUS] The current status of the document index
    #   * `ACTIVE` - Active
    #   * `ARCHIVED` - Archived
    # @param environment [ENVIRONMENT_ENUM] The environment this document index is used in
    #   * `DEVELOPMENT` - Development
    #   * `STAGING` - Staging
    #   * `PRODUCTION` - Production
    # @param request_options [RequestOptions]
    # @return [DocumentIndexRead]
    def partial_update(id:, label: nil, status: nil, environment: nil, request_options: nil)
      Async do
        response = @request_client.conn.patch do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            label: label,
            status: status,
            environment: environment
          }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/document-indexes/#{id}"
        end
        DocumentIndexRead.from_json(json_object: response.body)
      end
    end
  end
end
