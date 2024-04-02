# frozen_string_literal: true

require_relative "vellum_error"
require "json"

module Vellum
  class TestSuiteRunExecutionErrorOutput
    attr_reader :output_variable_id, :value, :additional_properties

    # @param output_variable_id [String]
    # @param value [VellumError]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TestSuiteRunExecutionErrorOutput]
    def initialize(output_variable_id:, value: nil, additional_properties: nil)
      # @type [String]
      @output_variable_id = output_variable_id
      # @type [VellumError]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TestSuiteRunExecutionErrorOutput
    #
    # @param json_object [JSON]
    # @return [TestSuiteRunExecutionErrorOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      output_variable_id = struct.output_variable_id
      if parsed_json["value"].nil?
        value = nil
      else
        value = parsed_json["value"].to_json
        value = VellumError.from_json(json_object: value)
      end
      new(output_variable_id: output_variable_id, value: value, additional_properties: struct)
    end

    # Serialize an instance of TestSuiteRunExecutionErrorOutput to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "output_variable_id": @output_variable_id, "value": @value }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.output_variable_id.is_a?(String) != false || raise("Passed value for field obj.output_variable_id is not the expected type, validation failed.")
      obj.value.nil? || VellumError.validate_raw(obj: obj.value)
    end
  end
end
