# frozen_string_literal: true
require_relative "test_suite_run_workflow_release_tag_exec_config_data"
require "ostruct"
require "json"

module Vellum
# Execution configuration for running a Test Suite against a Workflow Deployment
  class TestSuiteRunWorkflowReleaseTagExecConfig
  # @return [String] 
    attr_reader :type
  # @return [Vellum::TestSuiteRunWorkflowReleaseTagExecConfigData] 
    attr_reader :data
  # @return [Array<String>] Optionally specify a subset of test case ids to run. If not provided, all test
#  cases within the test suite will be run by default.
    attr_reader :test_case_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] 
    # @param data [Vellum::TestSuiteRunWorkflowReleaseTagExecConfigData] 
    # @param test_case_ids [Array<String>] Optionally specify a subset of test case ids to run. If not provided, all test
#  cases within the test suite will be run by default.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunWorkflowReleaseTagExecConfig]
    def initialize(type:, data:, test_case_ids: OMIT, additional_properties: nil)
      @type = type
      @data = data
      @test_case_ids = test_case_ids if test_case_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "data": data, "test_case_ids": test_case_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  TestSuiteRunWorkflowReleaseTagExecConfig
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunWorkflowReleaseTagExecConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      unless parsed_json["data"].nil?
        data = parsed_json["data"].to_json
        data = Vellum::TestSuiteRunWorkflowReleaseTagExecConfigData.from_json(json_object: data)
      else
        data = nil
      end
      test_case_ids = parsed_json["test_case_ids"]
      new(
        type: type,
        data: data,
        test_case_ids: test_case_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunWorkflowReleaseTagExecConfig to a JSON
#  object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      Vellum::TestSuiteRunWorkflowReleaseTagExecConfigData.validate_raw(obj: obj.data)
      obj.test_case_ids&.is_a?(Array) != false || raise("Passed value for field obj.test_case_ids is not the expected type, validation failed.")
    end
  end
end