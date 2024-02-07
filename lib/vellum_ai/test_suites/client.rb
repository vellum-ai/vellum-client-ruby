# frozen_string_literal: true

require_relative "../../requests"
require_relative "../types/named_test_case_variable_value_request"
require_relative "../types/test_suite_test_case"
require "async"

module Vellum
  class TestSuitesClient
    attr_reader :request_client

    # @param request_client [RequestClient]
    # @return [TestSuitesClient]
    def initialize(request_client:)
      # @type [RequestClient]
      @request_client = request_client
    end

    # Upserts a new test case for a test suite, keying off of the optionally provided test case id.
    #
    # If an id is provided and has a match, the test case will be updated. If no id is provided or no match
    # is found, a new test case will be appended to the end.
    #
    # Note that a full replacement of the test case is performed, so any fields not provided will be removed
    # or overwritten with default values.
    #
    # @param id [String] A UUID string identifying this test suite.
    # @param upsert_test_suite_test_case_request_id [String]
    # @param label [String]
    # @param input_values [Array<Hash>] Request of type Array<NamedTestCaseVariableValueRequest>, as a Hash
    # @param evaluation_values [Array<Hash>] Request of type Array<NamedTestCaseVariableValueRequest>, as a Hash
    # @param request_options [RequestOptions]
    # @return [TestSuiteTestCase]
    def upsert_test_suite_test_case(id:, input_values:, evaluation_values:,
                                    upsert_test_suite_test_case_request_id: nil, label: nil, request_options: nil)
      response = @request_client.conn.post do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.body = {
          **(request_options&.additional_body_parameters || {}),
          id: upsert_test_suite_test_case_request_id,
          label: label,
          input_values: input_values,
          evaluation_values: evaluation_values
        }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/test-suites/#{id}/test-cases"
      end
      TestSuiteTestCase.from_json(json_object: response.body)
    end

    # Deletes an existing test case for a test suite, keying off of the test case id.
    #
    # @param id [String] A UUID string identifying this test suite.
    # @param test_case_id [String] An id identifying the test case that you'd like to delete
    # @param request_options [RequestOptions]
    # @return [Void]
    def delete_test_suite_test_case(id:, test_case_id:, request_options: nil)
      @request_client.conn.delete do |req|
        req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
        req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
        req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
        req.url "#{@request_client.default_environment[:Default]}/v1/test-suites/#{id}/test-cases/#{test_case_id}"
      end
    end
  end

  class AsyncTestSuitesClient
    attr_reader :request_client

    # @param request_client [AsyncRequestClient]
    # @return [AsyncTestSuitesClient]
    def initialize(request_client:)
      # @type [AsyncRequestClient]
      @request_client = request_client
    end

    # Upserts a new test case for a test suite, keying off of the optionally provided test case id.
    #
    # If an id is provided and has a match, the test case will be updated. If no id is provided or no match
    # is found, a new test case will be appended to the end.
    #
    # Note that a full replacement of the test case is performed, so any fields not provided will be removed
    # or overwritten with default values.
    #
    # @param id [String] A UUID string identifying this test suite.
    # @param upsert_test_suite_test_case_request_id [String]
    # @param label [String]
    # @param input_values [Array<Hash>] Request of type Array<NamedTestCaseVariableValueRequest>, as a Hash
    # @param evaluation_values [Array<Hash>] Request of type Array<NamedTestCaseVariableValueRequest>, as a Hash
    # @param request_options [RequestOptions]
    # @return [TestSuiteTestCase]
    def upsert_test_suite_test_case(id:, input_values:, evaluation_values:,
                                    upsert_test_suite_test_case_request_id: nil, label: nil, request_options: nil)
      Async do
        response = @request_client.conn.post do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.body = {
            **(request_options&.additional_body_parameters || {}),
            id: upsert_test_suite_test_case_request_id,
            label: label,
            input_values: input_values,
            evaluation_values: evaluation_values
          }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/test-suites/#{id}/test-cases"
        end
        TestSuiteTestCase.from_json(json_object: response.body)
      end
    end

    # Deletes an existing test case for a test suite, keying off of the test case id.
    #
    # @param id [String] A UUID string identifying this test suite.
    # @param test_case_id [String] An id identifying the test case that you'd like to delete
    # @param request_options [RequestOptions]
    # @return [Void]
    def delete_test_suite_test_case(id:, test_case_id:, request_options: nil)
      Async do
        @request_client.conn.delete do |req|
          req.options.timeout = request_options.timeout_in_seconds unless request_options&.timeout_in_seconds.nil?
          req.headers["X_API_KEY"] = request_options.api_key unless request_options&.api_key.nil?
          req.headers = { **req.headers, **(request_options&.additional_headers || {}) }.compact
          req.url "#{@request_client.default_environment[:Default]}/v1/test-suites/#{id}/test-cases/#{test_case_id}"
        end
      end
    end
  end
end
