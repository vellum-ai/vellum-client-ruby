# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/deployment_read"
require_relative "../types/named_scenario_input_request"
require_relative "../types/sandbox_scenario"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class SandboxesClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::SandboxesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param id [String] A UUID string identifying this sandbox.
    # @param prompt_variant_id [String] An ID identifying the Prompt you'd like to deploy.
    # @param prompt_deployment_id [String] The Vellum-generated ID of the Prompt Deployment you'd like to update. Cannot
#  specify both this and prompt_deployment_name. Leave null to create a new Prompt
#  Deployment.
    # @param prompt_deployment_name [String] The unique name of the Prompt Deployment you'd like to either create or update.
#  Cannot specify both this and prompt_deployment_id. If provided and matches an
#  existing Prompt Deployment, that Prompt Deployment will be updated. Otherwise, a
#  new Prompt Deployment will be created.
    # @param label [String] In the event that a new Prompt Deployment is created, this will be the label
#  it's given.
    # @param release_tags [Array<String>] Optionally provide the release tags that you'd like to be associated with the
#  latest release of the created/updated Prompt Deployment.
    # @param release_description [String] Optionally provide a description that details what's new in this Release.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DeploymentRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.sandboxes.deploy_prompt(id: "id", prompt_variant_id: "prompt_variant_id")
    def deploy_prompt(id:, prompt_variant_id:, prompt_deployment_id: nil, prompt_deployment_name: nil, label: nil, release_tags: nil, release_description: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), prompt_deployment_id: prompt_deployment_id, prompt_deployment_name: prompt_deployment_name, label: label, release_tags: release_tags, release_description: release_description }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/sandboxes/#{id}/prompts/#{prompt_variant_id}/deploy"
end
      Vellum::DeploymentRead.from_json(json_object: response.body)
    end
# Upserts a new scenario for a sandbox, keying off of the optionally provided
#  scenario id.
#  If an id is provided and has a match, the scenario will be updated. If no id is
#  provided or no match
#  is found, a new scenario will be appended to the end.
#  Note that a full replacement of the scenario is performed, so any fields not
#  provided will be removed
#  or overwritten with default values.
    #
    # @param id [String] A UUID string identifying this sandbox.
    # @param label [String] 
    # @param inputs [Array<Hash>] The inputs for the scenarioRequest of type Array<Vellum::NamedScenarioInputRequest>, as a Hash
    # @param scenario_id [String] The id of the scenario to update. If none is provided, an id will be generated
#  and a new scenario will be appended.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::SandboxScenario]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.sandboxes.upsert_sandbox_scenario(id: "id", inputs: )
    def upsert_sandbox_scenario(id:, label: nil, inputs:, scenario_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), label: label, inputs: inputs, scenario_id: scenario_id }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/sandboxes/#{id}/scenarios"
end
      Vellum::SandboxScenario.from_json(json_object: response.body)
    end
# Deletes an existing scenario from a sandbox, keying off of the provided scenario
#  id.
    #
    # @param id [String] A UUID string identifying this sandbox.
    # @param scenario_id [String] An id identifying the scenario that you'd like to delete
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.sandboxes.delete_sandbox_scenario(id: "id", scenario_id: "scenario_id")
    def delete_sandbox_scenario(id:, scenario_id:, request_options: nil)
      response = @request_client.conn.delete do | req |
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/sandboxes/#{id}/scenarios/#{scenario_id}"
end
    end
  end
  class AsyncSandboxesClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncSandboxesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
    # @param id [String] A UUID string identifying this sandbox.
    # @param prompt_variant_id [String] An ID identifying the Prompt you'd like to deploy.
    # @param prompt_deployment_id [String] The Vellum-generated ID of the Prompt Deployment you'd like to update. Cannot
#  specify both this and prompt_deployment_name. Leave null to create a new Prompt
#  Deployment.
    # @param prompt_deployment_name [String] The unique name of the Prompt Deployment you'd like to either create or update.
#  Cannot specify both this and prompt_deployment_id. If provided and matches an
#  existing Prompt Deployment, that Prompt Deployment will be updated. Otherwise, a
#  new Prompt Deployment will be created.
    # @param label [String] In the event that a new Prompt Deployment is created, this will be the label
#  it's given.
    # @param release_tags [Array<String>] Optionally provide the release tags that you'd like to be associated with the
#  latest release of the created/updated Prompt Deployment.
    # @param release_description [String] Optionally provide a description that details what's new in this Release.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::DeploymentRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.sandboxes.deploy_prompt(id: "id", prompt_variant_id: "prompt_variant_id")
    def deploy_prompt(id:, prompt_variant_id:, prompt_deployment_id: nil, prompt_deployment_name: nil, label: nil, release_tags: nil, release_description: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), prompt_deployment_id: prompt_deployment_id, prompt_deployment_name: prompt_deployment_name, label: label, release_tags: release_tags, release_description: release_description }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/sandboxes/#{id}/prompts/#{prompt_variant_id}/deploy"
end
        Vellum::DeploymentRead.from_json(json_object: response.body)
      end
    end
# Upserts a new scenario for a sandbox, keying off of the optionally provided
#  scenario id.
#  If an id is provided and has a match, the scenario will be updated. If no id is
#  provided or no match
#  is found, a new scenario will be appended to the end.
#  Note that a full replacement of the scenario is performed, so any fields not
#  provided will be removed
#  or overwritten with default values.
    #
    # @param id [String] A UUID string identifying this sandbox.
    # @param label [String] 
    # @param inputs [Array<Hash>] The inputs for the scenarioRequest of type Array<Vellum::NamedScenarioInputRequest>, as a Hash
    # @param scenario_id [String] The id of the scenario to update. If none is provided, an id will be generated
#  and a new scenario will be appended.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::SandboxScenario]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.sandboxes.upsert_sandbox_scenario(id: "id", inputs: )
    def upsert_sandbox_scenario(id:, label: nil, inputs:, scenario_id: nil, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), label: label, inputs: inputs, scenario_id: scenario_id }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/sandboxes/#{id}/scenarios"
end
        Vellum::SandboxScenario.from_json(json_object: response.body)
      end
    end
# Deletes an existing scenario from a sandbox, keying off of the provided scenario
#  id.
    #
    # @param id [String] A UUID string identifying this sandbox.
    # @param scenario_id [String] An id identifying the scenario that you'd like to delete
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.sandboxes.delete_sandbox_scenario(id: "id", scenario_id: "scenario_id")
    def delete_sandbox_scenario(id:, scenario_id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do | req |
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/sandboxes/#{id}/scenarios/#{scenario_id}"
end
      end
    end
  end
end