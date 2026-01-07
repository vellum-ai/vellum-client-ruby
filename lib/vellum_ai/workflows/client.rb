# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/workflow_resolved_state"
require_relative "../types/check_workflow_execution_status_response"
require_relative "../types/workflow_push_deployment_config_request"
require_relative "../types/dataset_row_push_request"
require_relative "../types/workflow_push_response"
require_relative "../../core/file_utilities"
require_relative "../types/runner_config_request"
require "json"
require "async"
require "async"
require "async"
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
    # @param release_tag [String] Release tag to use when pulling from deployment (implies deployment-only lookup)
    # @param strict [Boolean] 
    # @param version [String] Semantic version range to validate against the Workflow SDK version (e.g.,
#  '>=1.0.0,<1.2.3')
    # @param request_options [Vellum::RequestOptions] 
    # @yield on_data[chunk, overall_received_bytes, env] Leverage the Faraday on_data callback which
#  will receive tuples of strings, the sum of characters received so far, and the
#  response environment. The latter will allow access to the response status,
#  headers and reason, as well as the request info.
    # @return [Void]
    def pull(id:, exclude_code: nil, exclude_display: nil, include_json: nil, include_sandbox: nil, release_tag: nil, strict: nil, version: nil, request_options: nil, &on_data)
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
  req.options.on_data = on_data
  req.params = { **(request_options&.additional_query_parameters || {}), "exclude_code": exclude_code, "exclude_display": exclude_display, "include_json": include_json, "include_sandbox": include_sandbox, "release_tag": release_tag, "strict": strict, "version": version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/workflows/#{id}/pull"
end
    end
# Retrieve the current state of a workflow execution.
#  **Note:** Uses a base url of `https://predict.vellum.ai`.
    #
    # @param span_id [String] The span ID of the workflow execution to retrieve state for
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowResolvedState]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflows.retrieve_state(span_id: "span_id")
    def retrieve_state(span_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/workflows/#{span_id}/state"
end
      Vellum::WorkflowResolvedState.from_json(json_object: response.body)
    end
# Checks if a workflow execution is currently executing (not fulfilled, not
#  rejected, and has no end time).
#  Uses the ClickHouse Prime summary materialized view.
    #
    # @param execution_id [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::CheckWorkflowExecutionStatusResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflows.workflow_execution_status(execution_id: "execution_id")
    def workflow_execution_status(execution_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/workflows/executions/#{execution_id}/status"
end
      Vellum::CheckWorkflowExecutionStatusResponse.from_json(json_object: response.body)
    end
    # @param exec_config [String] The execution configuration of the workflow. If not provided, it will be derived
#  from the artifact.
    # @param workflow_sandbox_id [String] 
    # @param deployment_config [Hash] Request of type Vellum::WorkflowPushDeploymentConfigRequest, as a Hash
    #   * :label (String) 
    #   * :name (String) 
    #   * :description (String) 
    #   * :release_tags (Array<String>) 
    #   * :release_description (String) 
    # @param artifact [String, IO] 
    # @param dataset [Array<Hash>] List of dataset rows with inputs for scenarios.Request of type Array<Vellum::DatasetRowPushRequest>, as a Hash
    #   * :id (String) 
    #   * :label (String) 
    #   * :inputs (Hash{String => Object}) 
    #   * :mocks (Array<Hash{String => Object}>) 
    #   * :workflow_trigger_id (String) 
    # @param dry_run [Boolean] 
    # @param strict [Boolean] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowPushResponse]
    def push(exec_config: nil, workflow_sandbox_id: nil, deployment_config: nil, artifact: nil, dataset: nil, dry_run: nil, strict: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), exec_config: exec_config, workflow_sandbox_id: workflow_sandbox_id, deployment_config: deployment_config, artifact: unless artifact.nil?
  Vellum::FileUtilities.as_faraday_multipart(file_like: artifact)
end, dataset: dataset, dry_run: dry_run, strict: strict }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflows/push"
end
      Vellum::WorkflowPushResponse.from_json(json_object: response.body)
    end
# Serialize files
    #
    # @param files [Hash{String => Object}] 
    # @param module_ [String] 
    # @param runner_config [Hash] Request of type Vellum::RunnerConfigRequest, as a Hash
    #   * :container_image_name (String) 
    #   * :container_image_tag (String) 
    #   * :codegen_version (String) 
    #   * :sdk_version (String) 
    #   * :is_deployment_inlining_enabled (Boolean) 
    #   * :server_version (String) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Hash{String => Object}]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflows.serialize_workflow_files(files: { "files": {"key":"value"} })
    def serialize_workflow_files(files:, module_: nil, runner_config: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), files: files, module: module_, runner_config: runner_config }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflows/serialize"
