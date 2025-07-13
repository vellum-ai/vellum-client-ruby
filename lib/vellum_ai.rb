# frozen_string_literal: true
require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "vellum_ai/ad_hoc/client"
require_relative "vellum_ai/container_images/client"
require_relative "vellum_ai/deployments/client"
require_relative "vellum_ai/document_indexes/client"
require_relative "vellum_ai/documents/client"
require_relative "vellum_ai/folder_entities/client"
require_relative "vellum_ai/metric_definitions/client"
require_relative "vellum_ai/ml_models/client"
require_relative "vellum_ai/organizations/client"
require_relative "vellum_ai/prompts/client"
require_relative "vellum_ai/sandboxes/client"
require_relative "vellum_ai/test_suite_runs/client"
require_relative "vellum_ai/test_suites/client"
require_relative "vellum_ai/workflow_deployments/client"
require_relative "vellum_ai/release_reviews/client"
require_relative "vellum_ai/workflow_sandboxes/client"
require_relative "vellum_ai/workflows/client"
require_relative "vellum_ai/workspace_secrets/client"
require_relative "vellum_ai/workspaces/client"
require_relative "vellum_ai/types/method_enum"
require_relative "vellum_ai/types/execute_api_request_body"
require_relative "vellum_ai/types/execute_api_request_bearer_token"
require_relative "vellum_ai/types/execute_api_response"
require_relative "vellum_ai/types/code_execution_runtime"
require_relative "vellum_ai/types/code_executor_input"
require_relative "vellum_ai/types/code_execution_package"
require_relative "vellum_ai/types/vellum_variable_type"
require_relative "vellum_ai/types/code_executor_response"
require_relative "vellum_ai/types/prompt_deployment_input_request"
require_relative "vellum_ai/types/prompt_deployment_expand_meta_request"
require_relative "vellum_ai/types/raw_prompt_execution_overrides_request"
require_relative "vellum_ai/types/execute_prompt_response"
require_relative "vellum_ai/types/workflow_request_input_request"
require_relative "vellum_ai/types/workflow_expand_meta_request"
require_relative "vellum_ai/types/execute_workflow_response"
require_relative "vellum_ai/types/generate_request"
require_relative "vellum_ai/types/generate_options_request"
require_relative "vellum_ai/types/generate_response"
require_relative "vellum_ai/types/search_request_options_request"
require_relative "vellum_ai/types/search_response"
require_relative "vellum_ai/types/submit_completion_actual_request"
require_relative "vellum_ai/types/submit_workflow_execution_actual_request"
require_relative "requests"

