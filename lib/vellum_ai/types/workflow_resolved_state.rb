# frozen_string_literal: true
require "date"
require "ostruct"
require "json"

module Vellum
# The latest execution state of a given Workflow Execution
  class WorkflowResolvedState
  # @return [String] 
    attr_reader :trace_id
  # @return [DateTime] 
    attr_reader :timestamp
  # @return [String] 
    attr_reader :span_id
  # @return [Hash{String => Object}] 
    attr_reader :state
  # @return [String] 
    attr_reader :previous_span_id
  # @return [String] 
    attr_reader :previous_trace_id
  # @return [String] 
    attr_reader :root_span_id
  # @return [String] 
    attr_reader :root_trace_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param trace_id [String] 
    # @param timestamp [DateTime] 
    # @param span_id [String] 
    # @param state [Hash{String => Object}] 
    # @param previous_span_id [String] 
    # @param previous_trace_id [String] 
    # @param root_span_id [String] 
    # @param root_trace_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowResolvedState]
    def initialize(trace_id:, timestamp:, span_id:, state:, previous_span_id: OMIT, previous_trace_id: OMIT, root_span_id: OMIT, root_trace_id: OMIT, additional_properties: nil)
      @trace_id = trace_id
      @timestamp = timestamp
      @span_id = span_id
      @state = state
      @previous_span_id = previous_span_id if previous_span_id != OMIT
      @previous_trace_id = previous_trace_id if previous_trace_id != OMIT
      @root_span_id = root_span_id if root_span_id != OMIT
      @root_trace_id = root_trace_id if root_trace_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "trace_id": trace_id, "timestamp": timestamp, "span_id": span_id, "state": state, "previous_span_id": previous_span_id, "previous_trace_id": previous_trace_id, "root_span_id": root_span_id, "root_trace_id": root_trace_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowResolvedState
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowResolvedState]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      trace_id = parsed_json["trace_id"]
      timestamp = unless parsed_json["timestamp"].nil?
  DateTime.parse(parsed_json["timestamp"])
else
  nil
end
      span_id = parsed_json["span_id"]
      state = parsed_json["state"]
      previous_span_id = parsed_json["previous_span_id"]
      previous_trace_id = parsed_json["previous_trace_id"]
      root_span_id = parsed_json["root_span_id"]
      root_trace_id = parsed_json["root_trace_id"]
      new(
        trace_id: trace_id,
        timestamp: timestamp,
        span_id: span_id,
        state: state,
        previous_span_id: previous_span_id,
        previous_trace_id: previous_trace_id,
        root_span_id: root_span_id,
        root_trace_id: root_trace_id,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowResolvedState to a JSON object
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
      obj.trace_id.is_a?(String) != false || raise("Passed value for field obj.trace_id is not the expected type, validation failed.")
      obj.timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.span_id.is_a?(String) != false || raise("Passed value for field obj.span_id is not the expected type, validation failed.")
      obj.state.is_a?(Hash) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.previous_span_id&.is_a?(String) != false || raise("Passed value for field obj.previous_span_id is not the expected type, validation failed.")
      obj.previous_trace_id&.is_a?(String) != false || raise("Passed value for field obj.previous_trace_id is not the expected type, validation failed.")
      obj.root_span_id&.is_a?(String) != false || raise("Passed value for field obj.root_span_id is not the expected type, validation failed.")
      obj.root_trace_id&.is_a?(String) != false || raise("Passed value for field obj.root_trace_id is not the expected type, validation failed.")
    end
  end
end