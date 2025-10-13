# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/workflow_deployment_read"
require_relative "types/list_workflow_sandbox_examples_request_tag"
require_relative "../types/paginated_workflow_sandbox_example_list"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class WorkflowSandboxesClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::WorkflowSandboxesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param id [String] A UUID string identifying this workflow sandbox.
    # @param workflow_deployment_id [String] The Vellum-generated ID of the Workflow Deployment you'd like to update. Cannot
#  specify both this and workflow_deployment_name. Leave null to create a new
#  Workflow Deployment.
    # @param workflow_deployment_name [String] The unique name of the Workflow Deployment you'd like to either create or
#  update. Cannot specify both this and workflow_deployment_id. If provided and
#  matches an existing Workflow Deployment, that Workflow Deployment will be
#  updated. Otherwise, a new Prompt Deployment will be created.
    # @param label [String] In the event that a new Workflow Deployment is created, this will be the label
#  it's given.
    # @param release_tags [Array<String>] Optionally provide the release tags that you'd like to be associated with the
#  latest release of the created/updated Prompt Deployment.
    # @param release_description [String] Optionally provide a description that details what's new in this Release.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowDeploymentRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_sandboxes.deploy_workflow(id: "id")
    def deploy_workflow(id:, workflow_deployment_id: nil, workflow_deployment_name: nil, label: nil, release_tags: nil, release_description: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), workflow_deployment_id: workflow_deployment_id, workflow_deployment_name: workflow_deployment_name, label: label, release_tags: release_tags, release_description: release_description }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-sandboxes/#{id}/deploy"
end
      Vellum::WorkflowDeploymentRead.from_json(json_object: response.body)
    end
# List Workflow Sandbox examples that were previously cloned into the User's
#  Workspace
    #
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param tag [Vellum::WorkflowSandboxes::ListWorkflowSandboxExamplesRequestTag] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedWorkflowSandboxExampleList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_sandboxes.list_workflow_sandbox_examples
    def list_workflow_sandbox_examples(limit: nil, offset: nil, ordering: nil, tag: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset, "ordering": ordering, "tag": tag }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-sandboxes/examples"
end
      Vellum::PaginatedWorkflowSandboxExampleList.from_json(json_object: response.body)
    end
  end
  class AsyncWorkflowSandboxesClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncWorkflowSandboxesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param id [String] A UUID string identifying this workflow sandbox.
    # @param workflow_deployment_id [String] The Vellum-generated ID of the Workflow Deployment you'd like to update. Cannot
#  specify both this and workflow_deployment_name. Leave null to create a new
#  Workflow Deployment.
    # @param workflow_deployment_name [String] The unique name of the Workflow Deployment you'd like to either create or
#  update. Cannot specify both this and workflow_deployment_id. If provided and
#  matches an existing Workflow Deployment, that Workflow Deployment will be
#  updated. Otherwise, a new Prompt Deployment will be created.
    # @param label [String] In the event that a new Workflow Deployment is created, this will be the label
#  it's given.
    # @param release_tags [Array<String>] Optionally provide the release tags that you'd like to be associated with the
#  latest release of the created/updated Prompt Deployment.
    # @param release_description [String] Optionally provide a description that details what's new in this Release.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowDeploymentRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_sandboxes.deploy_workflow(id: "id")
    def deploy_workflow(id:, workflow_deployment_id: nil, workflow_deployment_name: nil, label: nil, release_tags: nil, release_description: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), workflow_deployment_id: workflow_deployment_id, workflow_deployment_name: workflow_deployment_name, label: label, release_tags: release_tags, release_description: release_description }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-sandboxes/#{id}/deploy"
end
        Vellum::WorkflowDeploymentRead.from_json(json_object: response.body)
      end
    end
# List Workflow Sandbox examples that were previously cloned into the User's
#  Workspace
    #
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param tag [Vellum::WorkflowSandboxes::ListWorkflowSandboxExamplesRequestTag] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedWorkflowSandboxExampleList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflow_sandboxes.list_workflow_sandbox_examples
    def list_workflow_sandbox_examples(limit: nil, offset: nil, ordering: nil, tag: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset, "ordering": ordering, "tag": tag }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-sandboxes/examples"
end
        Vellum::PaginatedWorkflowSandboxExampleList.from_json(json_object: response.body)
      end
    end
  end
end