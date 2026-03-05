# frozen_string_literal: true
require_relative "../../requests"
require_relative "types/workflow_deployments_list_request_status"
require_relative "../types/paginated_slim_workflow_deployment_list"
require_relative "../types/workflow_deployment_read"
require_relative "../types/workflow_deployment_event_executions_response"
require_relative "../types/workflow_event_execution_read"
require_relative "../types/workflow_deployment_history_item"
require_relative "types/list_workflow_release_tags_request_source"
require_relative "../types/paginated_workflow_release_tag_read_list"
require_relative "../types/workflow_release_tag_read"
require_relative "../types/paginated_workflow_deployment_release_list"
require_relative "../types/workflow_deployment_release"
require "async"
require "async"
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
  class WorkflowDeploymentsClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::WorkflowDeploymentsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Used to list all Workflow Deployments.
    #
    # @param has_story_config [String] has_story_config
    # @param is_public [String] is_public
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Specifies the ordering of the returned Workflow Deployments. Valid values are:
#  - `created` - Orders by creation time in ascending order.
#  - `-created` - Orders by creation time in descending order. (default)
#  - `name` - Orders by name in ascending order.
#  - `-name` - Orders by name in descending order.
#  Compound orderings are supported by separating fields with commas, e.g.,
#  `-created,name`.
    # @param owned_by [String] owned_by
    # @param status [Vellum::WorkflowDeployments::WorkflowDeploymentsListRequestStatus] status
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedSlimWorkflowDeploymentList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.list
    def list(has_story_config: nil, is_public: nil, limit: nil, offset: nil, ordering: nil, owned_by: nil, status: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "has_story_config": has_story_config, "is_public": is_public, "limit": limit, "offset": offset, "ordering": ordering, "owned_by": owned_by, "status": status }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments"
end
      Vellum::PaginatedSlimWorkflowDeploymentList.from_json(json_object: response.body)
    end
# Used to retrieve a workflow deployment given its ID or name.
    #
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowDeploymentRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.retrieve(id: "id")
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}"
end
      Vellum::WorkflowDeploymentRead.from_json(json_object: response.body)
    end
    # @param id [String] 
    # @param filters [String] 
    # @param limit [Integer] Number of executions to return per page.
    # @param offset [Integer] The initial index from which to return the executions.
    # @param ordering [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowDeploymentEventExecutionsResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.list_workflow_deployment_event_executions(id: "id")
    def list_workflow_deployment_event_executions(id:, filters: nil, limit: nil, offset: nil, ordering: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "filters": filters, "limit": limit, "offset": offset, "ordering": ordering }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}/execution-events"
end
      Vellum::WorkflowDeploymentEventExecutionsResponse.from_json(json_object: response.body)
    end
    # @param execution_id [String] 
    # @param id [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowEventExecutionRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.workflow_deployment_event_execution(execution_id: "execution_id", id: "id")
    def workflow_deployment_event_execution(execution_id:, id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{execution_id}/execution-events/#{id}"
end
      Vellum::WorkflowEventExecutionRead.from_json(json_object: response.body)
    end
# DEPRECATED: This endpoint is deprecated and will be removed in a future release.
#  Please use the
#  `retrieve_workflow_deployment_release` endpoint instead.
    #
    # @param history_id_or_release_tag [String] Either the UUID of Workflow Deployment History Item you'd like to retrieve, or
#  the name of a Release Tag that's pointing to the Workflow Deployment History
#  Item you'd like to retrieve.
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowDeploymentHistoryItem]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.workflow_deployment_history_item_retrieve(history_id_or_release_tag: "history_id_or_release_tag", id: "id")
    def workflow_deployment_history_item_retrieve(history_id_or_release_tag:, id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{history_id_or_release_tag}/history/#{id}"
end
      Vellum::WorkflowDeploymentHistoryItem.from_json(json_object: response.body)
    end
# List Release Tags associated with the specified Workflow Deployment
    #
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param source [Vellum::WorkflowDeployments::ListWorkflowReleaseTagsRequestSource] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedWorkflowReleaseTagReadList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.list_workflow_release_tags(id: "id")
    def list_workflow_release_tags(id:, limit: nil, offset: nil, ordering: nil, source: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset, "ordering": ordering, "source": source }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}/release-tags"
