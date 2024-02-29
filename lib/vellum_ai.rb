# frozen_string_literal: true

require_relative "environment"
require_relative "types_export"
require_relative "requests"
require_relative "vellum_ai/deployments/client"
require_relative "vellum_ai/document_indexes/client"
require_relative "vellum_ai/documents/client"
require_relative "vellum_ai/folder_entities/client"
require_relative "vellum_ai/model_versions/client"
require_relative "vellum_ai/registered_prompts/client"
require_relative "vellum_ai/sandboxes/client"
require_relative "vellum_ai/test_suites/client"
require_relative "vellum_ai/workflow_deployments/client"
require_relative "vellum_ai/types/prompt_deployment_input_request"
require_relative "vellum_ai/types/prompt_deployment_expand_meta_request_request"
require_relative "vellum_ai/types/raw_prompt_execution_overrides_request"
require_relative "vellum_ai/types/execute_prompt_response"
require_relative "vellum_ai/types/workflow_request_input_request"
require_relative "vellum_ai/types/execute_workflow_response"
require_relative "vellum_ai/types/generate_request"
require_relative "vellum_ai/types/generate_options_request"
require_relative "vellum_ai/types/generate_response"
require_relative "vellum_ai/types/search_request_options_request"
require_relative "vellum_ai/types/search_response"
require_relative "vellum_ai/types/submit_completion_actual_request"
require_relative "vellum_ai/types/submit_workflow_execution_actual_request"

