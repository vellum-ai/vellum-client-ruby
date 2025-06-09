# frozen_string_literal: true
require_relative "workflow_deployment_parent_context"
require "date"
require "date"
require_relative "execution_vellum_value"
require_relative "workflow_error"
require_relative "workflow_execution_actual"
require_relative "workflow_execution_view_online_eval_metric_result"
require_relative "workflow_execution_usage_result"
require_relative "vellum_span"
require "ostruct"
require "json"

module Vellum
  class WorkflowEventExecutionRead
  # @return [String] 
    attr_reader :span_id
  # @return [Vellum::WorkflowDeploymentParentContext] 
    attr_reader :parent_context
  # @return [DateTime] 
    attr_reader :start
  # @return [DateTime] 
    attr_reader :end_
  # @return [Array<Vellum::ExecutionVellumValue>] 
    attr_reader :inputs
  # @return [Array<Vellum::ExecutionVellumValue>] 
    attr_reader :outputs
  # @return [Vellum::WorkflowError] 
    attr_reader :error
  # @return [Vellum::WorkflowExecutionActual] 
    attr_reader :latest_actual
  # @return [Array<Vellum::WorkflowExecutionViewOnlineEvalMetricResult>] 
    attr_reader :metric_results
  # @return [Array<Vellum::WorkflowExecutionUsageResult>] 
    attr_reader :usage_results
  # @return [Array<Vellum::VellumSpan>] 
    attr_reader :spans
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param span_id [String] 
    # @param parent_context [Vellum::WorkflowDeploymentParentContext] 
    # @param start [DateTime] 
    # @param end_ [DateTime] 
    # @param inputs [Array<Vellum::ExecutionVellumValue>] 
    # @param outputs [Array<Vellum::ExecutionVellumValue>] 
    # @param error [Vellum::WorkflowError] 
    # @param latest_actual [Vellum::WorkflowExecutionActual] 
    # @param metric_results [Array<Vellum::WorkflowExecutionViewOnlineEvalMetricResult>] 
    # @param usage_results [Array<Vellum::WorkflowExecutionUsageResult>] 
    # @param spans [Array<Vellum::VellumSpan>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowEventExecutionRead]
    def initialize(span_id:, parent_context: OMIT, start:, end_: OMIT, inputs:, outputs:, error: OMIT, latest_actual: OMIT, metric_results:, usage_results: OMIT, spans:, additional_properties: nil)
      @span_id = span_id
      @parent_context = parent_context if parent_context != OMIT
      @start = start
      @end_ = end_ if end_ != OMIT
      @inputs = inputs
      @outputs = outputs
      @error = error if error != OMIT
      @latest_actual = latest_actual if latest_actual != OMIT
      @metric_results = metric_results
      @usage_results = usage_results if usage_results != OMIT
      @spans = spans
      @additional_properties = additional_properties
      @_field_set = { "span_id": span_id, "parent_context": parent_context, "start": start, "end": end_, "inputs": inputs, "outputs": outputs, "error": error, "latest_actual": latest_actual, "metric_results": metric_results, "usage_results": usage_results, "spans": spans }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowEventExecutionRead
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowEventExecutionRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      span_id = parsed_json["span_id"]
      unless parsed_json["parent_context"].nil?
        parent_context = parsed_json["parent_context"].to_json
        parent_context = Vellum::WorkflowDeploymentParentContext.from_json(json_object: parent_context)
      else
        parent_context = nil
      end
      start = unless parsed_json["start"].nil?
  DateTime.parse(parsed_json["start"])
else
  nil
end
      end_ = unless parsed_json["end"].nil?
  DateTime.parse(parsed_json["end"])
else
  nil
end
      inputs = parsed_json["inputs"]&.map do | item |
  item = item.to_json
  Vellum::ExecutionVellumValue.from_json(json_object: item)
end
      outputs = parsed_json["outputs"]&.map do | item |
  item = item.to_json
  Vellum::ExecutionVellumValue.from_json(json_object: item)
end
      unless parsed_json["error"].nil?
        error = parsed_json["error"].to_json
        error = Vellum::WorkflowError.from_json(json_object: error)
      else
        error = nil
      end
      unless parsed_json["latest_actual"].nil?
        latest_actual = parsed_json["latest_actual"].to_json
        latest_actual = Vellum::WorkflowExecutionActual.from_json(json_object: latest_actual)
      else
        latest_actual = nil
      end
      metric_results = parsed_json["metric_results"]&.map do | item |
  item = item.to_json
  Vellum::WorkflowExecutionViewOnlineEvalMetricResult.from_json(json_object: item)
end
      usage_results = parsed_json["usage_results"]&.map do | item |
  item = item.to_json
  Vellum::WorkflowExecutionUsageResult.from_json(json_object: item)
end
      spans = parsed_json["spans"]&.map do | item |
  item = item.to_json
  Vellum::VellumSpan.from_json(json_object: item)
end
      new(
        span_id: span_id,
        parent_context: parent_context,
        start: start,
        end_: end_,
        inputs: inputs,
        outputs: outputs,
        error: error,
        latest_actual: latest_actual,
        metric_results: metric_results,
        usage_results: usage_results,
        spans: spans,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowEventExecutionRead to a JSON object
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
      obj.span_id.is_a?(String) != false || raise("Passed value for field obj.span_id is not the expected type, validation failed.")
      obj.parent_context.nil? || Vellum::WorkflowDeploymentParentContext.validate_raw(obj: obj.parent_context)
      obj.start.is_a?(DateTime) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
      obj.end_&.is_a?(DateTime) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
      obj.inputs.is_a?(Array) != false || raise("Passed value for field obj.inputs is not the expected type, validation failed.")
      obj.outputs.is_a?(Array) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
      obj.error.nil? || Vellum::WorkflowError.validate_raw(obj: obj.error)
      obj.latest_actual.nil? || Vellum::WorkflowExecutionActual.validate_raw(obj: obj.latest_actual)
      obj.metric_results.is_a?(Array) != false || raise("Passed value for field obj.metric_results is not the expected type, validation failed.")
      obj.usage_results&.is_a?(Array) != false || raise("Passed value for field obj.usage_results is not the expected type, validation failed.")
      obj.spans.is_a?(Array) != false || raise("Passed value for field obj.spans is not the expected type, validation failed.")
    end
  end
end