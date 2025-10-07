# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/prompt_exec_config"
require_relative "../types/prompt_push_response"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class PromptsClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::PromptsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Used to pull the definition of a Prompt from Vellum.
    #
    # @param id [String] The ID of the Prompt to pull from. Prompt Sandbox IDs are currently supported.
    # @param prompt_variant_id [String] The ID of the Prompt Variant within a Prompt Sandbox to pull. Must be included
#  if providing the ID of a Prompt Sandbox.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PromptExecConfig]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.prompts.pull(id: "id")
    def pull(id:, prompt_variant_id: nil, request_options: nil)
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
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}), "Accept": "application/json" }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "prompt_variant_id": prompt_variant_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/prompts/#{id}/pull"
end
      Vellum::PromptExecConfig.from_json(json_object: response.body)
    end
# Used to push updates to a Prompt in Vellum.
    #
    # @param prompt_variant_id [String] If specified, an existing Prompt Variant by the provided ID will be updated.
#  Otherwise, a new Prompt Variant will be created and an ID generated.
    # @param prompt_variant_label [String] If provided, then the created/updated Prompt Variant will have this label.
    # @param prompt_sandbox_id [String] 
    # @param exec_config [Hash] Request of type Vellum::PromptExecConfig, as a Hash
    #   * :ml_model (String) 
    #   * :input_variables (Array<Vellum::VellumVariable>) 
    #   * :parameters (Hash)
    #     * :stop (Array<String>) 
    #     * :temperature (Float) 
    #     * :max_tokens (Integer) 
    #     * :top_p (Float) 
    #     * :top_k (Integer) 
    #     * :frequency_penalty (Float) 
    #     * :presence_penalty (Float) 
    #     * :logit_bias (Hash{String => Float}) 
    #     * :custom_parameters (Hash{String => Object}) 
    #   * :settings (Hash)
    #     * :timeout (Float) 
    #     * :stream_enabled (Boolean) 
    #   * :blocks (Array<Vellum::PromptBlock>) 
    #   * :functions (Array<Vellum::FunctionDefinition>) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PromptPushResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.prompts.push(exec_config: { ml_model: "ml_model", input_variables: [{ id: "x", key: "key", type: STRING }, { id: "x", key: "key", type: STRING }], parameters: {  }, blocks: [{ block_type: "JINJA", template: "template" }, { block_type: "JINJA", template: "template" }] })
    def push(prompt_variant_id: nil, prompt_variant_label: nil, prompt_sandbox_id: nil, exec_config:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), prompt_variant_id: prompt_variant_id, prompt_variant_label: prompt_variant_label, prompt_sandbox_id: prompt_sandbox_id, exec_config: exec_config }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/prompts/push"
end
      Vellum::PromptPushResponse.from_json(json_object: response.body)
    end
  end
  class AsyncPromptsClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncPromptsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Used to pull the definition of a Prompt from Vellum.
    #
    # @param id [String] The ID of the Prompt to pull from. Prompt Sandbox IDs are currently supported.
    # @param prompt_variant_id [String] The ID of the Prompt Variant within a Prompt Sandbox to pull. Must be included
#  if providing the ID of a Prompt Sandbox.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PromptExecConfig]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.prompts.pull(id: "id")
    def pull(id:, prompt_variant_id: nil, request_options: nil)
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
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}), "Accept": "application/json" }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "prompt_variant_id": prompt_variant_id }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/prompts/#{id}/pull"
end
        Vellum::PromptExecConfig.from_json(json_object: response.body)
      end
    end
# Used to push updates to a Prompt in Vellum.
    #
    # @param prompt_variant_id [String] If specified, an existing Prompt Variant by the provided ID will be updated.
#  Otherwise, a new Prompt Variant will be created and an ID generated.
    # @param prompt_variant_label [String] If provided, then the created/updated Prompt Variant will have this label.
    # @param prompt_sandbox_id [String] 
    # @param exec_config [Hash] Request of type Vellum::PromptExecConfig, as a Hash
    #   * :ml_model (String) 
    #   * :input_variables (Array<Vellum::VellumVariable>) 
    #   * :parameters (Hash)
    #     * :stop (Array<String>) 
    #     * :temperature (Float) 
    #     * :max_tokens (Integer) 
    #     * :top_p (Float) 
    #     * :top_k (Integer) 
    #     * :frequency_penalty (Float) 
    #     * :presence_penalty (Float) 
    #     * :logit_bias (Hash{String => Float}) 
    #     * :custom_parameters (Hash{String => Object}) 
    #   * :settings (Hash)
    #     * :timeout (Float) 
    #     * :stream_enabled (Boolean) 
    #   * :blocks (Array<Vellum::PromptBlock>) 
    #   * :functions (Array<Vellum::FunctionDefinition>) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PromptPushResponse]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.prompts.push(exec_config: { ml_model: "ml_model", input_variables: [{ id: "x", key: "key", type: STRING }, { id: "x", key: "key", type: STRING }], parameters: {  }, blocks: [{ block_type: "JINJA", template: "template" }, { block_type: "JINJA", template: "template" }] })
    def push(prompt_variant_id: nil, prompt_variant_label: nil, prompt_sandbox_id: nil, exec_config:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), prompt_variant_id: prompt_variant_id, prompt_variant_label: prompt_variant_label, prompt_sandbox_id: prompt_sandbox_id, exec_config: exec_config }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/prompts/push"
end
        Vellum::PromptPushResponse.from_json(json_object: response.body)
      end
    end
  end
end