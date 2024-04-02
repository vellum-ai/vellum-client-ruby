# frozen_string_literal: true

require_relative "test_suite_run_metric_output"
require "json"

module Vellum
  class TestSuiteRunExecutionMetricResult
    attr_reader :metric_id, :outputs, :additional_properties

    # @param metric_id [String]
    # @param outputs [Array<TestSuiteRunMetricOutput>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TestSuiteRunExecutionMetricResult]
    def initialize(metric_id:, outputs:, additional_properties: nil)
      # @type [String]
      @metric_id = metric_id
      # @type [Array<TestSuiteRunMetricOutput>]
      @outputs = outputs
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TestSuiteRunExecutionMetricResult
    #
    # @param json_object [JSON]
    # @return [TestSuiteRunExecutionMetricResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      metric_id = struct.metric_id
      outputs = parsed_json["outputs"].map do |v|
        v = v.to_json
        TestSuiteRunMetricOutput.from_json(json_object: v)
      end
      new(metric_id: metric_id, outputs: outputs, additional_properties: struct)
    end

    # Serialize an instance of TestSuiteRunExecutionMetricResult to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "metric_id": @metric_id, "outputs": @outputs }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.metric_id.is_a?(String) != false || raise("Passed value for field obj.metric_id is not the expected type, validation failed.")
      obj.outputs.is_a?(Array) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
    end
  end
end