module Vellum
  class Client
  # @return [Vellum::AdHocClient] 
    attr_reader :ad_hoc
  # @return [Vellum::ContainerImagesClient] 
    attr_reader :container_images
  # @return [Vellum::DeploymentsClient] 
    attr_reader :deployments
  # @return [Vellum::DocumentIndexesClient] 
    attr_reader :document_indexes
  # @return [Vellum::DocumentsClient] 
    attr_reader :documents
  # @return [Vellum::FolderEntitiesClient] 
    attr_reader :folder_entities
  # @return [Vellum::MetricDefinitionsClient] 
    attr_reader :metric_definitions
  # @return [Vellum::MlModelsClient] 
    attr_reader :ml_models
  # @return [Vellum::OrganizationsClient] 
    attr_reader :organizations
  # @return [Vellum::PromptsClient] 
    attr_reader :prompts
  # @return [Vellum::SandboxesClient] 
    attr_reader :sandboxes
  # @return [Vellum::TestSuiteRunsClient] 
    attr_reader :test_suite_runs
  # @return [Vellum::TestSuitesClient] 
    attr_reader :test_suites
  # @return [Vellum::WorkflowDeploymentsClient] 
    attr_reader :workflow_deployments
  # @return [Vellum::ReleaseReviewsClient] 
    attr_reader :release_reviews
  # @return [Vellum::WorkflowSandboxesClient] 
    attr_reader :workflow_sandboxes
  # @return [Vellum::WorkflowsClient] 
    attr_reader :workflows
  # @return [Vellum::WorkspaceSecretsClient] 
    attr_reader :workspace_secrets
  # @return [Vellum::WorkspacesClient] 
    attr_reader :workspaces


    # @param base_url [String] 
    # @param environment [Vellum::Environment] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @param api_key [String] 
    # @param api_version [String] 
    # @return [Vellum::Client]
    def initialize(base_url: nil, environment: Vellum::Environment::PRODUCTION, max_retries: nil, timeout_in_seconds: nil, api_key:, api_version:)
      @request_client = Vellum::RequestClient.new(
  base_url: base_url,
  environment: environment,
  max_retries: max_retries,
  timeout_in_seconds: timeout_in_seconds,
  api_key: api_key,
  api_version: api_version
)
      @ad_hoc = Vellum::AdHocClient.new(request_client: @request_client)
      @container_images = Vellum::ContainerImagesClient.new(request_client: @request_client)
      @deployments = Vellum::DeploymentsClient.new(request_client: @request_client)
      @document_indexes = Vellum::DocumentIndexesClient.new(request_client: @request_client)
      @documents = Vellum::DocumentsClient.new(request_client: @request_client)
      @folder_entities = Vellum::FolderEntitiesClient.new(request_client: @request_client)
      @metric_definitions = Vellum::MetricDefinitionsClient.new(request_client: @request_client)
      @ml_models = Vellum::MlModelsClient.new(request_client: @request_client)
      @organizations = Vellum::OrganizationsClient.new(request_client: @request_client)
      @prompts = Vellum::PromptsClient.new(request_client: @request_client)
      @sandboxes = Vellum::SandboxesClient.new(request_client: @request_client)
      @test_suite_runs = Vellum::TestSuiteRunsClient.new(request_client: @request_client)
      @test_suites = Vellum::TestSuitesClient.new(request_client: @request_client)
      @workflow_deployments = Vellum::WorkflowDeploymentsClient.new(request_client: @request_client)
      @release_reviews = Vellum::ReleaseReviewsClient.new(request_client: @request_client)
      @workflow_sandboxes = Vellum::WorkflowSandboxesClient.new(request_client: @request_client)
      @workflows = Vellum::WorkflowsClient.new(request_client: @request_client)
      @workspace_secrets = Vellum::WorkspaceSecretsClient.new(request_client: @request_client)
      @workspaces = Vellum::WorkspacesClient.new(request_client: @request_client)
    end
    # @param url [String] 
    # @param method [Vellum::MethodEnum] 
    # @param body [String, Array<Object>, Hash{String => Object}] 
    # @param headers [Hash{String => Vellum::ExecuteApiRequestHeadersValue}] 
    # @param bearer_token [String, Vellum::VellumSecret] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::ExecuteApiResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.execute_api(url: "url")
    def execute_api(url:, method: nil, body: nil, headers: nil, bearer_token: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), url: url, method: method, body: body, headers: headers, bearer_token: bearer_token }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/execute-api"
end
      Vellum::ExecuteApiResponse.from_json(json_object: response.body)
    end
    # @param code [String] 
    # @param runtime [Vellum::CodeExecutionRuntime] 
    # @param input_values [Array<Hash>] Request of type Array<Vellum::CodeExecutorInput>, as a Hash
    # @param packages [Array<Hash>] Request of type Array<Vellum::CodeExecutionPackage>, as a Hash
    #   * :version (String) 
    #   * :name (String) 
    #   * :repository (String) 
    # @param output_type [Vellum::VellumVariableType] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::CodeExecutorResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.execute_code(
#    code: "code",
#    runtime: PYTHON_3_11_6,
#    input_values: [{ name: "name", type: "STRING", value: "value" }],
#    packages: [{ version: "version", name: "name" }],
#    output_type: STRING
#  )
    def execute_code(code:, runtime:, input_values:, packages:, output_type:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), code: code, runtime: runtime, input_values: input_values, packages: packages, output_type: output_type }.compact
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/execute-code"
end
      Vellum::CodeExecutorResponse.from_json(json_object: response.body)
    end
# Executes a deployed Prompt and returns the result.
    #
    # @param inputs [Array<Hash>] A list consisting of the Prompt Deployment's input variables and their values.Request of type Array<Vellum::PromptDeploymentInputRequest>, as a Hash
    # @param prompt_deployment_id [String] The ID of the Prompt Deployment. Must provide either this or
#  prompt_deployment_name.
    # @param prompt_deployment_name [String] The unique name of the Prompt Deployment. Must provide either this or
