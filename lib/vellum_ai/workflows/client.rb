# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/workflow_push_deployment_config_request"
require_relative "../types/workflow_push_response"
require_relative "../../core/file_utilities"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class WorkflowsClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::WorkflowsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param id [String] The ID of the Workflow to pull from
    # @param exclude_code [Boolean] 
    # @param exclude_display [Boolean] 
    # @param include_json [Boolean] 
    # @param include_sandbox [Boolean] 
    # @param strict [Boolean] 
    # @param request_options [Vellum::RequestOptions] 
    # @yield on_data[chunk, overall_received_bytes, env] Leverage the Faraday on_data callback which
#  will receive tuples of strings, the sum of characters received so far, and the
#  response environment. The latter will allow access to the response status,
#  headers and reason, as well as the request info.
    # @return [Void]
    def pull(id:, exclude_code: nil, exclude_display: nil, include_json: nil, include_sandbox: nil, strict: nil, request_options: nil, &on_data)
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
  req.options.on_data = on_data
  req.params = { **(request_options&.additional_query_parameters || {}), "exclude_code": exclude_code, "exclude_display": exclude_display, "include_json": include_json, "include_sandbox": include_sandbox, "strict": strict }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflows/#{id}/pull"
end
    end
    # @param exec_config [String] The execution configuration of the workflow.
    # @param workflow_sandbox_id [String] 
    # @param deployment_config [Hash] Request of type Vellum::WorkflowPushDeploymentConfigRequest, as a Hash
    #   * :label (String) 
    #   * :name (String) 
    #   * :description (String) 
    #   * :release_tags (Array<String>) 
    # @param artifact [String, IO] 
    # @param dry_run [Boolean] 
    # @param strict [Boolean] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowPushResponse]
    def push(exec_config:, workflow_sandbox_id: nil, deployment_config: nil, artifact: nil, dry_run: nil, strict: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), exec_config: exec_config, workflow_sandbox_id: workflow_sandbox_id, deployment_config: deployment_config, artifact: unless artifact.nil?
  Vellum::FileUtilities.as_faraday_multipart(file_like: artifact)
end, dry_run: dry_run, strict: strict }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflows/push"
end
      Vellum::WorkflowPushResponse.from_json(json_object: response.body)
    end
  end
  class AsyncWorkflowsClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncWorkflowsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param id [String] The ID of the Workflow to pull from
    # @param exclude_code [Boolean] 
    # @param exclude_display [Boolean] 
    # @param include_json [Boolean] 
    # @param include_sandbox [Boolean] 
    # @param strict [Boolean] 
    # @param request_options [Vellum::RequestOptions] 
    # @yield on_data[chunk, overall_received_bytes, env] Leverage the Faraday on_data callback which
#  will receive tuples of strings, the sum of characters received so far, and the
#  response environment. The latter will allow access to the response status,
#  headers and reason, as well as the request info.
    # @return [Void]
    def pull(id:, exclude_code: nil, exclude_display: nil, include_json: nil, include_sandbox: nil, strict: nil, request_options: nil, &on_data)
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
  req.options.on_data = on_data
  req.params = { **(request_options&.additional_query_parameters || {}), "exclude_code": exclude_code, "exclude_display": exclude_display, "include_json": include_json, "include_sandbox": include_sandbox, "strict": strict }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflows/#{id}/pull"
end
      end
    end
    # @param exec_config [String] The execution configuration of the workflow.
    # @param workflow_sandbox_id [String] 
    # @param deployment_config [Hash] Request of type Vellum::WorkflowPushDeploymentConfigRequest, as a Hash
    #   * :label (String) 
    #   * :name (String) 
    #   * :description (String) 
    #   * :release_tags (Array<String>) 
    # @param artifact [String, IO] 
    # @param dry_run [Boolean] 
    # @param strict [Boolean] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowPushResponse]
    def push(exec_config:, workflow_sandbox_id: nil, deployment_config: nil, artifact: nil, dry_run: nil, strict: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), exec_config: exec_config, workflow_sandbox_id: workflow_sandbox_id, deployment_config: deployment_config, artifact: unless artifact.nil?
  Vellum::FileUtilities.as_faraday_multipart(file_like: artifact)
end, dry_run: dry_run, strict: strict }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflows/push"
end
        Vellum::WorkflowPushResponse.from_json(json_object: response.body)
      end
    end
  end
end