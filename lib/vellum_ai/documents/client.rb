# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/paginated_slim_document_list"
require_relative "../types/document_status"
require_relative "../types/document_read"
require_relative "../types/upload_document_response"
require_relative "../../core/file_utilities"
require "async"

module Vellum
  class DocumentsClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [DocumentsClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Used to list documents. Optionally filter on supported fields.
    #
    # @param document_index_id [String] Filter down to only those documents that are included in the specified index. You may provide either the Vellum-generated ID or the unique name of the index specified upon initial creation.
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param request_options [RequestOptions]
    # @return [PaginatedSlimDocumentList]
    def list(document_index_id: nil, limit: nil, offset: nil, ordering: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "document_index_id": document_index_id,
          "limit": limit,
          "offset": offset,
          "ordering": ordering
        }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/documents"
      end
      PaginatedSlimDocumentList.from_json(json_object: response.body)
    end

    # @param id [String] A UUID string identifying this document.
    # @param request_options [RequestOptions]
    # @return [Void]
    def destroy(id:, request_options: nil)
      @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/documents/#{id}"
      end
    end

    # Update a Document, keying off of its Vellum-generated ID. Particularly useful for updating its metadata.
    #
    # @param id [String] A UUID string identifying this document.
    # @param label [String] A human-readable label for the document. Defaults to the originally uploaded file's file name.
    # @param status [DOCUMENT_STATUS] The current status of the document
    #   * `ACTIVE` - Active
    # @param metadata [Hash{String => String}] A JSON object containing any metadata associated with the document that you'd like to filter upon later.
    # @param request_options [RequestOptions]
    # @return [DocumentRead]
    def partial_update(id:, label: nil, status: nil, metadata: nil, request_options: nil)
      response = @request_client.conn.patch do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          label: label,
          status: status,
          metadata: metadata
        }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/documents/#{id}"
      end
      DocumentRead.from_json(json_object: response.body)
    end

    # Upload a document to be indexed and used for search.
    #
    # **Note:** Uses a base url of `https://documents.vellum.ai`.
    #
    # This is a multipart/form-data request. The `contents` field should be a file upload. It also expects a JSON body with the following fields:
    #
    # - `add_to_index_names: list[str]` - Optionally include the names of all indexes that you'd like this document to be included in
    # - `external_id: str | None` - Optionally include an external ID for this document. This is useful if you want to re-upload the same document later when its contents change and would like it to be re-indexed.
    # - `label: str` - A human-friendly name for this document. Typically the filename.
    # - `keywords: list[str] | None` - Optionally include a list of keywords that'll be associated with this document. Used when performing keyword searches.
    # - `metadata: dict[str, Any]` - A stringified JSON object containing any metadata associated with the document that you'd like to filter upon later.
    #
    # @param add_to_index_names [Array<String>] Optionally include the names of all indexes that you'd like this document to be included in
    # @param external_id [String] Optionally include an external ID for this document. This is useful if you want to re-upload the same document later when its contents change and would like it to be re-indexed.
    # @param label [String] A human-friendly name for this document. Typically the filename.
    # @param contents [String, IO]
    # @param keywords [Array<String>] Optionally include a list of keywords that'll be associated with this document. Used when performing keyword searches.
    # @param metadata [String] A stringified JSON object containing any metadata associated with the document that you'd like to filter upon later.
    # @param request_options [RequestOptions]
    # @return [UploadDocumentResponse]
    def upload(label:, contents:, add_to_index_names: nil, external_id: nil, keywords: nil, metadata: nil,
               request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          add_to_index_names: add_to_index_names,
          external_id: external_id,
          label: label,
          contents: FileUtilities.as_faraday_multipart(file_like: contents),
          keywords: keywords,
          metadata: metadata
        }.compact
        req.url "#{@request_client.default_environment[:Documents]}/v1/upload-document"
      end
      UploadDocumentResponse.from_json(json_object: response.body)
    end
  end

  class AsyncDocumentsClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncDocumentsClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Used to list documents. Optionally filter on supported fields.
    #
    # @param document_index_id [String] Filter down to only those documents that are included in the specified index. You may provide either the Vellum-generated ID or the unique name of the index specified upon initial creation.
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param request_options [RequestOptions]
    # @return [PaginatedSlimDocumentList]
    def list(document_index_id: nil, limit: nil, offset: nil, ordering: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "document_index_id": document_index_id,
            "limit": limit,
            "offset": offset,
            "ordering": ordering
          }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/documents"
        end
        PaginatedSlimDocumentList.from_json(json_object: response.body)
      end
    end

    # @param id [String] A UUID string identifying this document.
    # @param request_options [RequestOptions]
    # @return [Void]
    def destroy(id:, request_options: nil)
      Async do
        @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/documents/#{id}"
        end
      end
    end

    # Update a Document, keying off of its Vellum-generated ID. Particularly useful for updating its metadata.
    #
    # @param id [String] A UUID string identifying this document.
    # @param label [String] A human-readable label for the document. Defaults to the originally uploaded file's file name.
    # @param status [DOCUMENT_STATUS] The current status of the document
    #   * `ACTIVE` - Active
    # @param metadata [Hash{String => String}] A JSON object containing any metadata associated with the document that you'd like to filter upon later.
    # @param request_options [RequestOptions]
    # @return [DocumentRead]
    def partial_update(id:, label: nil, status: nil, metadata: nil, request_options: nil)
      Async do
        response = @request_client.conn.patch do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            label: label,
            status: status,
            metadata: metadata
          }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/documents/#{id}"
        end
        DocumentRead.from_json(json_object: response.body)
      end
    end

    # Upload a document to be indexed and used for search.
    #
    # **Note:** Uses a base url of `https://documents.vellum.ai`.
    #
    # This is a multipart/form-data request. The `contents` field should be a file upload. It also expects a JSON body with the following fields:
    #
    # - `add_to_index_names: list[str]` - Optionally include the names of all indexes that you'd like this document to be included in
    # - `external_id: str | None` - Optionally include an external ID for this document. This is useful if you want to re-upload the same document later when its contents change and would like it to be re-indexed.
    # - `label: str` - A human-friendly name for this document. Typically the filename.
    # - `keywords: list[str] | None` - Optionally include a list of keywords that'll be associated with this document. Used when performing keyword searches.
    # - `metadata: dict[str, Any]` - A stringified JSON object containing any metadata associated with the document that you'd like to filter upon later.
    #
    # @param add_to_index_names [Array<String>] Optionally include the names of all indexes that you'd like this document to be included in
    # @param external_id [String] Optionally include an external ID for this document. This is useful if you want to re-upload the same document later when its contents change and would like it to be re-indexed.
    # @param label [String] A human-friendly name for this document. Typically the filename.
    # @param contents [String, IO]
    # @param keywords [Array<String>] Optionally include a list of keywords that'll be associated with this document. Used when performing keyword searches.
    # @param metadata [String] A stringified JSON object containing any metadata associated with the document that you'd like to filter upon later.
    # @param request_options [RequestOptions]
    # @return [UploadDocumentResponse]
    def upload(label:, contents:, add_to_index_names: nil, external_id: nil, keywords: nil, metadata: nil,
               request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            add_to_index_names: add_to_index_names,
            external_id: external_id,
            label: label,
            contents: FileUtilities.as_faraday_multipart(file_like: contents),
            keywords: keywords,
            metadata: metadata
          }.compact
          req.url "#{@request_client.default_environment[:Documents]}/v1/upload-document"
        end
        UploadDocumentResponse.from_json(json_object: response.body)
      end
    end
  end
end