#  prompt_deployment_id.
    # @param release_tag [String] Optionally specify a release tag if you want to pin to a specific release of the
#  Prompt Deployment
    # @param external_id [String] Optionally include a unique identifier for tracking purposes. Must be unique
#  within a given Workspace.
    # @param expand_meta [Hash] An optionally specified configuration used to opt in to including additional
#  metadata about this prompt execution in the API response. Corresponding values
#  will be returned under the `meta` key of the API response.Request of type Vellum::PromptDeploymentExpandMetaRequest, as a Hash
    #   * :model_name (Boolean) 
    #   * :usage (Boolean) 
    #   * :cost (Boolean) 
    #   * :finish_reason (Boolean) 
    #   * :latency (Boolean) 
    #   * :deployment_release_tag (Boolean) 
    #   * :prompt_version_id (Boolean) 
    # @param raw_overrides [Hash] Overrides for the raw API request sent to the model host. Combined with
#  `expand_raw`, it can be used to access new features from models.Request of type Vellum::RawPromptExecutionOverridesRequest, as a Hash
    #   * :body (Hash{String => Object}) 
    #   * :headers (Hash{String => String}) 
    #   * :url (String) 
    # @param expand_raw [Array<String>] A list of keys whose values you'd like to directly return from the JSON response
#  of the model provider. Useful if you need lower-level info returned by model
#  providers that Vellum would otherwise omit. Corresponding key/value pairs will
#  be returned under the `raw` key of the API response.
    # @param metadata [Hash{String => Object}] Arbitrary JSON metadata associated with this request. Can be used to capture
#  additional monitoring data such as user id, session id, etc. for future
#  analysis.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::FulfilledExecutePromptResponse, Vellum::RejectedExecutePromptResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.execute_prompt(inputs: [{ name: "name", type: "STRING", value: "value" }])
    def execute_prompt(inputs:, prompt_deployment_id: nil, prompt_deployment_name: nil, release_tag: nil, external_id: nil, expand_meta: nil, raw_overrides: nil, expand_raw: nil, metadata: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), inputs: inputs, prompt_deployment_id: prompt_deployment_id, prompt_deployment_name: prompt_deployment_name, release_tag: release_tag, external_id: external_id, expand_meta: expand_meta, raw_overrides: raw_overrides, expand_raw: expand_raw, metadata: metadata }.compact
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/execute-prompt"
end
      Vellum::ExecutePromptResponse.from_json(json_object: response.body)
    end
# Executes a deployed Workflow and returns its outputs.
    #
    # @param inputs [Array<Hash>] The list of inputs defined in the Workflow's Deployment with their corresponding
#  values.Request of type Array<Vellum::WorkflowRequestInputRequest>, as a Hash
    # @param expand_meta [Hash] An optionally specified configuration used to opt in to including additional
#  metadata about this workflow execution in the API response. Corresponding values
#  will be returned under the `execution_meta` key within NODE events in the
#  response stream.Request of type Vellum::WorkflowExpandMetaRequest, as a Hash
    #   * :usage (Boolean) 
    #   * :cost (Boolean) 
    #   * :model_name (Boolean) 
    # @param workflow_deployment_id [String] The ID of the Workflow Deployment. Must provide either this or
#  workflow_deployment_name.
    # @param workflow_deployment_name [String] The name of the Workflow Deployment. Must provide either this or
#  workflow_deployment_id.
    # @param release_tag [String] Optionally specify a release tag if you want to pin to a specific release of the
#  Workflow Deployment
    # @param external_id [String] Optionally include a unique identifier for tracking purposes. Must be unique
#  within a given Workspace.
    # @param metadata [Hash{String => Object}] Arbitrary JSON metadata associated with this request. Can be used to capture
#  additional monitoring data such as user id, session id, etc. for future
#  analysis.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::ExecuteWorkflowResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.execute_workflow(inputs: [{ name: "name", type: "STRING", value: "value" }])
    def execute_workflow(inputs:, expand_meta: nil, workflow_deployment_id: nil, workflow_deployment_name: nil, release_tag: nil, external_id: nil, metadata: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), inputs: inputs, expand_meta: expand_meta, workflow_deployment_id: workflow_deployment_id, workflow_deployment_name: workflow_deployment_name, release_tag: release_tag, external_id: external_id, metadata: metadata }.compact
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/execute-workflow"
end
      Vellum::ExecuteWorkflowResponse.from_json(json_object: response.body)
    end
