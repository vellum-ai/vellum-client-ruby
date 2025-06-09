# frozen_string_literal: true
require_relative "test_suite_run_metric_output"
require "ostruct"
require "json"

module Vellum
  class MetricDefinitionExecution
  # @return [Array<Vellum::TestSuiteRunMetricOutput>] 
    attr_reader :outputs
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param outputs [Array<Vellum::TestSuiteRunMetricOutput>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::MetricDefinitionExecution]
    def initialize(outputs:, additional_properties: nil)
      @outputs = outputs
      @additional_properties = additional_properties
      @_field_set = { "outputs": outputs }
    end
# Deserialize a JSON object to an instance of MetricDefinitionExecution
    #
    # @param json_object [String] 
    # @return [Vellum::MetricDefinitionExecution]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      outputs = parsed_json["outputs"]&.map do | item |
  item = item.to_json
  Vellum::TestSuiteRunMetricOutput.from_json(json_object: item)
end
      new(outputs: outputs, additional_properties: struct)
    end
# Serialize an instance of MetricDefinitionExecution to a JSON object
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
    end
  end
end