module Vellum
  class Client
    attr_reader :deployments, :document_indexes, :documents, :folder_entities, :model_versions, :registered_prompts,
                :sandboxes, :test_suites, :workflow_deployments

    # @param environment [Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [Client]
    def initialize(api_key:, environment: Environment::PRODUCTION, max_retries: nil, timeout_in_seconds: nil)
      @request_client = RequestClient.new(environment: environment, max_retries: max_retries,
                                          timeout_in_seconds: timeout_in_seconds, api_key: api_key)
      @deployments = DeploymentsClient.new(request_client: @request_client)
      @document_indexes = DocumentIndexesClient.new(request_client: @request_client)
      @documents = DocumentsClient.new(request_client: @request_client)
      @folder_entities = FolderEntitiesClient.new(request_client: @request_client)
      @model_versions = ModelVersionsClient.new(request_client: @request_client)
      @registered_prompts = RegisteredPromptsClient.new(request_client: @request_client)
      @sandboxes = SandboxesClient.new(request_client: @request_client)
      @test_suites = TestSuitesClient.new(request_client: @request_client)
      @workflow_deployments = WorkflowDeploymentsClient.new(request_client: @request_client)
    end

    # Executes a deployed Prompt and returns the result.
    #
    # @param inputs [Array<Hash>] The list of inputs defined in the Prompt's deployment with their corresponding values.Request of type Array<PromptDeploymentInputRequest>, as a Hash
    # @param prompt_deployment_id [String] The ID of the Prompt Deployment. Must provide either this or prompt_deployment_name.
    # @param prompt_deployment_name [String] The name of the Prompt Deployment. Must provide either this or prompt_deployment_id.
    # @param release_tag [String] Optionally specify a release tag if you want to pin to a specific release of the Prompt Deployment
    # @param external_id [String]
    # @param expand_meta [Hash] The name of the Prompt Deployment. Must provide either this or prompt_deployment_id.Request of type PromptDeploymentExpandMetaRequestRequest, as a Hash
    #   * :model_name (Boolean)
    #   * :latency (Boolean)
    #   * :deployment_release_tag (Boolean)
    #   * :prompt_version_id (Boolean)
    #   * :finish_reason (Boolean)
    # @param raw_overrides [Hash] Request of type RawPromptExecutionOverridesRequest, as a Hash
    #   * :body (Hash{String => String})
    #   * :headers (Hash{String => String})
    #   * :url (String)
    # @param expand_raw [Array<String>] Returns the raw API response data sent from the model host. Combined with `raw_overrides`, it can be used to access new features from models.
    # @param metadata [Hash{String => String}]
    # @param request_options [RequestOptions]
    # @return [ExecutePromptResponse]
    def execute_prompt(inputs:, prompt_deployment_id: nil, prompt_deployment_name: nil, release_tag: nil,
                       external_id: nil, expand_meta: nil, raw_overrides: nil, expand_raw: nil, metadata: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          inputs: inputs,
          prompt_deployment_id: prompt_deployment_id,
          prompt_deployment_name: prompt_deployment_name,
          release_tag: release_tag,
          external_id: external_id,
          expand_meta: expand_meta,
          raw_overrides: raw_overrides,
          expand_raw: expand_raw,
          metadata: metadata
        }.compact
        req.url "#{@request_client.default_environment[:Predict]}/v1/execute-prompt"
      end
      ExecutePromptResponse.from_json(json_object: response.body)
    end

    # Executes a deployed Workflow and returns its outputs.
    #
    # @param workflow_deployment_id [String] The ID of the Workflow Deployment. Must provide either this or workflow_deployment_name.
    # @param workflow_deployment_name [String] The name of the Workflow Deployment. Must provide either this or workflow_deployment_id.
    # @param release_tag [String] Optionally specify a release tag if you want to pin to a specific release of the Workflow Deployment
    # @param inputs [Array<Hash>] The list of inputs defined in the Workflow's Deployment with their corresponding values.Request of type Array<WorkflowRequestInputRequest>, as a Hash
    # @param external_id [String] Optionally include a unique identifier for monitoring purposes.
    # @param request_options [RequestOptions]
    # @return [ExecuteWorkflowResponse]
    def execute_workflow(inputs:, workflow_deployment_id: nil, workflow_deployment_name: nil, release_tag: nil,
                         external_id: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          workflow_deployment_id: workflow_deployment_id,
          workflow_deployment_name: workflow_deployment_name,
          release_tag: release_tag,
          inputs: inputs,
          external_id: external_id
        }.compact
        req.url "#{@request_client.default_environment[:Predict]}/v1/execute-workflow"
      end
      ExecuteWorkflowResponse.from_json(json_object: response.body)
    end

    # Generate a completion using a previously defined deployment.
    #
    # **Note:** Uses a base url of `https://predict.vellum.ai`.
    #
    # @param deployment_id [String] The ID of the deployment. Must provide either this or deployment_name.
    # @param deployment_name [String] The name of the deployment. Must provide either this or deployment_id.
    # @param requests [Array<Hash>] The generation request to make. Bulk requests are no longer supported, this field must be an array of length 1.Request of type Array<GenerateRequest>, as a Hash
    #   * :input_values (Hash{String => String})
    #   * :chat_history (Array<ChatMessageRequest>)
    #   * :external_ids (Array<String>)
    # @param options [Hash] Additional configuration that can be used to control what's included in the response.Request of type GenerateOptionsRequest, as a Hash
    #   * :logprobs (LOGPROBS_ENUM)
    # @param request_options [RequestOptions]
    # @return [GenerateResponse]
    def generate(requests:, deployment_id: nil, deployment_name: nil, options: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          deployment_id: deployment_id,
          deployment_name: deployment_name,
          requests: requests,
          options: options
        }.compact
        req.url "#{@request_client.default_environment[:Predict]}/v1/generate"
      end
      GenerateResponse.from_json(json_object: response.body)
    end

    # Perform a search against a document index.
    #
    # **Note:** Uses a base url of `https://predict.vellum.ai`.
    #
    # @param index_id [String] The ID of the index to search against. Must provide either this or index_name.
    # @param index_name [String] The name of the index to search against. Must provide either this or index_id.
    # @param query [String] The query to search for.
    # @param options [Hash] Configuration options for the search.Request of type SearchRequestOptionsRequest, as a Hash
    #   * :limit (Integer)
    #   * :weights (Hash)
    #     * :semantic_similarity (Float)
    #     * :keywords (Float)
    #   * :result_merging (Hash)
    #     * :enabled (Boolean)
    #   * :filters (Hash)
    #     * :external_ids (Array<String>)
    #     * :metadata (Hash)
    #       * :combinator (METADATA_FILTER_RULE_COMBINATOR)
    #       * :negated (Boolean)
    #       * :rules (Array<MetadataFilterRuleRequest>)
    #       * :field (String)
    #       * :operator (LOGICAL_OPERATOR)
    #       * :value (String)
    # @param request_options [RequestOptions]
    # @return [SearchResponse]
    def search(query:, index_id: nil, index_name: nil, options: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          index_id: index_id,
          index_name: index_name,
          query: query,
          options: options
        }.compact
        req.url "#{@request_client.default_environment[:Predict]}/v1/search"
      end
      SearchResponse.from_json(json_object: response.body)
    end

    # Used to submit feedback regarding the quality of previously generated completions.
    #
    # **Note:** Uses a base url of `https://predict.vellum.ai`.
    #
    # @param deployment_id [String] The ID of the deployment. Must provide either this or deployment_name.
    # @param deployment_name [String] The name of the deployment. Must provide either this or deployment_id.
    # @param actuals [Array<Hash>] Feedback regarding the quality of previously generated completionsRequest of type Array<SubmitCompletionActualRequest>, as a Hash
    #   * :id (String)
    #   * :external_id (String)
    #   * :text (String)
    #   * :quality (Float)
    #   * :timestamp (DateTime)
    # @param request_options [RequestOptions]
    # @return [Void]
    def submit_completion_actuals(actuals:, deployment_id: nil, deployment_name: nil, request_options: nil)
      @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          deployment_id: deployment_id,
          deployment_name: deployment_name,
          actuals: actuals
        }.compact
        req.url "#{@request_client.default_environment[:Predict]}/v1/submit-completion-actuals"
      end
    end

    #     Used to submit feedback regarding the quality of previous workflow execution and its outputs.
    #
    #     **Note:** Uses a base url of `https://predict.vellum.ai`.
    #
    # @param actuals [Array<Hash>] Feedback regarding the quality of an output on a previously executed workflow.Request of type Array<SubmitWorkflowExecutionActualRequest>, as a Hash
    # @param execution_id [String] The Vellum-generated ID of a previously executed workflow. Must provide either this or external_id.
    # @param external_id [String] The external ID that was originally provided by when executing the workflow, if applicable, that you'd now like to submit actuals for. Must provide either this or execution_id.
    # @param request_options [RequestOptions]
    # @return [Void]
    def submit_workflow_execution_actuals(actuals:, execution_id: nil, external_id: nil, request_options: nil)
      @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          actuals: actuals,
          execution_id: execution_id,
          external_id: external_id
        }.compact
        req.url "#{@request_client.default_environment[:Predict]}/v1/submit-workflow-execution-actuals"
      end
    end
  end

  class AsyncClient
    attr_reader :deployments, :document_indexes, :documents, :folder_entities, :model_versions, :registered_prompts,
                :sandboxes, :test_suites, :workflow_deployments

    # @param environment [Environment]
    # @param max_retries [Long] The number of times to retry a failed request, defaults to 2.
    # @param timeout_in_seconds [Long]
    # @param api_key [String]
    # @return [AsyncClient]
    def initialize(api_key:, environment: Environment::PRODUCTION, max_retries: nil, timeout_in_seconds: nil)
      @async_request_client = AsyncRequestClient.new(environment: environment, max_retries: max_retries,
                                                     timeout_in_seconds: timeout_in_seconds, api_key: api_key)
      @deployments = AsyncDeploymentsClient.new(request_client: @async_request_client)
      @document_indexes = AsyncDocumentIndexesClient.new(request_client: @async_request_client)
      @documents = AsyncDocumentsClient.new(request_client: @async_request_client)
      @folder_entities = AsyncFolderEntitiesClient.new(request_client: @async_request_client)
      @model_versions = AsyncModelVersionsClient.new(request_client: @async_request_client)
      @registered_prompts = AsyncRegisteredPromptsClient.new(request_client: @async_request_client)
      @sandboxes = AsyncSandboxesClient.new(request_client: @async_request_client)
      @test_suites = AsyncTestSuitesClient.new(request_client: @async_request_client)
      @workflow_deployments = AsyncWorkflowDeploymentsClient.new(request_client: @async_request_client)
    end

    # Executes a deployed Prompt and returns the result.
    #
    # @param inputs [Array<Hash>] The list of inputs defined in the Prompt's deployment with their corresponding values.Request of type Array<PromptDeploymentInputRequest>, as a Hash
    # @param prompt_deployment_id [String] The ID of the Prompt Deployment. Must provide either this or prompt_deployment_name.
    # @param prompt_deployment_name [String] The name of the Prompt Deployment. Must provide either this or prompt_deployment_id.
    # @param release_tag [String] Optionally specify a release tag if you want to pin to a specific release of the Prompt Deployment
    # @param external_id [String]
    # @param expand_meta [Hash] The name of the Prompt Deployment. Must provide either this or prompt_deployment_id.Request of type PromptDeploymentExpandMetaRequestRequest, as a Hash
    #   * :model_name (Boolean)
    #   * :latency (Boolean)
    #   * :deployment_release_tag (Boolean)
    #   * :prompt_version_id (Boolean)
    #   * :finish_reason (Boolean)
    # @param raw_overrides [Hash] Request of type RawPromptExecutionOverridesRequest, as a Hash
    #   * :body (Hash{String => String})
    #   * :headers (Hash{String => String})
    #   * :url (String)
    # @param expand_raw [Array<String>] Returns the raw API response data sent from the model host. Combined with `raw_overrides`, it can be used to access new features from models.
    # @param metadata [Hash{String => String}]
    # @param request_options [RequestOptions]
    # @return [ExecutePromptResponse]
    def execute_prompt(inputs:, prompt_deployment_id: nil, prompt_deployment_name: nil, release_tag: nil,
                       external_id: nil, expand_meta: nil, raw_overrides: nil, expand_raw: nil, metadata: nil, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          inputs: inputs,
          prompt_deployment_id: prompt_deployment_id,
          prompt_deployment_name: prompt_deployment_name,
          release_tag: release_tag,
          external_id: external_id,
          expand_meta: expand_meta,
          raw_overrides: raw_overrides,
          expand_raw: expand_raw,
          metadata: metadata
        }.compact
        req.url "#{@async_request_client.default_environment[:Predict]}/v1/execute-prompt"
      end
      ExecutePromptResponse.from_json(json_object: response.body)
    end

    # Executes a deployed Workflow and returns its outputs.
    #
    # @param workflow_deployment_id [String] The ID of the Workflow Deployment. Must provide either this or workflow_deployment_name.
    # @param workflow_deployment_name [String] The name of the Workflow Deployment. Must provide either this or workflow_deployment_id.
    # @param release_tag [String] Optionally specify a release tag if you want to pin to a specific release of the Workflow Deployment
    # @param inputs [Array<Hash>] The list of inputs defined in the Workflow's Deployment with their corresponding values.Request of type Array<WorkflowRequestInputRequest>, as a Hash
    # @param external_id [String] Optionally include a unique identifier for monitoring purposes.
    # @param request_options [RequestOptions]
    # @return [ExecuteWorkflowResponse]
    def execute_workflow(inputs:, workflow_deployment_id: nil, workflow_deployment_name: nil, release_tag: nil,
                         external_id: nil, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          workflow_deployment_id: workflow_deployment_id,
          workflow_deployment_name: workflow_deployment_name,
          release_tag: release_tag,
          inputs: inputs,
          external_id: external_id
        }.compact
        req.url "#{@async_request_client.default_environment[:Predict]}/v1/execute-workflow"
      end
      ExecuteWorkflowResponse.from_json(json_object: response.body)
    end

    # Generate a completion using a previously defined deployment.
    #
    # **Note:** Uses a base url of `https://predict.vellum.ai`.
    #
    # @param deployment_id [String] The ID of the deployment. Must provide either this or deployment_name.
    # @param deployment_name [String] The name of the deployment. Must provide either this or deployment_id.
    # @param requests [Array<Hash>] The generation request to make. Bulk requests are no longer supported, this field must be an array of length 1.Request of type Array<GenerateRequest>, as a Hash
    #   * :input_values (Hash{String => String})
    #   * :chat_history (Array<ChatMessageRequest>)
    #   * :external_ids (Array<String>)
    # @param options [Hash] Additional configuration that can be used to control what's included in the response.Request of type GenerateOptionsRequest, as a Hash
    #   * :logprobs (LOGPROBS_ENUM)
    # @param request_options [RequestOptions]
    # @return [GenerateResponse]
    def generate(requests:, deployment_id: nil, deployment_name: nil, options: nil, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          deployment_id: deployment_id,
          deployment_name: deployment_name,
          requests: requests,
          options: options
        }.compact
        req.url "#{@async_request_client.default_environment[:Predict]}/v1/generate"
      end
      GenerateResponse.from_json(json_object: response.body)
    end

    # Perform a search against a document index.
    #
    # **Note:** Uses a base url of `https://predict.vellum.ai`.
    #
    # @param index_id [String] The ID of the index to search against. Must provide either this or index_name.
    # @param index_name [String] The name of the index to search against. Must provide either this or index_id.
    # @param query [String] The query to search for.
    # @param options [Hash] Configuration options for the search.Request of type SearchRequestOptionsRequest, as a Hash
    #   * :limit (Integer)
    #   * :weights (Hash)
    #     * :semantic_similarity (Float)
    #     * :keywords (Float)
    #   * :result_merging (Hash)
    #     * :enabled (Boolean)
    #   * :filters (Hash)
    #     * :external_ids (Array<String>)
    #     * :metadata (Hash)
    #       * :combinator (METADATA_FILTER_RULE_COMBINATOR)
    #       * :negated (Boolean)
    #       * :rules (Array<MetadataFilterRuleRequest>)
    #       * :field (String)
    #       * :operator (LOGICAL_OPERATOR)
    #       * :value (String)
    # @param request_options [RequestOptions]
    # @return [SearchResponse]
    def search(query:, index_id: nil, index_name: nil, options: nil, request_options: nil)
      response = @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          index_id: index_id,
          index_name: index_name,
          query: query,
          options: options
        }.compact
        req.url "#{@async_request_client.default_environment[:Predict]}/v1/search"
      end
      SearchResponse.from_json(json_object: response.body)
    end

    # Used to submit feedback regarding the quality of previously generated completions.
    #
    # **Note:** Uses a base url of `https://predict.vellum.ai`.
    #
    # @param deployment_id [String] The ID of the deployment. Must provide either this or deployment_name.
    # @param deployment_name [String] The name of the deployment. Must provide either this or deployment_id.
    # @param actuals [Array<Hash>] Feedback regarding the quality of previously generated completionsRequest of type Array<SubmitCompletionActualRequest>, as a Hash
    #   * :id (String)
    #   * :external_id (String)
    #   * :text (String)
    #   * :quality (Float)
    #   * :timestamp (DateTime)
    # @param request_options [RequestOptions]
    # @return [Void]
    def submit_completion_actuals(actuals:, deployment_id: nil, deployment_name: nil, request_options: nil)
      @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          deployment_id: deployment_id,
          deployment_name: deployment_name,
          actuals: actuals
        }.compact
        req.url "#{@async_request_client.default_environment[:Predict]}/v1/submit-completion-actuals"
      end
    end

    #     Used to submit feedback regarding the quality of previous workflow execution and its outputs.
    #
    #     **Note:** Uses a base url of `https://predict.vellum.ai`.
    #
    # @param actuals [Array<Hash>] Feedback regarding the quality of an output on a previously executed workflow.Request of type Array<SubmitWorkflowExecutionActualRequest>, as a Hash
    # @param execution_id [String] The Vellum-generated ID of a previously executed workflow. Must provide either this or external_id.
    # @param external_id [String] The external ID that was originally provided by when executing the workflow, if applicable, that you'd now like to submit actuals for. Must provide either this or execution_id.
    # @param request_options [RequestOptions]
    # @return [Void]
    def submit_workflow_execution_actuals(actuals:, execution_id: nil, external_id: nil, request_options: nil)
      @async_request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          actuals: actuals,
          execution_id: execution_id,
          external_id: external_id
        }.compact
        req.url "#{@async_request_client.default_environment[:Predict]}/v1/submit-workflow-execution-actuals"
      end
    end
  end
end
