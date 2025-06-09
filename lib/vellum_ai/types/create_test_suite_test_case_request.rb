# frozen_string_literal: true
require_relative "named_test_case_variable_value_request"
require "ostruct"
require "json"

module Vellum
# Information about the Test Case to create
  class CreateTestSuiteTestCaseRequest
  # @return [String] A human-readable label used to convey the intention of this Test Case
    attr_reader :label
  # @return [Array<Vellum::NamedTestCaseVariableValueRequest>] Values for each of the Test Case's input variables
    attr_reader :input_values
  # @return [Array<Vellum::NamedTestCaseVariableValueRequest>] Values for each of the Test Case's evaluation variables
    attr_reader :evaluation_values
  # @return [String] Optionally provide an ID that uniquely identifies this Test Case in your system.
#  Useful for updating this Test Cases data after initial creation. Cannot be
#  changed later.
    attr_reader :external_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param label [String] A human-readable label used to convey the intention of this Test Case
    # @param input_values [Array<Vellum::NamedTestCaseVariableValueRequest>] Values for each of the Test Case's input variables
    # @param evaluation_values [Array<Vellum::NamedTestCaseVariableValueRequest>] Values for each of the Test Case's evaluation variables
    # @param external_id [String] Optionally provide an ID that uniquely identifies this Test Case in your system.
#  Useful for updating this Test Cases data after initial creation. Cannot be
#  changed later.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::CreateTestSuiteTestCaseRequest]
    def initialize(label: OMIT, input_values:, evaluation_values:, external_id: OMIT, additional_properties: nil)
      @label = label if label != OMIT
      @input_values = input_values
      @evaluation_values = evaluation_values
      @external_id = external_id if external_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "label": label, "input_values": input_values, "evaluation_values": evaluation_values, "external_id": external_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CreateTestSuiteTestCaseRequest
    #
    # @param json_object [String] 
    # @return [Vellum::CreateTestSuiteTestCaseRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      label = parsed_json["label"]
      input_values = parsed_json["input_values"]&.map do | item |
  item = item.to_json
  Vellum::NamedTestCaseVariableValueRequest.from_json(json_object: item)
end
      evaluation_values = parsed_json["evaluation_values"]&.map do | item |
  item = item.to_json
  Vellum::NamedTestCaseVariableValueRequest.from_json(json_object: item)
end
      external_id = parsed_json["external_id"]
      new(
        label: label,
        input_values: input_values,
        evaluation_values: evaluation_values,
        external_id: external_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CreateTestSuiteTestCaseRequest to a JSON object
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
      obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.input_values.is_a?(Array) != false || raise("Passed value for field obj.input_values is not the expected type, validation failed.")
      obj.evaluation_values.is_a?(Array) != false || raise("Passed value for field obj.evaluation_values is not the expected type, validation failed.")
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
    end
  end
end