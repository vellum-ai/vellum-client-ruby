# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/register_prompt_prompt_info_request"
require_relative "../types/provider_enum"
require_relative "../types/register_prompt_model_parameters_request"
require_relative "../types/register_prompt_response"
require "async"

module Vellum
  class RegisteredPromptsClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [RegisteredPromptsClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Registers a prompt within Vellum and creates associated Vellum entities. Intended to be used by integration
    # partners, not directly by Vellum users.
    #
    # Under the hood, this endpoint creates a new sandbox, a new model version, and a new deployment.
    #
    # @param label [String] A human-friendly label for corresponding entities created in Vellum.
    # @param name [String] A uniquely-identifying name for corresponding entities created in Vellum.
    # @param prompt [Hash] Information about how to execute the prompt template.Request of type RegisterPromptPromptInfoRequest, as a Hash
    #   * :prompt_block_data (Hash)
    #     * :version (Integer)
    #     * :blocks (Array<PromptTemplateBlockRequest>)
    #   * :input_variables (Array<RegisteredPromptInputVariableRequest>)
    # @param provider [PROVIDER_ENUM] The initial LLM provider to use for this prompt
    #   * `ANTHROPIC` - Anthropic
    #   * `AWS_BEDROCK` - AWS Bedrock
    #   * `AZURE_OPENAI` - Azure OpenAI
    #   * `COHERE` - Cohere
    #   * `GOOGLE` - Google
    #   * `HOSTED` - Hosted
    #   * `MOSAICML` - MosaicML
    #   * `OPENAI` - OpenAI
    #   * `FIREWORKS_AI` - Fireworks AI
    #   * `HUGGINGFACE` - HuggingFace
    #   * `MYSTIC` - Mystic
    #   * `PYQ` - Pyq
    #   * `REPLICATE` - Replicate
    # @param model [String] The initial model to use for this prompt
    # @param parameters [Hash] The initial model parameters to use for  this promptRequest of type RegisterPromptModelParametersRequest, as a Hash
    #   * :temperature (Float)
    #   * :max_tokens (Integer)
    #   * :stop (Array<String>)
    #   * :top_p (Float)
    #   * :top_k (Integer)
    #   * :frequency_penalty (Float)
    #   * :presence_penalty (Float)
    #   * :logit_bias (Hash{String => String})
    #   * :custom_parameters (Hash{String => String})
    # @param meta [Hash{String => String}] Optionally include additional metadata to store along with the prompt.
    # @param request_options [RequestOptions]
    # @return [RegisterPromptResponse]
    def register_prompt(label:, name:, prompt:, model:, parameters:, provider: nil, meta: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          label: label,
          name: name,
          prompt: prompt,
          provider: provider,
          model: model,
          parameters: parameters,
          meta: meta
        }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/registered-prompts/register"
      end
      RegisterPromptResponse.from_json(json_object: response.body)
    end
  end

  class AsyncRegisteredPromptsClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncRegisteredPromptsClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Registers a prompt within Vellum and creates associated Vellum entities. Intended to be used by integration
    # partners, not directly by Vellum users.
    #
    # Under the hood, this endpoint creates a new sandbox, a new model version, and a new deployment.
    #
    # @param label [String] A human-friendly label for corresponding entities created in Vellum.
    # @param name [String] A uniquely-identifying name for corresponding entities created in Vellum.
    # @param prompt [Hash] Information about how to execute the prompt template.Request of type RegisterPromptPromptInfoRequest, as a Hash
    #   * :prompt_block_data (Hash)
    #     * :version (Integer)
    #     * :blocks (Array<PromptTemplateBlockRequest>)
    #   * :input_variables (Array<RegisteredPromptInputVariableRequest>)
    # @param provider [PROVIDER_ENUM] The initial LLM provider to use for this prompt
    #   * `ANTHROPIC` - Anthropic
    #   * `AWS_BEDROCK` - AWS Bedrock
    #   * `AZURE_OPENAI` - Azure OpenAI
    #   * `COHERE` - Cohere
    #   * `GOOGLE` - Google
    #   * `HOSTED` - Hosted
    #   * `MOSAICML` - MosaicML
    #   * `OPENAI` - OpenAI
    #   * `FIREWORKS_AI` - Fireworks AI
    #   * `HUGGINGFACE` - HuggingFace
    #   * `MYSTIC` - Mystic
    #   * `PYQ` - Pyq
    #   * `REPLICATE` - Replicate
    # @param model [String] The initial model to use for this prompt
    # @param parameters [Hash] The initial model parameters to use for  this promptRequest of type RegisterPromptModelParametersRequest, as a Hash
    #   * :temperature (Float)
    #   * :max_tokens (Integer)
    #   * :stop (Array<String>)
    #   * :top_p (Float)
    #   * :top_k (Integer)
    #   * :frequency_penalty (Float)
    #   * :presence_penalty (Float)
    #   * :logit_bias (Hash{String => String})
    #   * :custom_parameters (Hash{String => String})
    # @param meta [Hash{String => String}] Optionally include additional metadata to store along with the prompt.
    # @param request_options [RequestOptions]
    # @return [RegisterPromptResponse]
    def register_prompt(label:, name:, prompt:, model:, parameters:, provider: nil, meta: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            label: label,
            name: name,
            prompt: prompt,
            provider: provider,
            model: model,
            parameters: parameters,
            meta: meta
          }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/registered-prompts/register"
        end
        RegisterPromptResponse.from_json(json_object: response.body)
      end
    end
  end
end
