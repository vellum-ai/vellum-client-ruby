# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/test_suite_run_exec_config_request"
require_relative "../types/test_suite_run_read"
require_relative "../types/paginated_test_suite_run_execution_list"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class TestSuiteRunsClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::TestSuiteRunsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Trigger a Test Suite and create a new Test Suite Run
    #
    # @param test_suite_id [String] The ID of the Test Suite to run. Must provide either this or test_suite_id.
    # @param test_suite_name [String] The name of the Test Suite to run. Must provide either this or test_suite_id.
    # @param exec_config [Vellum::TestSuiteRunExecConfigRequest] Configuration that defines how the Test Suite should be run
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::TestSuiteRunRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.test_suite_runs.create
    def create(test_suite_id: nil, test_suite_name: nil, exec_config:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), test_suite_id: test_suite_id, test_suite_name: test_suite_name, exec_config: exec_config }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/test-suite-runs"
end
      Vellum::TestSuiteRunRead.from_json(json_object: response.body)
    end
# Retrieve a specific Test Suite Run by ID
    #
    # @param id [String] A UUID string identifying this test suite run.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::TestSuiteRunRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.test_suite_runs.retrieve(id: "id")
    def retrieve(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/test-suite-runs/#{id}"
end
      Vellum::TestSuiteRunRead.from_json(json_object: response.body)
    end
    # @param id [String] A UUID string identifying this test suite run.
    # @param expand [String] The response fields to expand for more information.
#  - 'metric_results.metric_label' expands the metric label for each metric result.
#  - 'metric_results.metric_definition' expands the metric definition for each
#  metric result.
#  - 'metric_results.metric_definition.name' expands the metric definition name for
#  each metric result.
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedTestSuiteRunExecutionList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.test_suite_runs.list_executions(id: "id")
    def list_executions(id:, expand: nil, limit: nil, offset: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "expand": expand, "limit": limit, "offset": offset }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/test-suite-runs/#{id}/executions"
end
      Vellum::PaginatedTestSuiteRunExecutionList.from_json(json_object: response.body)
    end
  end
  class AsyncTestSuiteRunsClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncTestSuiteRunsClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# Trigger a Test Suite and create a new Test Suite Run
    #
    # @param test_suite_id [String] The ID of the Test Suite to run. Must provide either this or test_suite_id.
    # @param test_suite_name [String] The name of the Test Suite to run. Must provide either this or test_suite_id.
    # @param exec_config [Vellum::TestSuiteRunExecConfigRequest] Configuration that defines how the Test Suite should be run
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::TestSuiteRunRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.test_suite_runs.create
    def create(test_suite_id: nil, test_suite_name: nil, exec_config:, request_options: nil)
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
  req.body = { **(request_options&.additional_body_parameters || {}), test_suite_id: test_suite_id, test_suite_name: test_suite_name, exec_config: exec_config }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/test-suite-runs"
end
        Vellum::TestSuiteRunRead.from_json(json_object: response.body)
      end
    end
# Retrieve a specific Test Suite Run by ID
    #
    # @param id [String] A UUID string identifying this test suite run.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::TestSuiteRunRead]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.test_suite_runs.retrieve(id: "id")
    def retrieve(id:, request_options: nil)
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
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/test-suite-runs/#{id}"
end
        Vellum::TestSuiteRunRead.from_json(json_object: response.body)
      end
    end
    # @param id [String] A UUID string identifying this test suite run.
    # @param expand [String] The response fields to expand for more information.
#  - 'metric_results.metric_label' expands the metric label for each metric result.
#  - 'metric_results.metric_definition' expands the metric definition for each
#  metric result.
#  - 'metric_results.metric_definition.name' expands the metric definition name for
#  each metric result.
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedTestSuiteRunExecutionList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.test_suite_runs.list_executions(id: "id")
    def list_executions(id:, expand: nil, limit: nil, offset: nil, request_options: nil)
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
  req.params = { **(request_options&.additional_query_parameters || {}), "expand": expand, "limit": limit, "offset": offset }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/test-suite-runs/#{id}/executions"
end
        Vellum::PaginatedTestSuiteRunExecutionList.from_json(json_object: response.body)
      end
    end
  end
end