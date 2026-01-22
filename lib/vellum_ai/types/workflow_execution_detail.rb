# frozen_string_literal: true
require_relative "parent_context"
require "date"
require "date"
require_relative "execution_vellum_value"
require_relative "workflow_error"
require_relative "workflow_execution_usage_result"
require_relative "vellum_span"
require "ostruct"
require "json"

module Vellum
  class WorkflowExecutionDetail
  # @return [String] 
    attr_reader :span_id
  # @return [Vellum::ParentContext] 
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
  # @return [Array<Vellum::WorkflowExecutionUsageResult>] 
    attr_reader :usage_results
  # @return [Array<Vellum::VellumSpan>] 
    attr_reader :spans
  # @return [Hash{String => Object}] 
    attr_reader :state
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param span_id [String] 
    # @param parent_context [Vellum::ParentContext] 
    # @param start [DateTime] 
    # @param end_ [DateTime] 
    # @param inputs [Array<Vellum::ExecutionVellumValue>] 
    # @param outputs [Array<Vellum::ExecutionVellumValue>] 
    # @param error [Vellum::WorkflowError] 
    # @param usage_results [Array<Vellum::WorkflowExecutionUsageResult>] 
    # @param spans [Array<Vellum::VellumSpan>] 
    # @param state [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowExecutionDetail]
    def initialize(span_id:, parent_context: OMIT, start: OMIT, end_: OMIT, inputs:, outputs:, error: OMIT, usage_results: OMIT, spans:, state: OMIT, additional_properties: nil)
      @span_id = span_id
      @parent_context = parent_context if parent_context != OMIT
      @start = start if start != OMIT
      @end_ = end_ if end_ != OMIT
      @inputs = inputs
      @outputs = outputs
      @error = error if error != OMIT
      @usage_results = usage_results if usage_results != OMIT
      @spans = spans
      @state = state if state != OMIT
      @additional_properties = additional_properties
      @_field_set = { "span_id": span_id, "parent_context": parent_context, "start": start, "end": end_, "inputs": inputs, "outputs": outputs, "error": error, "usage_results": usage_results, "spans": spans, "state": state }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowExecutionDetail
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowExecutionDetail]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      span_id = parsed_json["span_id"]
      unless parsed_json["parent_context"].nil?
        parent_context = parsed_json["parent_context"].to_json
        parent_context = Vellum::ParentContext.from_json(json_object: parent_context)
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
      usage_results = parsed_json["usage_results"]&.map do | item |
  item = item.to_json
  Vellum::WorkflowExecutionUsageResult.from_json(json_object: item)
end
      spans = parsed_json["spans"]&.map do | item |
  item = item.to_json
  Vellum::VellumSpan.from_json(json_object: item)
end
      state = parsed_json["state"]
      new(
        span_id: span_id,
        parent_context: parent_context,
        start: start,
        end_: end_,
        inputs: inputs,
        outputs: outputs,
        error: error,
        usage_results: usage_results,
        spans: spans,
        state: state,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowExecutionDetail to a JSON object
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
      obj.parent_context.nil? || Vellum::ParentContext.validate_raw(obj: obj.parent_context)
      obj.start&.is_a?(DateTime) != false || raise("Passed value for field obj.start is not the expected type, validation failed.")
      obj.end_&.is_a?(DateTime) != false || raise("Passed value for field obj.end_ is not the expected type, validation failed.")
      obj.inputs.is_a?(Array) != false || raise("Passed value for field obj.inputs is not the expected type, validation failed.")
      obj.outputs.is_a?(Array) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
      obj.error.nil? || Vellum::WorkflowError.validate_raw(obj: obj.error)
      obj.usage_results&.is_a?(Array) != false || raise("Passed value for field obj.usage_results is not the expected type, validation failed.")
      obj.spans.is_a?(Array) != false || raise("Passed value for field obj.spans is not the expected type, validation failed.")
      obj.state&.is_a?(Hash) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
    end
  end
end