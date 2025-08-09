# frozen_string_literal: true
require_relative "vellum_node_execution_event"
require_relative "node_execution_span_attributes"
require_relative "workflow_execution_usage_calculation_fulfilled_body"
require "date"
require "date"
require "ostruct"
require "json"

module Vellum
  class NodeExecutionSpan
  # @return [String] 
    attr_reader :name
  # @return [Array<Vellum::VellumNodeExecutionEvent>] 
    attr_reader :events
  # @return [Vellum::NodeExecutionSpanAttributes] 
    attr_reader :attributes
  # @return [Vellum::WorkflowExecutionUsageCalculationFulfilledBody] 
    attr_reader :usage_result
  # @return [String] 
    attr_reader :span_id
  # @return [DateTime] 
    attr_reader :start_ts
  # @return [DateTime] 
    attr_reader :end_ts
  # @return [String] 
    attr_reader :parent_span_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] 
    # @param events [Array<Vellum::VellumNodeExecutionEvent>] 
    # @param attributes [Vellum::NodeExecutionSpanAttributes] 
    # @param usage_result [Vellum::WorkflowExecutionUsageCalculationFulfilledBody] 
    # @param span_id [String] 
    # @param start_ts [DateTime] 
    # @param end_ts [DateTime] 
    # @param parent_span_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::NodeExecutionSpan]
    def initialize(name:, events:, attributes:, usage_result: OMIT, span_id:, start_ts:, end_ts:, parent_span_id: OMIT, additional_properties: nil)
      @name = name
      @events = events
      @attributes = attributes
      @usage_result = usage_result if usage_result != OMIT
      @span_id = span_id
      @start_ts = start_ts
      @end_ts = end_ts
      @parent_span_id = parent_span_id if parent_span_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "name": name, "events": events, "attributes": attributes, "usage_result": usage_result, "span_id": span_id, "start_ts": start_ts, "end_ts": end_ts, "parent_span_id": parent_span_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of NodeExecutionSpan
    #
    # @param json_object [String] 
    # @return [Vellum::NodeExecutionSpan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      events = parsed_json["events"]&.map do | item |
  item = item.to_json
  Vellum::VellumNodeExecutionEvent.from_json(json_object: item)
end
      unless parsed_json["attributes"].nil?
        attributes = parsed_json["attributes"].to_json
        attributes = Vellum::NodeExecutionSpanAttributes.from_json(json_object: attributes)
      else
        attributes = nil
      end
      unless parsed_json["usage_result"].nil?
        usage_result = parsed_json["usage_result"].to_json
        usage_result = Vellum::WorkflowExecutionUsageCalculationFulfilledBody.from_json(json_object: usage_result)
      else
        usage_result = nil
      end
      span_id = parsed_json["span_id"]
      start_ts = unless parsed_json["start_ts"].nil?
  DateTime.parse(parsed_json["start_ts"])
else
  nil
end
      end_ts = unless parsed_json["end_ts"].nil?
  DateTime.parse(parsed_json["end_ts"])
else
  nil
end
      parent_span_id = parsed_json["parent_span_id"]
      new(
        name: name,
        events: events,
        attributes: attributes,
        usage_result: usage_result,
        span_id: span_id,
        start_ts: start_ts,
        end_ts: end_ts,
        parent_span_id: parent_span_id,
        additional_properties: struct
      )
    end
# Serialize an instance of NodeExecutionSpan to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.events.is_a?(Array) != false || raise("Passed value for field obj.events is not the expected type, validation failed.")
      Vellum::NodeExecutionSpanAttributes.validate_raw(obj: obj.attributes)
      obj.usage_result.nil? || Vellum::WorkflowExecutionUsageCalculationFulfilledBody.validate_raw(obj: obj.usage_result)
      obj.span_id.is_a?(String) != false || raise("Passed value for field obj.span_id is not the expected type, validation failed.")
      obj.start_ts.is_a?(DateTime) != false || raise("Passed value for field obj.start_ts is not the expected type, validation failed.")
      obj.end_ts.is_a?(DateTime) != false || raise("Passed value for field obj.end_ts is not the expected type, validation failed.")
      obj.parent_span_id&.is_a?(String) != false || raise("Passed value for field obj.parent_span_id is not the expected type, validation failed.")
    end
  end
end