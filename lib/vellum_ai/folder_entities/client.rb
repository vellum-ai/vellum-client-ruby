# frozen_string_literal: true
require_relative "../../requests"
require_relative "types/folder_entities_list_request_entity_status"
require_relative "../types/paginated_folder_entity_list"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class FolderEntitiesClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::FolderEntitiesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# List all folder entities within a specified folder.
    #
    # @param entity_status [Vellum::FolderEntities::FolderEntitiesListRequestEntityStatus] Filter down to only those objects whose entities have a status matching the
#  status specified.
#  * `ACTIVE` - Active
#  * `ARCHIVED` - Archived
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param parent_folder_id [String] Filter down to only those entities whose parent folder has the specified ID.
#  To filter by an entity's parent folder, provide the ID of the parent folder. To
#  filter by the root directory, provide
#  a string representing the entity type of the root directory. Supported root
#  directories include:
#  - PROMPT_SANDBOX
#  - WORKFLOW_SANDBOX
#  - DOCUMENT_INDEX
#  - TEST_SUITE
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedFolderEntityList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.folder_entities.list(parent_folder_id: "parent_folder_id")
    def list(entity_status: nil, limit: nil, offset: nil, ordering: nil, parent_folder_id:, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "entity_status": entity_status, "limit": limit, "offset": offset, "ordering": ordering, "parent_folder_id": parent_folder_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/folder-entities"
end
      Vellum::PaginatedFolderEntityList.from_json(json_object: response.body)
    end
# Add an entity to a specific folder or root directory.
#  Adding an entity to a folder will remove it from any other folders it might have
#  been a member of.
    #
    # @param folder_id [String] The ID of the folder to which the entity should be added. This can be a UUID of
#  a folder, or the name of a root
#  directory. Supported root directories include:
#  - PROMPT_SANDBOX
#  - WORKFLOW_SANDBOX
#  - DOCUMENT_INDEX
#  - TEST_SUITE
    # @param entity_id [String] The ID of the entity you would like to move.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.folder_entities.add_entity_to_folder(folder_id: "folder_id", entity_id: "entity_id")
    def add_entity_to_folder(folder_id:, entity_id:, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), entity_id: entity_id }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/folders/#{folder_id}/add-entity"
end
    end
  end
  class AsyncFolderEntitiesClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncFolderEntitiesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# List all folder entities within a specified folder.
    #
    # @param entity_status [Vellum::FolderEntities::FolderEntitiesListRequestEntityStatus] Filter down to only those objects whose entities have a status matching the
#  status specified.
#  * `ACTIVE` - Active
#  * `ARCHIVED` - Archived
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param parent_folder_id [String] Filter down to only those entities whose parent folder has the specified ID.
#  To filter by an entity's parent folder, provide the ID of the parent folder. To
#  filter by the root directory, provide
#  a string representing the entity type of the root directory. Supported root
#  directories include:
#  - PROMPT_SANDBOX
#  - WORKFLOW_SANDBOX
#  - DOCUMENT_INDEX
#  - TEST_SUITE
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedFolderEntityList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.folder_entities.list(parent_folder_id: "parent_folder_id")
    def list(entity_status: nil, limit: nil, offset: nil, ordering: nil, parent_folder_id:, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "entity_status": entity_status, "limit": limit, "offset": offset, "ordering": ordering, "parent_folder_id": parent_folder_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/folder-entities"
end
        Vellum::PaginatedFolderEntityList.from_json(json_object: response.body)
      end
    end
# Add an entity to a specific folder or root directory.
#  Adding an entity to a folder will remove it from any other folders it might have
#  been a member of.
    #
    # @param folder_id [String] The ID of the folder to which the entity should be added. This can be a UUID of
#  a folder, or the name of a root
#  directory. Supported root directories include:
#  - PROMPT_SANDBOX
#  - WORKFLOW_SANDBOX
#  - DOCUMENT_INDEX
#  - TEST_SUITE
    # @param entity_id [String] The ID of the entity you would like to move.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.folder_entities.add_entity_to_folder(folder_id: "folder_id", entity_id: "entity_id")
    def add_entity_to_folder(folder_id:, entity_id:, request_options: nil)
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
  else
    req.headers["X-API-Version"] = "2025-07-30"
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), entity_id: entity_id }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/folders/#{folder_id}/add-entity"
end
      end
    end
  end
end