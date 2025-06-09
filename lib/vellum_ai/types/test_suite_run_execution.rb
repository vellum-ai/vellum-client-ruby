# frozen_string_literal: true
require_relative "test_suite_run_execution_output"
require_relative "test_suite_run_execution_metric_result"
require "ostruct"
require "json"

module Vellum
  class TestSuiteRunExecution
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :test_case_id
  # @return [Array<Vellum::TestSuiteRunExecutionOutput>] 
    attr_reader :outputs
  # @return [Array<Vellum::TestSuiteRunExecutionMetricResult>] 
    attr_reader :metric_results
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param test_case_id [String] 
    # @param outputs [Array<Vellum::TestSuiteRunExecutionOutput>] 
    # @param metric_results [Array<Vellum::TestSuiteRunExecutionMetricResult>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunExecution]
    def initialize(id:, test_case_id:, outputs:, metric_results:, additional_properties: nil)
      @id = id
      @test_case_id = test_case_id
      @outputs = outputs
      @metric_results = metric_results
      @additional_properties = additional_properties
      @_field_set = { "id": id, "test_case_id": test_case_id, "outputs": outputs, "metric_results": metric_results }
    end
# Deserialize a JSON object to an instance of TestSuiteRunExecution
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunExecution]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      test_case_id = parsed_json["test_case_id"]
      outputs = parsed_json["outputs"]&.map do | item |
  item = item.to_json
  Vellum::TestSuiteRunExecutionOutput.from_json(json_object: item)
end
      metric_results = parsed_json["metric_results"]&.map do | item |
  item = item.to_json
  Vellum::TestSuiteRunExecutionMetricResult.from_json(json_object: item)
end
      new(
        id: id,
        test_case_id: test_case_id,
        outputs: outputs,
        metric_results: metric_results,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunExecution to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.test_case_id.is_a?(String) != false || raise("Passed value for field obj.test_case_id is not the expected type, validation failed.")
      obj.outputs.is_a?(Array) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
      obj.metric_results.is_a?(Array) != false || raise("Passed value for field obj.metric_results is not the expected type, validation failed.")
    end
  end
end