# Generate a completion using a previously defined deployment.
#  Important: This endpoint is DEPRECATED and has been superseded by
#  [execute-prompt](/api-reference/api-reference/execute-prompt).
    #
    # @param deployment_id [String] The ID of the deployment. Must provide either this or deployment_name.
    # @param deployment_name [String] The name of the deployment. Must provide either this or deployment_id.
    # @param requests [Array<Hash>] The generation request to make. Bulk requests are no longer supported, this
#  field must be an array of length 1.Request of type Array<Vellum::GenerateRequest>, as a Hash
    #   * :input_values (Hash{String => Object}) 
    #   * :chat_history (Array<Vellum::ChatMessageRequest>) 
    #   * :external_ids (Array<String>) 
    # @param options [Hash] Additional configuration that can be used to control what's included in the
#  response.Request of type Vellum::GenerateOptionsRequest, as a Hash
    #   * :logprobs (Vellum::LogprobsEnum) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::GenerateResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.generate(requests: [{ input_values: { "key": "value" } }])
    def generate(deployment_id: nil, deployment_name: nil, requests:, options: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), deployment_id: deployment_id, deployment_name: deployment_name, requests: requests, options: options }.compact
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/generate"
end
      Vellum::GenerateResponse.from_json(json_object: response.body)
    end
# Perform a search against a document index.
    #
    # @param index_id [String] The ID of the index to search against. Must provide either this, index_name or
#  document_index.
    # @param index_name [String] The name of the index to search against. Must provide either this, index_id or
#  document_index.
    # @param query [String] The query to search for.
    # @param options [Hash] Configuration options for the search.Request of type Vellum::SearchRequestOptionsRequest, as a Hash
    #   * :limit (Integer) 
    #   * :weights (Hash)
    #     * :semantic_similarity (Float) 
    #     * :keywords (Float) 
    #   * :result_merging (Hash)
    #     * :enabled (Boolean) 
    #   * :filters (Hash)
    #     * :external_ids (Array<String>) 
    #     * :metadata (Hash)
    # @param document_index [String] Either the index name or index ID to search against. Must provide either this,
#  index_id or index_name.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::SearchResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.search(query: "query")
    def search(index_id: nil, index_name: nil, query:, options: nil, document_index: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), index_id: index_id, index_name: index_name, query: query, options: options, document_index: document_index }.compact
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/search"
end
      Vellum::SearchResponse.from_json(json_object: response.body)
    end
# Used to submit feedback regarding the quality of previously generated
#  completions.
    #
    # @param deployment_id [String] The ID of the deployment. Must provide either this or deployment_name.
    # @param deployment_name [String] The name of the deployment. Must provide either this or deployment_id.
    # @param actuals [Array<Hash>] Feedback regarding the quality of previously generated completionsRequest of type Array<Vellum::SubmitCompletionActualRequest>, as a Hash
    #   * :id (String) 
    #   * :external_id (String) 
    #   * :text (String) 
    #   * :quality (Float) 
    #   * :timestamp (DateTime) 
    #   * :metadata (Hash{String => Object}) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.submit_completion_actuals(actuals: [{  }])
    def submit_completion_actuals(deployment_id: nil, deployment_name: nil, actuals:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), deployment_id: deployment_id, deployment_name: deployment_name, actuals: actuals }.compact
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/submit-completion-actuals"
end
    end
# Used to submit feedback regarding the quality of previous workflow execution
#  and its outputs.
#  **Note:** Uses a base url of `https://predict.vellum.ai`.
    #
    # @param actuals [Array<Hash>] Feedback regarding the quality of an output on a previously executed workflow.Request of type Array<Vellum::SubmitWorkflowExecutionActualRequest>, as a Hash
    # @param execution_id [String] The Vellum-generated ID of a previously executed workflow. Must provide either
#  this or external_id.
    # @param external_id [String] The external ID that was originally provided by when executing the workflow, if
