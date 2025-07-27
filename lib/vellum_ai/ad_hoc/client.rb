# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/prompt_request_input"
require_relative "../types/vellum_variable"
require_relative "../types/prompt_parameters"
require_relative "../types/prompt_settings"
require_relative "../types/prompt_block"
require_relative "../types/function_definition"
require_relative "../types/ad_hoc_expand_meta"
require_relative "../types/ad_hoc_execute_prompt_event"
require "async"
require_relative "../../requests"

module Vellum
  class AdHocClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AdHocClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param ml_model [String] 
    # @param input_values [Array<Hash>] Request of type Array<Vellum::PromptRequestInput>, as a Hash
    # @param input_variables [Array<Hash>] Request of type Array<Vellum::VellumVariable>, as a Hash
    #   * :id (String) 
    #   * :key (String) 
    #   * :type (Vellum::VellumVariableType) 
    #   * :required (Boolean) 
    #   * :default (Hash)
    #   * :extensions (Hash)
    #     * :color (String) 
    # @param parameters [Hash] Request of type Vellum::PromptParameters, as a Hash
    #   * :stop (Array<String>) 
    #   * :temperature (Float) 
    #   * :max_tokens (Integer) 
    #   * :top_p (Float) 
    #   * :top_k (Integer) 
    #   * :frequency_penalty (Float) 
    #   * :presence_penalty (Float) 
    #   * :logit_bias (Hash{String => Float}) 
    #   * :custom_parameters (Hash{String => Object}) 
    # @param settings [Hash] Request of type Vellum::PromptSettings, as a Hash
    #   * :timeout (Float) 
    #   * :stream_enabled (Boolean) 
    # @param blocks [Array<Hash>] Request of type Array<Vellum::PromptBlock>, as a Hash
    # @param functions [Array<Hash>] Request of type Array<Vellum::FunctionDefinition>, as a Hash
    #   * :state (Vellum::PromptBlockState) 
    #   * :cache_config (Hash)
    #     * :type (Vellum::EPHEMERAL_PROMPT_CACHE_CONFIG_TYPE_ENUM) 
    #   * :name (String) 
    #   * :description (String) 
    #   * :parameters (Hash{String => Object}) 
    #   * :forced (Boolean) 
    #   * :strict (Boolean) 
    # @param expand_meta [Hash] Request of type Vellum::AdHocExpandMeta, as a Hash
    #   * :cost (Boolean) 
    #   * :model_name (Boolean) 
    #   * :usage (Boolean) 
    #   * :finish_reason (Boolean) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::InitiatedAdHocExecutePromptEvent, Vellum::StreamingAdHocExecutePromptEvent, Vellum::FulfilledAdHocExecutePromptEvent, Vellum::RejectedAdHocExecutePromptEvent]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.ad_hoc.adhoc_execute_prompt(
#    ml_model: "x",
#    input_values: [{ key: "x", type: "STRING", value: "value" }, { key: "x", type: "STRING", value: "value" }],
#    input_variables: [{ id: "x", key: "key", type: STRING }, { id: "x", key: "key", type: STRING }],
#    parameters: {  },
#    blocks: [{ block_type: "JINJA", template: "template" }, { block_type: "JINJA", template: "template" }]
#  )
    def adhoc_execute_prompt(ml_model:, input_values:, input_variables:, parameters:, settings: nil, blocks:, functions: nil, expand_meta: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), ml_model: ml_model, input_values: input_values, input_variables: input_variables, parameters: parameters, settings: settings, blocks: blocks, functions: functions, expand_meta: expand_meta }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/ad-hoc/execute-prompt"
end
      Vellum::AdHocExecutePromptEvent.from_json(json_object: response.body)
    end
  end
  class AsyncAdHocClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncAdHocClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param ml_model [String] 
    # @param input_values [Array<Hash>] Request of type Array<Vellum::PromptRequestInput>, as a Hash
    # @param input_variables [Array<Hash>] Request of type Array<Vellum::VellumVariable>, as a Hash
    #   * :id (String) 
    #   * :key (String) 
    #   * :type (Vellum::VellumVariableType) 
    #   * :required (Boolean) 
    #   * :default (Hash)
    #   * :extensions (Hash)
    #     * :color (String) 
    # @param parameters [Hash] Request of type Vellum::PromptParameters, as a Hash
    #   * :stop (Array<String>) 
    #   * :temperature (Float) 
    #   * :max_tokens (Integer) 
    #   * :top_p (Float) 
    #   * :top_k (Integer) 
    #   * :frequency_penalty (Float) 
    #   * :presence_penalty (Float) 
    #   * :logit_bias (Hash{String => Float}) 
    #   * :custom_parameters (Hash{String => Object}) 
    # @param settings [Hash] Request of type Vellum::PromptSettings, as a Hash
    #   * :timeout (Float) 
    #   * :stream_enabled (Boolean) 
    # @param blocks [Array<Hash>] Request of type Array<Vellum::PromptBlock>, as a Hash
    # @param functions [Array<Hash>] Request of type Array<Vellum::FunctionDefinition>, as a Hash
    #   * :state (Vellum::PromptBlockState) 
    #   * :cache_config (Hash)
    #     * :type (Vellum::EPHEMERAL_PROMPT_CACHE_CONFIG_TYPE_ENUM) 
    #   * :name (String) 
    #   * :description (String) 
    #   * :parameters (Hash{String => Object}) 
    #   * :forced (Boolean) 
    #   * :strict (Boolean) 
    # @param expand_meta [Hash] Request of type Vellum::AdHocExpandMeta, as a Hash
    #   * :cost (Boolean) 
    #   * :model_name (Boolean) 
    #   * :usage (Boolean) 
    #   * :finish_reason (Boolean) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::InitiatedAdHocExecutePromptEvent, Vellum::StreamingAdHocExecutePromptEvent, Vellum::FulfilledAdHocExecutePromptEvent, Vellum::RejectedAdHocExecutePromptEvent]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.ad_hoc.adhoc_execute_prompt(
#    ml_model: "x",
#    input_values: [{ key: "x", type: "STRING", value: "value" }, { key: "x", type: "STRING", value: "value" }],
#    input_variables: [{ id: "x", key: "key", type: STRING }, { id: "x", key: "key", type: STRING }],
#    parameters: {  },
#    blocks: [{ block_type: "JINJA", template: "template" }, { block_type: "JINJA", template: "template" }]
#  )
    def adhoc_execute_prompt(ml_model:, input_values:, input_variables:, parameters:, settings: nil, blocks:, functions: nil, expand_meta: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), ml_model: ml_model, input_values: input_values, input_variables: input_variables, parameters: parameters, settings: settings, blocks: blocks, functions: functions, expand_meta: expand_meta }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/ad-hoc/execute-prompt"
end
        Vellum::AdHocExecutePromptEvent.from_json(json_object: response.body)
      end
    end
  end
end