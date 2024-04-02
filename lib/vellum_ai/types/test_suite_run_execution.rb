# frozen_string_literal: true

require_relative "test_suite_run_execution_output"
require_relative "test_suite_run_execution_metric_result"
require "json"

module Vellum
  class TestSuiteRunExecution
    attr_reader :id, :test_case_id, :outputs, :metric_results, :additional_properties

    # @param id [String]
    # @param test_case_id [String]
    # @param outputs [Array<TestSuiteRunExecutionOutput>]
    # @param metric_results [Array<TestSuiteRunExecutionMetricResult>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TestSuiteRunExecution]
    def initialize(id:, test_case_id:, outputs:, metric_results:, additional_properties: nil)
      # @type [String]
      @id = id
      # @type [String]
      @test_case_id = test_case_id
      # @type [Array<TestSuiteRunExecutionOutput>]
      @outputs = outputs
      # @type [Array<TestSuiteRunExecutionMetricResult>]
      @metric_results = metric_results
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TestSuiteRunExecution
    #
    # @param json_object [JSON]
    # @return [TestSuiteRunExecution]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      test_case_id = struct.test_case_id
      outputs = parsed_json["outputs"].map do |v|
        v = v.to_json
        TestSuiteRunExecutionOutput.from_json(json_object: v)
      end
      metric_results = parsed_json["metric_results"].map do |v|
        v = v.to_json
        TestSuiteRunExecutionMetricResult.from_json(json_object: v)
      end
      new(id: id, test_case_id: test_case_id, outputs: outputs, metric_results: metric_results,
          additional_properties: struct)
    end

    # Serialize an instance of TestSuiteRunExecution to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "id": @id, "test_case_id": @test_case_id, "outputs": @outputs, "metric_results": @metric_results }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.test_case_id.is_a?(String) != false || raise("Passed value for field obj.test_case_id is not the expected type, validation failed.")
      obj.outputs.is_a?(Array) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
      obj.metric_results.is_a?(Array) != false || raise("Passed value for field obj.metric_results is not the expected type, validation failed.")
    end
  end
end
