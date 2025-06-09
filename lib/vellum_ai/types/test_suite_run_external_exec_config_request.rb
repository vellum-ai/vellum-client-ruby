# frozen_string_literal: true
require_relative "test_suite_run_external_exec_config_data_request"
require "ostruct"
require "json"

module Vellum
# Execution configuration for running a Vellum Test Suite against an external
#  callable
  class TestSuiteRunExternalExecConfigRequest
  # @return [Vellum::TestSuiteRunExternalExecConfigDataRequest] 
    attr_reader :data
  # @return [Array<String>] Optionally specify a subset of test case ids to run. If not provided, all test
#  cases within the test suite will be run by default.
    attr_reader :test_case_ids
  # @return [String] 
    attr_reader :type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param data [Vellum::TestSuiteRunExternalExecConfigDataRequest] 
    # @param test_case_ids [Array<String>] Optionally specify a subset of test case ids to run. If not provided, all test
#  cases within the test suite will be run by default.
    # @param type [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunExternalExecConfigRequest]
    def initialize(data:, test_case_ids: OMIT, type:, additional_properties: nil)
      @data = data
      @test_case_ids = test_case_ids if test_case_ids != OMIT
      @type = type
      @additional_properties = additional_properties
      @_field_set = { "data": data, "test_case_ids": test_case_ids, "type": type }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  TestSuiteRunExternalExecConfigRequest
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunExternalExecConfigRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["data"].nil?
        data = parsed_json["data"].to_json
        data = Vellum::TestSuiteRunExternalExecConfigDataRequest.from_json(json_object: data)
      else
        data = nil
      end
      test_case_ids = parsed_json["test_case_ids"]
      type = parsed_json["type"]
      new(
        data: data,
        test_case_ids: test_case_ids,
        type: type,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunExternalExecConfigRequest to a JSON object
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
      Vellum::TestSuiteRunExternalExecConfigDataRequest.validate_raw(obj: obj.data)
      obj.test_case_ids&.is_a?(Array) != false || raise("Passed value for field obj.test_case_ids is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end