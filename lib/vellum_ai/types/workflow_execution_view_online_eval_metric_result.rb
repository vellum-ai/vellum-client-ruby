# frozen_string_literal: true
require_relative "execution_vellum_value"
require "ostruct"
require "json"

module Vellum
  class WorkflowExecutionViewOnlineEvalMetricResult
  # @return [Array<Vellum::ExecutionVellumValue>] 
    attr_reader :outputs
  # @return [String] 
    attr_reader :label
  # @return [String] 
    attr_reader :metric_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param outputs [Array<Vellum::ExecutionVellumValue>] 
    # @param label [String] 
    # @param metric_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowExecutionViewOnlineEvalMetricResult]
    def initialize(outputs:, label:, metric_id:, additional_properties: nil)
      @outputs = outputs
      @label = label
      @metric_id = metric_id
      @additional_properties = additional_properties
      @_field_set = { "outputs": outputs, "label": label, "metric_id": metric_id }
    end
# Deserialize a JSON object to an instance of
#  WorkflowExecutionViewOnlineEvalMetricResult
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowExecutionViewOnlineEvalMetricResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      outputs = parsed_json["outputs"]&.map do | item |
  item = item.to_json
  Vellum::ExecutionVellumValue.from_json(json_object: item)
end
      label = parsed_json["label"]
      metric_id = parsed_json["metric_id"]
      new(
        outputs: outputs,
        label: label,
        metric_id: metric_id,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowExecutionViewOnlineEvalMetricResult to a JSON
#  object
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
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.metric_id.is_a?(String) != false || raise("Passed value for field obj.metric_id is not the expected type, validation failed.")
    end
  end
end