#  applicable, that you'd now like to submit actuals for. Must provide either this
#  or execution_id.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.submit_workflow_execution_actuals(actuals: [{ output_type: "STRING" }])
    def submit_workflow_execution_actuals(actuals:, execution_id: nil, external_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), actuals: actuals, execution_id: execution_id, external_id: external_id }.compact
  req.url "#{@request_client.get_url(environment: Predict, request_options: request_options)}/v1/submit-workflow-execution-actuals"
end
    end
  end
  class AsyncClient
  # @return [Vellum::AsyncAdHocClient] 
    attr_reader :ad_hoc
  # @return [Vellum::AsyncContainerImagesClient] 
    attr_reader :container_images
  # @return [Vellum::AsyncDeploymentsClient] 
    attr_reader :deployments
  # @return [Vellum::AsyncDocumentIndexesClient] 
    attr_reader :document_indexes
  # @return [Vellum::AsyncDocumentsClient] 
    attr_reader :documents
  # @return [Vellum::AsyncFolderEntitiesClient] 
    attr_reader :folder_entities
  # @return [Vellum::AsyncMetricDefinitionsClient] 
    attr_reader :metric_definitions
  # @return [Vellum::AsyncMlModelsClient] 
    attr_reader :ml_models
  # @return [Vellum::AsyncOrganizationsClient] 
    attr_reader :organizations
  # @return [Vellum::AsyncPromptsClient] 
    attr_reader :prompts
  # @return [Vellum::AsyncSandboxesClient] 
    attr_reader :sandboxes
  # @return [Vellum::AsyncTestSuiteRunsClient] 
    attr_reader :test_suite_runs
  # @return [Vellum::AsyncTestSuitesClient] 
    attr_reader :test_suites
  # @return [Vellum::AsyncWorkflowDeploymentsClient] 
    attr_reader :workflow_deployments
  # @return [Vellum::AsyncReleaseReviewsClient] 
    attr_reader :release_reviews
  # @return [Vellum::AsyncWorkflowSandboxesClient] 
    attr_reader :workflow_sandboxes
  # @return [Vellum::AsyncWorkflowsClient] 
    attr_reader :workflows
  # @return [Vellum::AsyncWorkspaceSecretsClient] 
    attr_reader :workspace_secrets
  # @return [Vellum::AsyncWorkspacesClient] 
    attr_reader :workspaces


    # @param base_url [String] 
    # @param environment [Vellum::Environment] 
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long] 
    # @param api_key [String] 
    # @param api_version [String] 
    # @return [Vellum::AsyncClient]
    def initialize(base_url: nil, environment: Vellum::Environment::PRODUCTION, max_retries: nil, timeout_in_seconds: nil, api_key:, api_version:)
      @async_request_client = Vellum::AsyncRequestClient.new(
  base_url: base_url,
  environment: environment,
  max_retries: max_retries,
  timeout_in_seconds: timeout_in_seconds,
  api_key: api_key,
  api_version: api_version
)
      @ad_hoc = Vellum::AsyncAdHocClient.new(request_client: @async_request_client)
      @container_images = Vellum::AsyncContainerImagesClient.new(request_client: @async_request_client)
      @deployments = Vellum::AsyncDeploymentsClient.new(request_client: @async_request_client)
      @document_indexes = Vellum::AsyncDocumentIndexesClient.new(request_client: @async_request_client)
      @documents = Vellum::AsyncDocumentsClient.new(request_client: @async_request_client)
      @folder_entities = Vellum::AsyncFolderEntitiesClient.new(request_client: @async_request_client)
      @metric_definitions = Vellum::AsyncMetricDefinitionsClient.new(request_client: @async_request_client)
      @ml_models = Vellum::AsyncMlModelsClient.new(request_client: @async_request_client)
      @organizations = Vellum::AsyncOrganizationsClient.new(request_client: @async_request_client)
      @prompts = Vellum::AsyncPromptsClient.new(request_client: @async_request_client)
      @sandboxes = Vellum::AsyncSandboxesClient.new(request_client: @async_request_client)
      @test_suite_runs = Vellum::AsyncTestSuiteRunsClient.new(request_client: @async_request_client)
      @test_suites = Vellum::AsyncTestSuitesClient.new(request_client: @async_request_client)
      @workflow_deployments = Vellum::AsyncWorkflowDeploymentsClient.new(request_client: @async_request_client)
      @release_reviews = Vellum::AsyncReleaseReviewsClient.new(request_client: @async_request_client)
      @workflow_sandboxes = Vellum::AsyncWorkflowSandboxesClient.new(request_client: @async_request_client)
      @workflows = Vellum::AsyncWorkflowsClient.new(request_client: @async_request_client)
      @workspace_secrets = Vellum::AsyncWorkspaceSecretsClient.new(request_client: @async_request_client)
      @workspaces = Vellum::AsyncWorkspacesClient.new(request_client: @async_request_client)
    end
    # @param url [String] 
    # @param method [Vellum::MethodEnum] 
    # @param body [String, Array<Object>, Hash{String => Object}] 
    # @param headers [Hash{String => Vellum::ExecuteApiRequestHeadersValue}] 
    # @param bearer_token [String, Vellum::VellumSecret] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::ExecuteApiResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.execute_api(url: "url")
    def execute_api(url:, method: nil, body: nil, headers: nil, bearer_token: nil, request_options: nil)
      response = @async_request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@async_request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), url: url, method: method, body: body, headers: headers, bearer_token: bearer_token }.compact
  req.url "#{@async_request_client.get_url(environment: Default, request_options: request_options)}/v1/execute-api"
