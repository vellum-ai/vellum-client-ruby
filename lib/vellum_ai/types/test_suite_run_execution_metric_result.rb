# frozen_string_literal: true
require_relative "test_suite_run_metric_output"
require_relative "test_suite_run_execution_metric_definition"
require "ostruct"
require "json"

module Vellum
  class TestSuiteRunExecutionMetricResult
  # @return [String] 
    attr_reader :metric_id
  # @return [Array<Vellum::TestSuiteRunMetricOutput>] 
    attr_reader :outputs
  # @return [String] 
    attr_reader :metric_label
  # @return [Vellum::TestSuiteRunExecutionMetricDefinition] 
    attr_reader :metric_definition
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param metric_id [String] 
    # @param outputs [Array<Vellum::TestSuiteRunMetricOutput>] 
    # @param metric_label [String] 
    # @param metric_definition [Vellum::TestSuiteRunExecutionMetricDefinition] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunExecutionMetricResult]
    def initialize(metric_id:, outputs:, metric_label: OMIT, metric_definition: OMIT, additional_properties: nil)
      @metric_id = metric_id
      @outputs = outputs
      @metric_label = metric_label if metric_label != OMIT
      @metric_definition = metric_definition if metric_definition != OMIT
      @additional_properties = additional_properties
      @_field_set = { "metric_id": metric_id, "outputs": outputs, "metric_label": metric_label, "metric_definition": metric_definition }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TestSuiteRunExecutionMetricResult
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunExecutionMetricResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      metric_id = parsed_json["metric_id"]
      outputs = parsed_json["outputs"]&.map do | item |
  item = item.to_json
  Vellum::TestSuiteRunMetricOutput.from_json(json_object: item)
end
      metric_label = parsed_json["metric_label"]
      unless parsed_json["metric_definition"].nil?
        metric_definition = parsed_json["metric_definition"].to_json
        metric_definition = Vellum::TestSuiteRunExecutionMetricDefinition.from_json(json_object: metric_definition)
      else
        metric_definition = nil
      end
      new(
        metric_id: metric_id,
        outputs: outputs,
        metric_label: metric_label,
        metric_definition: metric_definition,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunExecutionMetricResult to a JSON object
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
      obj.metric_id.is_a?(String) != false || raise("Passed value for field obj.metric_id is not the expected type, validation failed.")
      obj.outputs.is_a?(Array) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
      obj.metric_label&.is_a?(String) != false || raise("Passed value for field obj.metric_label is not the expected type, validation failed.")
      obj.metric_definition.nil? || Vellum::TestSuiteRunExecutionMetricDefinition.validate_raw(obj: obj.metric_definition)
    end
  end
end