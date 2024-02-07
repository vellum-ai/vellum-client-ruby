# frozen_string_literal: true

require_relative "test_case_variable_value"
require "json"

module Vellum
  class TestSuiteTestCase
    attr_reader :id, :label, :input_values, :evaluation_values, :additional_properties

    # @param id [String]
    # @param label [String]
    # @param input_values [Array<TestCaseVariableValue>]
    # @param evaluation_values [Array<TestCaseVariableValue>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TestSuiteTestCase]
    def initialize(input_values:, evaluation_values:, id: nil, label: nil, additional_properties: nil)
      # @type [String]
      @id = id
      # @type [String]
      @label = label
      # @type [Array<TestCaseVariableValue>]
      @input_values = input_values
      # @type [Array<TestCaseVariableValue>]
      @evaluation_values = evaluation_values
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TestSuiteTestCase
    #
    # @param json_object [JSON]
    # @return [TestSuiteTestCase]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      label = struct.label
      input_values = parsed_json["input_values"].map do |v|
        v = v.to_json
        TestCaseVariableValue.from_json(json_object: v)
      end
      evaluation_values = parsed_json["evaluation_values"].map do |v|
        v = v.to_json
        TestCaseVariableValue.from_json(json_object: v)
      end
      new(id: id, label: label, input_values: input_values, evaluation_values: evaluation_values,
          additional_properties: struct)
    end

    # Serialize an instance of TestSuiteTestCase to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "id": @id, "label": @label, "input_values": @input_values, "evaluation_values": @evaluation_values }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.input_values.is_a?(Array) != false || raise("Passed value for field obj.input_values is not the expected type, validation failed.")
      obj.evaluation_values.is_a?(Array) != false || raise("Passed value for field obj.evaluation_values is not the expected type, validation failed.")
    end
  end
end