end
      Vellum::ExecuteApiResponse.from_json(json_object: response.body)
    end
    # @param code [String] 
    # @param runtime [Vellum::CodeExecutionRuntime] 
    # @param input_values [Array<Hash>] Request of type Array<Vellum::CodeExecutorInput>, as a Hash
    # @param packages [Array<Hash>] Request of type Array<Vellum::CodeExecutionPackage>, as a Hash
    #   * :version (String) 
    #   * :name (String) 
    #   * :repository (String) 
    # @param output_type [Vellum::VellumVariableType] 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::CodeExecutorResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.execute_code(
#    code: "code",
#    runtime: PYTHON_3_11_6,
#    input_values: [{ name: "name", type: "STRING", value: "value" }],
#    packages: [{ version: "version", name: "name" }],
#    output_type: STRING
#  )
    def execute_code(code:, runtime:, input_values:, packages:, output_type:, request_options: nil)
      response = @async_request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@async_request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), code: code, runtime: runtime, input_values: input_values, packages: packages, output_type: output_type }.compact
  req.url "#{@async_request_client.get_url(environment: Predict, request_options: request_options)}/v1/execute-code"
end
      Vellum::CodeExecutorResponse.from_json(json_object: response.body)
    end
# Executes a deployed Prompt and returns the result.
    #
    # @param inputs [Array<Hash>] A list consisting of the Prompt Deployment's input variables and their values.Request of type Array<Vellum::PromptDeploymentInputRequest>, as a Hash
    # @param prompt_deployment_id [String] The ID of the Prompt Deployment. Must provide either this or
#  prompt_deployment_name.
    # @param prompt_deployment_name [String] The unique name of the Prompt Deployment. Must provide either this or
#  prompt_deployment_id.
    # @param release_tag [String] Optionally specify a release tag if you want to pin to a specific release of the
#  Prompt Deployment
    # @param external_id [String] Optionally include a unique identifier for tracking purposes. Must be unique
#  within a given Workspace.
    # @param expand_meta [Hash] An optionally specified configuration used to opt in to including additional
#  metadata about this prompt execution in the API response. Corresponding values
#  will be returned under the `meta` key of the API response.Request of type Vellum::PromptDeploymentExpandMetaRequest, as a Hash
    #   * :model_name (Boolean) 
    #   * :usage (Boolean) 
    #   * :cost (Boolean) 
    #   * :finish_reason (Boolean) 
    #   * :latency (Boolean) 
    #   * :deployment_release_tag (Boolean) 
    #   * :prompt_version_id (Boolean) 
    # @param raw_overrides [Hash] Overrides for the raw API request sent to the model host. Combined with
#  `expand_raw`, it can be used to access new features from models.Request of type Vellum::RawPromptExecutionOverridesRequest, as a Hash
    #   * :body (Hash{String => Object}) 
    #   * :headers (Hash{String => String}) 
    #   * :url (String) 
    # @param expand_raw [Array<String>] A list of keys whose values you'd like to directly return from the JSON response