end
      Vellum::PaginatedWorkflowReleaseTagReadList.from_json(json_object: response.body)
    end
# Retrieve a Workflow Release Tag by tag name, associated with a specified
#  Workflow Deployment.
    #
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param name [String] The name of the Release Tag associated with this Workflow Deployment that you'd
#  like to retrieve.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowReleaseTagRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.retrieve_workflow_release_tag(id: "id", name: "name")
    def retrieve_workflow_release_tag(id:, name:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}/release-tags/#{name}"
end
      Vellum::WorkflowReleaseTagRead.from_json(json_object: response.body)
    end
# Updates an existing Release Tag associated with the specified Workflow
#  Deployment.
    #
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param name [String] The name of the Release Tag associated with this Workflow Deployment that you'd
#  like to update.
    # @param history_item_id [String] The ID of the Workflow Deployment History Item to tag
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowReleaseTagRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.update_workflow_release_tag(id: "id", name: "name")
    def update_workflow_release_tag(id:, name:, history_item_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), history_item_id: history_item_id }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}/release-tags/#{name}"
end
      Vellum::WorkflowReleaseTagRead.from_json(json_object: response.body)
    end
# List the Releases of the specified Workflow Deployment for the current
#  Environment.
    #
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedWorkflowDeploymentReleaseList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.list_workflow_deployment_releases(id: "id")
    def list_workflow_deployment_releases(id:, limit: nil, offset: nil, ordering: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset, "ordering": ordering }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}/releases"
end
      Vellum::PaginatedWorkflowDeploymentReleaseList.from_json(json_object: response.body)
    end
# Retrieve a specific Workflow Deployment Release by either its UUID or the name
#  of a Release Tag that points to it.
    #
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param release_id_or_release_tag [String] Either the UUID of Workflow Deployment Release you'd like to retrieve, or the
#  name of a Release Tag that's pointing to the Workflow Deployment Release you'd
#  like to retrieve.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowDeploymentRelease]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.retrieve_workflow_deployment_release(id: "id", release_id_or_release_tag: "release_id_or_release_tag")
    def retrieve_workflow_deployment_release(id:, release_id_or_release_tag:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}/releases/#{release_id_or_release_tag}"
end
      Vellum::WorkflowDeploymentRelease.from_json(json_object: response.body)
    end
  end
  class AsyncWorkflowDeploymentsClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncWorkflowDeploymentsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Used to list all Workflow Deployments.
    #
    # @param has_story_config [String] has_story_config
    # @param is_public [String] is_public
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Specifies the ordering of the returned Workflow Deployments. Valid values are:
#  - `created` - Orders by creation time in ascending order.
#  - `-created` - Orders by creation time in descending order. (default)
#  - `name` - Orders by name in ascending order.
#  - `-name` - Orders by name in descending order.
#  Compound orderings are supported by separating fields with commas, e.g.,
#  `-created,name`.
    # @param owned_by [String] owned_by
    # @param status [Vellum::WorkflowDeployments::WorkflowDeploymentsListRequestStatus] status
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedSlimWorkflowDeploymentList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.list
    def list(has_story_config: nil, is_public: nil, limit: nil, offset: nil, ordering: nil, owned_by: nil, status: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "has_story_config": has_story_config, "is_public": is_public, "limit": limit, "offset": offset, "ordering": ordering, "owned_by": owned_by, "status": status }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments"
end
        Vellum::PaginatedSlimWorkflowDeploymentList.from_json(json_object: response.body)
      end
    end
# Used to retrieve a workflow deployment given its ID or name.
    #
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowDeploymentRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.retrieve(id: "id")
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}"
end
        Vellum::WorkflowDeploymentRead.from_json(json_object: response.body)
      end
    end
    # @param id [String] 
    # @param filters [String] 
    # @param limit [Integer] Number of executions to return per page.
    # @param offset [Integer] The initial index from which to return the executions.
    # @param ordering [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowDeploymentEventExecutionsResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.list_workflow_deployment_event_executions(id: "id")
    def list_workflow_deployment_event_executions(id:, filters: nil, limit: nil, offset: nil, ordering: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "filters": filters, "limit": limit, "offset": offset, "ordering": ordering }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}/execution-events"
