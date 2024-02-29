# frozen_string_literal: true

require_relative "../../requests"
require "async"

module Vellum
  class FolderEntitiesClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [FolderEntitiesClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Add an entity to a specific folder or root directory.
    #
    # Adding an entity to a folder will remove it from any other folders it might have been a member of.
    #
    # @param folder_id [String] The ID of the folder to which the entity should be added. This can be a UUID of a folder, or the name of a root directory (e.g. "PROMPT_SANDBOX").
    # @param entity_id [String] The ID of the entity you would like to move.
    # @param request_options [RequestOptions]
    # @return [Void]
    def add_entity_to_folder(folder_id:, entity_id:, request_options: nil)
      @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = { **(request_options&.additional_body_parameters || {}), entity_id: entity_id }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/folders/#{folder_id}/add-entity"
      end
    end
  end

  class AsyncFolderEntitiesClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncFolderEntitiesClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Add an entity to a specific folder or root directory.
    #
    # Adding an entity to a folder will remove it from any other folders it might have been a member of.
    #
    # @param folder_id [String] The ID of the folder to which the entity should be added. This can be a UUID of a folder, or the name of a root directory (e.g. "PROMPT_SANDBOX").
    # @param entity_id [String] The ID of the entity you would like to move.
    # @param request_options [RequestOptions]
    # @return [Void]
    def add_entity_to_folder(folder_id:, entity_id:, request_options: nil)
      Async do
        @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = { **(request_options&.additional_body_parameters || {}), entity_id: entity_id }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/folders/#{folder_id}/add-entity"
        end
      end
    end
  end
end
