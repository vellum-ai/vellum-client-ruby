# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class TestSuiteRunProgress
  # @return [Integer] 
    attr_reader :number_of_requested_test_cases
  # @return [Integer] 
    attr_reader :number_of_completed_test_cases
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param number_of_requested_test_cases [Integer] 
    # @param number_of_completed_test_cases [Integer] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunProgress]
    def initialize(number_of_requested_test_cases:, number_of_completed_test_cases:, additional_properties: nil)
      @number_of_requested_test_cases = number_of_requested_test_cases
      @number_of_completed_test_cases = number_of_completed_test_cases
      @additional_properties = additional_properties
      @_field_set = { "number_of_requested_test_cases": number_of_requested_test_cases, "number_of_completed_test_cases": number_of_completed_test_cases }
    end
# Deserialize a JSON object to an instance of TestSuiteRunProgress
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunProgress]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      number_of_requested_test_cases = parsed_json["number_of_requested_test_cases"]
      number_of_completed_test_cases = parsed_json["number_of_completed_test_cases"]
      new(
        number_of_requested_test_cases: number_of_requested_test_cases,
        number_of_completed_test_cases: number_of_completed_test_cases,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunProgress to a JSON object
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
      obj.number_of_requested_test_cases.is_a?(Integer) != false || raise("Passed value for field obj.number_of_requested_test_cases is not the expected type, validation failed.")
      obj.number_of_completed_test_cases.is_a?(Integer) != false || raise("Passed value for field obj.number_of_completed_test_cases is not the expected type, validation failed.")
    end
  end
end