end
      parsed_json = JSON.parse(response.body)
      parsed_json
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
    # @param release_tag [String] Release tag to use when pulling from deployment (implies deployment-only lookup)
    # @param strict [Boolean] 
    # @param version [String] Semantic version range to validate against the Workflow SDK version (e.g.,
#  '>=1.0.0,<1.2.3')
    # @param request_options [Vellum::RequestOptions] 
    # @yield on_data[chunk, overall_received_bytes, env] Leverage the Faraday on_data callback which
#  will receive tuples of strings, the sum of characters received so far, and the
#  response environment. The latter will allow access to the response status,
#  headers and reason, as well as the request info.
    # @return [Void]
    def pull(id:, exclude_code: nil, exclude_display: nil, include_json: nil, include_sandbox: nil, release_tag: nil, strict: nil, version: nil, request_options: nil, &on_data)
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
  req.options.on_data = on_data
  req.params = { **(request_options&.additional_query_parameters || {}), "exclude_code": exclude_code, "exclude_display": exclude_display, "include_json": include_json, "include_sandbox": include_sandbox, "release_tag": release_tag, "strict": strict, "version": version }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/workflows/#{id}/pull"
end
      end
    end
# Retrieve the current state of a workflow execution.
#  **Note:** Uses a base url of `https://predict.vellum.ai`.
    #
    # @param span_id [String] The span ID of the workflow execution to retrieve state for
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowResolvedState]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflows.retrieve_state(span_id: "span_id")
    def retrieve_state(span_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/workflows/#{span_id}/state"
end
        Vellum::WorkflowResolvedState.from_json(json_object: response.body)
      end
    end
# Checks if a workflow execution is currently executing (not fulfilled, not
#  rejected, and has no end time).
#  Uses the ClickHouse Prime summary materialized view.
    #
    # @param execution_id [String] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::CheckWorkflowExecutionStatusResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflows.workflow_execution_status(execution_id: "execution_id")
    def workflow_execution_status(execution_id:, request_options: nil)
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
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/workflows/executions/#{execution_id}/status"
end
        Vellum::CheckWorkflowExecutionStatusResponse.from_json(json_object: response.body)
      end
    end
    # @param exec_config [String] The execution configuration of the workflow. If not provided, it will be derived
#  from the artifact.
    # @param workflow_sandbox_id [String] 
    # @param deployment_config [Hash] Request of type Vellum::WorkflowPushDeploymentConfigRequest, as a Hash
    #   * :label (String) 
    #   * :name (String) 
    #   * :description (String) 
    #   * :release_tags (Array<String>) 
    #   * :release_description (String) 
    # @param artifact [String, IO] 
    # @param dataset [Array<Hash>] List of dataset rows with inputs for scenarios.Request of type Array<Vellum::DatasetRowPushRequest>, as a Hash
    #   * :id (String) 
    #   * :label (String) 
    #   * :inputs (Hash{String => Object}) 
    #   * :mocks (Array<Hash{String => Object}>) 
    #   * :workflow_trigger_id (String) 
    # @param dry_run [Boolean] 
    # @param strict [Boolean] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowPushResponse]
    def push(exec_config: nil, workflow_sandbox_id: nil, deployment_config: nil, artifact: nil, dataset: nil, dry_run: nil, strict: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), exec_config: exec_config, workflow_sandbox_id: workflow_sandbox_id, deployment_config: deployment_config, artifact: unless artifact.nil?
  Vellum::FileUtilities.as_faraday_multipart(file_like: artifact)
end, dataset: dataset, dry_run: dry_run, strict: strict }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflows/push"
end
        Vellum::WorkflowPushResponse.from_json(json_object: response.body)
      end
    end
# Serialize files
    #
    # @param files [Hash{String => Object}] 
    # @param module_ [String] 
    # @param runner_config [Hash] Request of type Vellum::RunnerConfigRequest, as a Hash
    #   * :container_image_name (String) 
    #   * :container_image_tag (String) 
    #   * :codegen_version (String) 
    #   * :sdk_version (String) 
    #   * :is_deployment_inlining_enabled (Boolean) 
    #   * :server_version (String) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Hash{String => Object}]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.workflows.serialize_workflow_files(files: { "files": {"key":"value"} })
    def serialize_workflow_files(files:, module_: nil, runner_config: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), files: files, module: module_, runner_config: runner_config }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflows/serialize"
end
        parsed_json = JSON.parse(response.body)
        parsed_json
      end
    end
  end
end