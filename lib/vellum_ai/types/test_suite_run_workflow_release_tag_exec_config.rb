# frozen_string_literal: true

require_relative "test_suite_run_workflow_release_tag_exec_config_data"
require "json"

module Vellum
  # Execution configuration for running a Test Suite against a Workflow Deployment
  class TestSuiteRunWorkflowReleaseTagExecConfig
    attr_reader :data, :test_case_ids, :additional_properties

    # @param data [TestSuiteRunWorkflowReleaseTagExecConfigData]
    # @param test_case_ids [Array<String>] Optionally specify a subset of test case ids to run. If not provided, all test cases within the test suite will be run by default.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TestSuiteRunWorkflowReleaseTagExecConfig]
    def initialize(data:, test_case_ids: nil, additional_properties: nil)
      # @type [TestSuiteRunWorkflowReleaseTagExecConfigData]
      @data = data
      # @type [Array<String>] Optionally specify a subset of test case ids to run. If not provided, all test cases within the test suite will be run by default.
      @test_case_ids = test_case_ids
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TestSuiteRunWorkflowReleaseTagExecConfig
    #
    # @param json_object [JSON]
    # @return [TestSuiteRunWorkflowReleaseTagExecConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["data"].nil?
        data = nil
      else
        data = parsed_json["data"].to_json
        data = TestSuiteRunWorkflowReleaseTagExecConfigData.from_json(json_object: data)
      end
      test_case_ids = struct.test_case_ids
      new(data: data, test_case_ids: test_case_ids, additional_properties: struct)
    end

    # Serialize an instance of TestSuiteRunWorkflowReleaseTagExecConfig to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "data": @data, "test_case_ids": @test_case_ids }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      TestSuiteRunWorkflowReleaseTagExecConfigData.validate_raw(obj: obj.data)
      obj.test_case_ids&.is_a?(Array) != false || raise("Passed value for field obj.test_case_ids is not the expected type, validation failed.")
    end
  end
end
