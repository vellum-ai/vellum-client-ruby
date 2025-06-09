# frozen_string_literal: true
require_relative "../../requests"
require_relative "../types/paginated_test_suite_test_case_list"
require_relative "../types/upsert_test_suite_test_case_request"
require_relative "../types/test_suite_test_case"
require "async"
require "async"
require "async"
require_relative "../../requests"

module Vellum
  class TestSuitesClient
  # @return [Vellum::RequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::TestSuitesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# List the Test Cases associated with a Test Suite
    #
    # @param id [String] Either the Test Suites' ID or its unique name
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedTestSuiteTestCaseList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.test_suites.list_test_suite_test_cases(id: "id")
    def list_test_suite_test_cases(id:, limit: nil, offset: nil, request_options: nil)
      response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/test-suites/#{id}/test-cases"
end
      Vellum::PaginatedTestSuiteTestCaseList.from_json(json_object: response.body)
    end
# Upserts a new test case for a test suite, keying off of the optionally provided
#  test case id.
#  If an id is provided and has a match, the test case will be updated. If no id is
#  provided or no match
#  is found, a new test case will be appended to the end.
#  Note that a full replacement of the test case is performed, so any fields not
#  provided will be removed
#  or overwritten with default values.
    #
    # @param id [String] Either the Test Suites' ID or its unique name
    # @param request [Hash] Request of type Vellum::UpsertTestSuiteTestCaseRequest, as a Hash
    #   * :id (String) 
    #   * :external_id (String) 
    #   * :label (String) 
    #   * :input_values (Array<Vellum::NamedTestCaseVariableValueRequest>) 
    #   * :evaluation_values (Array<Vellum::NamedTestCaseVariableValueRequest>) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::TestSuiteTestCase]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.test_suites.upsert_test_suite_test_case(id: "id", request: { label: "Test Case 1", input_values: [{ type: "STRING", value: "What are your favorite colors?", name: "var_1" }], evaluation_values: [{ type: "ARRAY", value: [{ type: "STRING", value: "Red" }, { type: "STRING", value: "Green" }, { type: "STRING", value: "Blue" }], name: "var_2" }] })
    def upsert_test_suite_test_case(id:, request:, request_options: nil)
      response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/test-suites/#{id}/test-cases"
end
      Vellum::TestSuiteTestCase.from_json(json_object: response.body)
    end
# Deletes an existing test case for a test suite, keying off of the test case id.
    #
    # @param id [String] Either the Test Suites' ID or its unique name
    # @param test_case_id [String] An id identifying the test case that you'd like to delete
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.test_suites.delete_test_suite_test_case(id: "id", test_case_id: "test_case_id")
    def delete_test_suite_test_case(id:, test_case_id:, request_options: nil)
      response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/test-suites/#{id}/test-cases/#{test_case_id}"
end
    end
  end
  class AsyncTestSuitesClient
  # @return [Vellum::AsyncRequestClient] 
    attr_reader :request_client


    # @param request_client [Vellum::RequestClient] 
    # @return [Vellum::AsyncTestSuitesClient]
    def initialize(request_client:)
      @request_client = request_client
    end
# List the Test Cases associated with a Test Suite
    #
    # @param id [String] Either the Test Suites' ID or its unique name
    # @param limit [Integer] Number of results to return per page.
    # @param offset [Integer] The initial index from which to return the results.
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::PaginatedTestSuiteTestCaseList]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.test_suites.list_test_suite_test_cases(id: "id")
    def list_test_suite_test_cases(id:, limit: nil, offset: nil, request_options: nil)
      Async do
        response = @request_client.conn.get do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  req.params = { **(request_options&.additional_query_parameters || {}), "limit": limit, "offset": offset }.compact
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/test-suites/#{id}/test-cases"
end
        Vellum::PaginatedTestSuiteTestCaseList.from_json(json_object: response.body)
      end
    end
# Upserts a new test case for a test suite, keying off of the optionally provided
#  test case id.
#  If an id is provided and has a match, the test case will be updated. If no id is
#  provided or no match
#  is found, a new test case will be appended to the end.
#  Note that a full replacement of the test case is performed, so any fields not
#  provided will be removed
#  or overwritten with default values.
    #
    # @param id [String] Either the Test Suites' ID or its unique name
    # @param request [Hash] Request of type Vellum::UpsertTestSuiteTestCaseRequest, as a Hash
    #   * :id (String) 
    #   * :external_id (String) 
    #   * :label (String) 
    #   * :input_values (Array<Vellum::NamedTestCaseVariableValueRequest>) 
    #   * :evaluation_values (Array<Vellum::NamedTestCaseVariableValueRequest>) 
    # @param request_options [Vellum::RequestOptions] 
    # @return [Vellum::TestSuiteTestCase]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.test_suites.upsert_test_suite_test_case(id: "id", request: { label: "Test Case 1", input_values: [{ type: "STRING", value: "What are your favorite colors?", name: "var_1" }], evaluation_values: [{ type: "ARRAY", value: [{ type: "STRING", value: "Red" }, { type: "STRING", value: "Green" }, { type: "STRING", value: "Blue" }], name: "var_2" }] })
    def upsert_test_suite_test_case(id:, request:, request_options: nil)
      Async do
        response = @request_client.conn.post do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  req.body = { **(request || {}), **(request_options&.additional_body_parameters || {}) }.compact
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/test-suites/#{id}/test-cases"
end
        Vellum::TestSuiteTestCase.from_json(json_object: response.body)
      end
    end
# Deletes an existing test case for a test suite, keying off of the test case id.
    #
    # @param id [String] Either the Test Suites' ID or its unique name
    # @param test_case_id [String] An id identifying the test case that you'd like to delete
    # @param request_options [Vellum::RequestOptions] 
    # @return [Void]
    # @example
#  api = Vellum::Client.new(
#    base_url: "https://api.example.com",
#    environment: Vellum::Environment::PRODUCTION,
#    api_key: "YOUR_API_KEY"
#  )
#  api.test_suites.delete_test_suite_test_case(id: "id", test_case_id: "test_case_id")
    def delete_test_suite_test_case(id:, test_case_id:, request_options: nil)
      Async do
        response = @request_client.conn.delete do | req |
  unless request_options&.timeout_in_seconds.nil?
    req.options.timeout = request_options.timeout_in_seconds
  end
  unless request_options&.api_key.nil?
    req.headers["X-API-KEY"] = request_options.api_key
  end
  req.headers = { **(req.headers || {}), **@request_client.get_headers, **(request_options&.additional_headers || {}) }.compact
  unless request_options.nil? || request_options&.additional_query_parameters.nil?
    req.params = { **(request_options&.additional_query_parameters || {}) }.compact
  end
  unless request_options.nil? || request_options&.additional_body_parameters.nil?
    req.body = { **(request_options&.additional_body_parameters || {}) }.compact
  end
  req.url "#{@request_client.get_url(environment: Default, request_options: request_options)}/v1/test-suites/#{id}/test-cases/#{test_case_id}"
end
      end
    end
  end
end