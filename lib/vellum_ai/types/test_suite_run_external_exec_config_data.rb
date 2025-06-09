# frozen_string_literal: true
require_relative "external_test_case_execution"
require "ostruct"
require "json"

module Vellum
  class TestSuiteRunExternalExecConfigData
  # @return [Array<Vellum::ExternalTestCaseExecution>] The executions of some callable external to Vellum whose outputs you would like
#  to evaluate.
    attr_reader :executions
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param executions [Array<Vellum::ExternalTestCaseExecution>] The executions of some callable external to Vellum whose outputs you would like
#  to evaluate.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunExternalExecConfigData]
    def initialize(executions:, additional_properties: nil)
      @executions = executions
      @additional_properties = additional_properties
      @_field_set = { "executions": executions }
    end
# Deserialize a JSON object to an instance of TestSuiteRunExternalExecConfigData
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunExternalExecConfigData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      executions = parsed_json["executions"]&.map do | item |
  item = item.to_json
  Vellum::ExternalTestCaseExecution.from_json(json_object: item)
end
      new(executions: executions, additional_properties: struct)
    end
# Serialize an instance of TestSuiteRunExternalExecConfigData to a JSON object
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
      obj.executions.is_a?(Array) != false || raise("Passed value for field obj.executions is not the expected type, validation failed.")
    end
  end
end