end
        Vellum::WorkflowDeploymentEventExecutionsResponse.from_json(json_object: response.body)
      end
    end
    # @param execution_id [String] 
    # @param id [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowEventExecutionRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.workflow_deployment_event_execution(execution_id: "execution_id", id: "id")
    def workflow_deployment_event_execution(execution_id:, id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{execution_id}/execution-events/#{id}"
end
        Vellum::WorkflowEventExecutionRead.from_json(json_object: response.body)
      end
    end
# DEPRECATED: This endpoint is deprecated and will be removed in a future release.
#  Please use the
#  `retrieve_workflow_deployment_release` endpoint instead.
    #
    # @param history_id_or_release_tag [String] Either the UUID of Workflow Deployment History Item you'd like to retrieve, or
#  the name of a Release Tag that's pointing to the Workflow Deployment History
#  Item you'd like to retrieve.
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowDeploymentHistoryItem]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.workflow_deployment_history_item_retrieve(history_id_or_release_tag: "history_id_or_release_tag", id: "id")
    def workflow_deployment_history_item_retrieve(history_id_or_release_tag:, id:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{history_id_or_release_tag}/history/#{id}"
end
        Vellum::WorkflowDeploymentHistoryItem.from_json(json_object: response.body)
      end
    end
# List Release Tags associated with the specified Workflow Deployment
    #
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param source [Vellum::WorkflowDeployments::ListWorkflowReleaseTagsRequestSource] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedWorkflowReleaseTagReadList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.list_workflow_release_tags(id: "id")
    def list_workflow_release_tags(id:, limit: nil, offset: nil, ordering: nil, source: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset, "ordering": ordering, "source": source }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}/release-tags"
end
        Vellum::PaginatedWorkflowReleaseTagReadList.from_json(json_object: response.body)
      end
    end
# Retrieve a Workflow Release Tag by tag name, associated with a specified
#  Workflow Deployment.
    #
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param name [String] The name of the Release Tag associated with this Workflow Deployment that you'd
#  like to retrieve.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowReleaseTagRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.retrieve_workflow_release_tag(id: "id", name: "name")
    def retrieve_workflow_release_tag(id:, name:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}/release-tags/#{name}"
end
        Vellum::WorkflowReleaseTagRead.from_json(json_object: response.body)
      end
    end
# Updates an existing Release Tag associated with the specified Workflow
#  Deployment.
    #
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param name [String] The name of the Release Tag associated with this Workflow Deployment that you'd
#  like to update.
    # @param history_item_id [String] The ID of the Workflow Deployment History Item to tag
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowReleaseTagRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.update_workflow_release_tag(id: "id", name: "name")
    def update_workflow_release_tag(id:, name:, history_item_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), history_item_id: history_item_id }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}/release-tags/#{name}"
end
        Vellum::WorkflowReleaseTagRead.from_json(json_object: response.body)
      end
    end
# List the Releases of the specified Workflow Deployment for the current
#  Environment.
    #
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedWorkflowDeploymentReleaseList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.list_workflow_deployment_releases(id: "id")
    def list_workflow_deployment_releases(id:, limit: nil, offset: nil, ordering: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset, "ordering": ordering }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}/releases"
end
        Vellum::PaginatedWorkflowDeploymentReleaseList.from_json(json_object: response.body)
      end
    end
# Retrieve a specific Workflow Deployment Release by either its UUID or the name
#  of a Release Tag that points to it.
    #
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param release_id_or_release_tag [String] Either the UUID of Workflow Deployment Release you'd like to retrieve, or the
#  name of a Release Tag that's pointing to the Workflow Deployment Release you'd
#  like to retrieve.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowDeploymentRelease]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_deployments.retrieve_workflow_deployment_release(id: "id", release_id_or_release_tag: "release_id_or_release_tag")
    def retrieve_workflow_deployment_release(id:, release_id_or_release_tag:, request_options: nil)
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
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}/releases/#{release_id_or_release_tag}"
end
        Vellum::WorkflowDeploymentRelease.from_json(json_object: response.body)
      end
    end
  end
end