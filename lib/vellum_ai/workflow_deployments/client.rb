# frozen_string_literal: true

require_relative "../../requests"
require_relative "types/workflow_deployments_list_request_status"
require_relative "../types/paginated_slim_workflow_deployment_list"
require "async"

module Vellum
  class WorkflowDeploymentsClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [WorkflowDeploymentsClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param status [WORKFLOW_DEPLOYMENTS_LIST_REQUEST_STATUS] The current status of the workflow deployment
    #   - `ACTIVE` - Active
    #   - `ARCHIVED` - Archived
    # @param request_options [RequestOptions]
    # @return [PaginatedSlimWorkflowDeploymentList]
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
        req.url "#{@request_client.default_environment[:Default]}/v1/workflow-deployments"
      end
      PaginatedSlimWorkflowDeploymentList.from_json(json_object: response.body)
    end
  end

  class AsyncWorkflowDeploymentsClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncWorkflowDeploymentsClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param ordering [String] Which field to use when ordering the results.
    # @param status [WORKFLOW_DEPLOYMENTS_LIST_REQUEST_STATUS] The current status of the workflow deployment
    #   - `ACTIVE` - Active
    #   - `ARCHIVED` - Archived
    # @param request_options [RequestOptions]
    # @return [PaginatedSlimWorkflowDeploymentList]
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
          req.url "#{@request_client.default_environment[:Default]}/v1/workflow-deployments"
        end
        PaginatedSlimWorkflowDeploymentList.from_json(json_object: response.body)
      end
    end
  end
end