#  of the model provider. Useful if you need lower-level info returned by model
#  providers that Vellum would otherwise omit. Corresponding key/value pairs will
#  be returned under the `raw` key of the API response.
    # @param metadata [Hash{String => Object}] Arbitrary JSON metadata associated with this request. Can be used to capture
#  additional monitoring data such as user id, session id, etc. for future
#  analysis.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::FulfilledExecutePromptResponse, Vellum::RejectedExecutePromptResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.execute_prompt(inputs: [{ name: "name", type: "STRING", value: "value" }])
    def execute_prompt(inputs:, prompt_deployment_id: nil, prompt_deployment_name: nil, release_tag: nil, external_id: nil, expand_meta: nil, raw_overrides: nil, expand_raw: nil, metadata: nil, request_options: nil)
      response = @async_request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@async_request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), inputs: inputs, prompt_deployment_id: prompt_deployment_id, prompt_deployment_name: prompt_deployment_name, release_tag: release_tag, external_id: external_id, expand_meta: expand_meta, raw_overrides: raw_overrides, expand_raw: expand_raw, metadata: metadata }.compact
  req.url "#{@async_request_client.get_url(environment: Predict, request_options: request_options)}/v1/execute-prompt"
end
      Vellum::ExecutePromptResponse.from_json(json_object: response.body)
    end
# Executes a deployed Workflow and returns its outputs.
    #
    # @param inputs [Array<Hash>] The list of inputs defined in the Workflow's Deployment with their corresponding
#  values.Request of type Array<Vellum::WorkflowRequestInputRequest>, as a Hash
    # @param expand_meta [Hash] An optionally specified configuration used to opt in to including additional
#  metadata about this workflow execution in the API response. Corresponding values
#  will be returned under the `execution_meta` key within NODE events in the
#  response stream.Request of type Vellum::WorkflowExpandMetaRequest, as a Hash
    #   * :usage (Boolean) 
    #   * :cost (Boolean) 
    #   * :model_name (Boolean) 
    # @param workflow_deployment_id [String] The ID of the Workflow Deployment. Must provide either this or
#  workflow_deployment_name.
    # @param workflow_deployment_name [String] The name of the Workflow Deployment. Must provide either this or
#  workflow_deployment_id.
    # @param release_tag [String] Optionally specify a release tag if you want to pin to a specific release of the
#  Workflow Deployment
    # @param external_id [String] Optionally include a unique identifier for tracking purposes. Must be unique
#  within a given Workspace.
    # @param metadata [Hash{String => Object}] Arbitrary JSON metadata associated with this request. Can be used to capture
#  additional monitoring data such as user id, session id, etc. for future
#  analysis.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::ExecuteWorkflowResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.execute_workflow(inputs: [{ name: "name", type: "STRING", value: "value" }])
    def execute_workflow(inputs:, expand_meta: nil, workflow_deployment_id: nil, workflow_deployment_name: nil, release_tag: nil, external_id: nil, metadata: nil, request_options: nil)
      response = @async_request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@async_request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), inputs: inputs, expand_meta: expand_meta, workflow_deployment_id: workflow_deployment_id, workflow_deployment_name: workflow_deployment_name, release_tag: release_tag, external_id: external_id, metadata: metadata }.compact
  req.url "#{@async_request_client.get_url(environment: Predict, request_options: request_options)}/v1/execute-workflow"
end
      Vellum::ExecuteWorkflowResponse.from_json(json_object: response.body)
    end
# Generate a completion using a previously defined deployment.
#  Important: This endpoint is DEPRECATED and has been superseded by
#  [execute-prompt](/api-reference/api-reference/execute-prompt).
    #
    # @param deployment_id [String] The ID of the deployment. Must provide either this or deployment_name.
    # @param deployment_name [String] The name of the deployment. Must provide either this or deployment_id.
    # @param requests [Array<Hash>] The generation request to make. Bulk requests are no longer supported, this
#  field must be an array of length 1.Request of type Array<Vellum::GenerateRequest>, as a Hash
    #   * :input_values (Hash{String => Object}) 
    #   * :chat_history (Array<Vellum::ChatMessageRequest>) 
    #   * :external_ids (Array<String>) 
    # @param options [Hash] Additional configuration that can be used to control what's included in the
