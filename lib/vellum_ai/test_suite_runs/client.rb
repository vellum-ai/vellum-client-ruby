# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/test_suite_run_exec_config_request"
require_relative "../types/test_suite_run_read"
require_relative "../types/paginated_test_suite_run_execution_list"
require "async"

module Vellum
  class TestSuiteRunsClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [TestSuiteRunsClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Trigger a Test Suite and create a new Test Suite Run
    #
    # @param test_suite_id [String] The ID of the Test Suite to run
    # @param exec_config [Hash] Configuration that defines how the Test Suite should be runRequest of type TestSuiteRunExecConfigRequest, as a Hash
    # @param request_options [RequestOptions]
    # @return [TestSuiteRunRead]
    def create(test_suite_id:, exec_config:, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          test_suite_id: test_suite_id,
          exec_config: exec_config
        }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/test-suite-runs"
      end
      TestSuiteRunRead.from_json(json_object: response.body)
    end

    # Retrieve a specific Test Suite Run by ID
    #
    # @param id [String] A UUID string identifying this test suite run.
    # @param request_options [RequestOptions]
    # @return [TestSuiteRunRead]
    def retrieve(id:, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/test-suite-runs/#{id}"
      end
      TestSuiteRunRead.from_json(json_object: response.body)
    end

    # @param id [String] A UUID string identifying this test suite run.
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param request_options [RequestOptions]
    # @return [PaginatedTestSuiteRunExecutionList]
    def list_executions(id:, limit: nil, offset: nil, request_options: nil)
      response = @request_client.conn.get do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.params = {
          **(request_options&.additional_query_parameters || {}),
          "limit": limit,
          "offset": offset
        }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/test-suite-runs/#{id}/executions"
      end
      PaginatedTestSuiteRunExecutionList.from_json(json_object: response.body)
    end
  end

  class AsyncTestSuiteRunsClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncTestSuiteRunsClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Trigger a Test Suite and create a new Test Suite Run
    #
    # @param test_suite_id [String] The ID of the Test Suite to run
    # @param exec_config [Hash] Configuration that defines how the Test Suite should be runRequest of type TestSuiteRunExecConfigRequest, as a Hash
    # @param request_options [RequestOptions]
    # @return [TestSuiteRunRead]
    def create(test_suite_id:, exec_config:, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            test_suite_id: test_suite_id,
            exec_config: exec_config
          }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/test-suite-runs"
        end
        TestSuiteRunRead.from_json(json_object: response.body)
      end
    end

    # Retrieve a specific Test Suite Run by ID
    #
    # @param id [String] A UUID string identifying this test suite run.
    # @param request_options [RequestOptions]
    # @return [TestSuiteRunRead]
    def retrieve(id:, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/test-suite-runs/#{id}"
        end
        TestSuiteRunRead.from_json(json_object: response.body)
      end
    end

    # @param id [String] A UUID string identifying this test suite run.
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param request_options [RequestOptions]
    # @return [PaginatedTestSuiteRunExecutionList]
    def list_executions(id:, limit: nil, offset: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.params = {
            **(request_options&.additional_query_parameters || {}),
            "limit": limit,
            "offset": offset
          }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/test-suite-runs/#{id}/executions"
        end
        PaginatedTestSuiteRunExecutionList.from_json(json_object: response.body)
      end
    end
  end
end
