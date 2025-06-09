# frozen_string_literal: true
require_relative "named_test_case_variable_value"
require "ostruct"
require "json"

module Vellum
  class ExternalTestCaseExecution
  # @return [Array<Vellum::NamedTestCaseVariableValue>] The output values of a callable that was executed against a Test Case outside of
#  Vellum
    attr_reader :outputs
  # @return [String] 
    attr_reader :test_case_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param outputs [Array<Vellum::NamedTestCaseVariableValue>] The output values of a callable that was executed against a Test Case outside of
#  Vellum
    # @param test_case_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ExternalTestCaseExecution]
    def initialize(outputs:, test_case_id:, additional_properties: nil)
      @outputs = outputs
      @test_case_id = test_case_id
      @additional_properties = additional_properties
      @_field_set = { "outputs": outputs, "test_case_id": test_case_id }
    end
# Deserialize a JSON object to an instance of ExternalTestCaseExecution
    #
    # @param json_object [String] 
    # @return [Vellum::ExternalTestCaseExecution]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      outputs = parsed_json["outputs"]&.map do | item |
  item = item.to_json
  Vellum::NamedTestCaseVariableValue.from_json(json_object: item)
end
      test_case_id = parsed_json["test_case_id"]
      new(
        outputs: outputs,
        test_case_id: test_case_id,
        additional_properties: struct
      )
    end
# Serialize an instance of ExternalTestCaseExecution to a JSON object
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
      obj.outputs.is_a?(Array) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
      obj.test_case_id.is_a?(String) != false || raise("Passed value for field obj.test_case_id is not the expected type, validation failed.")
    end
  end
end