#  response.Request of type Vellum::GenerateOptionsRequest, as a Hash
    #   * :logprobs (Vellum::LogprobsEnum) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::GenerateResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.generate(requests: [{ input_values: { "key": "value" } }])
    def generate(deployment_id: nil, deployment_name: nil, requests:, options: nil, request_options: nil)
      response = @async_request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@async_request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), deployment_id: deployment_id, deployment_name: deployment_name, requests: requests, options: options }.compact
  req.url "#{@async_request_client.get_url(environment: Predict, request_options: request_options)}/v1/generate"
end
      Vellum::GenerateResponse.from_json(json_object: response.body)
    end
# Perform a search against a document index.
    #
    # @param index_id [String] The ID of the index to search against. Must provide either this, index_name or
#  document_index.
    # @param index_name [String] The name of the index to search against. Must provide either this, index_id or
#  document_index.
    # @param query [String] The query to search for.
    # @param options [Hash] Configuration options for the search.Request of type Vellum::SearchRequestOptionsRequest, as a Hash
    #   * :limit (Integer) 
    #   * :weights (Hash)
    #     * :semantic_similarity (Float) 
    #     * :keywords (Float) 
    #   * :result_merging (Hash)
    #     * :enabled (Boolean) 
    #   * :filters (Hash)
    #     * :external_ids (Array<String>) 
    #     * :metadata (Hash)
    # @param document_index [String] Either the index name or index ID to search against. Must provide either this,
#  index_id or index_name.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::SearchResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.search(query: "query")
    def search(index_id: nil, index_name: nil, query:, options: nil, document_index: nil, request_options: nil)
      response = @async_request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@async_request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), index_id: index_id, index_name: index_name, query: query, options: options, document_index: document_index }.compact
  req.url "#{@async_request_client.get_url(environment: Predict, request_options: request_options)}/v1/search"
end
      Vellum::SearchResponse.from_json(json_object: response.body)
    end
# Used to submit feedback regarding the quality of previously generated
#  completions.
    #
    # @param deployment_id [String] The ID of the deployment. Must provide either this or deployment_name.
    # @param deployment_name [String] The name of the deployment. Must provide either this or deployment_id.
    # @param actuals [Array<Hash>] Feedback regarding the quality of previously generated completionsRequest of type Array<Vellum::SubmitCompletionActualRequest>, as a Hash
    #   * :id (String) 
    #   * :external_id (String) 
    #   * :text (String) 
    #   * :quality (Float) 
    #   * :timestamp (DateTime) 
    #   * :metadata (Hash{String => Object}) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.submit_completion_actuals(actuals: [{  }])
    def submit_completion_actuals(deployment_id: nil, deployment_name: nil, actuals:, request_options: nil)
      response = @async_request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@async_request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), deployment_id: deployment_id, deployment_name: deployment_name, actuals: actuals }.compact
  req.url "#{@async_request_client.get_url(environment: Predict, request_options: request_options)}/v1/submit-completion-actuals"
end
    end
# Used to submit feedback regarding the quality of previous workflow execution
#  and its outputs.
#  **Note:** Uses a base url of `https://predict.vellum.ai`.
    #
    # @param actuals [Array<Hash>] Feedback regarding the quality of an output on a previously executed workflow.Request of type Array<Vellum::SubmitWorkflowExecutionActualRequest>, as a Hash
    # @param execution_id [String] The Vellum-generated ID of a previously executed workflow. Must provide either
#  this or external_id.
    # @param external_id [String] The external ID that was originally provided by when executing the workflow, if
#  applicable, that you'd now like to submit actuals for. Must provide either this
#  or execution_id.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY",
#    api_version: "ApiVersion"
#  )
#  api.submit_workflow_execution_actuals(actuals: [{ output_type: "STRING" }])
    def submit_workflow_execution_actuals(actuals:, execution_id: nil, external_id: nil, request_options: nil)
      response = @async_request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  unless request_options&.api_version.nil?
    req.headers["X-API-Version"] = request_options.api_version
  end
  req.headers = { **(req.headers || {}), **@async_request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request_options&.additional_body_parameters || {}), actuals: actuals, execution_id: execution_id, external_id: external_id }.compact
  req.url "#{@async_request_client.get_url(environment: Predict, request_options: request_options)}/v1/submit-workflow-execution-actuals"
end
    end
  end
end