# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/workflow_deployment_release"
require "async"
require_relative "../../requests"

module Vellum
  class ReleaseReviewsClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::ReleaseReviewsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve a specific Workflow Deployment Release by either its UUID or the name
#  of a Release Tag that points to it.
    #
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param release_id_or_release_tag [String] Either the UUID of Workflow Deployment Release you'd like to retrieve, or the
#  name of a Release Tag that's pointing to the Workflow Deployment Release you'd
#  like to retrieve.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowDeploymentRelease]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.release_reviews.retrieve_workflow_deployment_release(id: "id", release_id_or_release_tag: "release_id_or_release_tag")
    def retrieve_workflow_deployment_release(id:, release_id_or_release_tag:, request_options: nil)
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}/releases/#{release_id_or_release_tag}"
end
      Vellum::WorkflowDeploymentRelease.from_json(json_object: response.body)
    end
  end
  class AsyncReleaseReviewsClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncReleaseReviewsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Retrieve a specific Workflow Deployment Release by either its UUID or the name
#  of a Release Tag that points to it.
    #
    # @param id [String] Either the Workflow Deployment's ID or its unique name
    # @param release_id_or_release_tag [String] Either the UUID of Workflow Deployment Release you'd like to retrieve, or the
#  name of a Release Tag that's pointing to the Workflow Deployment Release you'd
#  like to retrieve.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::WorkflowDeploymentRelease]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.release_reviews.retrieve_workflow_deployment_release(id: "id", release_id_or_release_tag: "release_id_or_release_tag")
    def retrieve_workflow_deployment_release(id:, release_id_or_release_tag:, request_options: nil)
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/workflow-deployments/#{id}/releases/#{release_id_or_release_tag}"
end
        Vellum::WorkflowDeploymentRelease.from_json(json_object: response.body)
      end
    end
  end
end