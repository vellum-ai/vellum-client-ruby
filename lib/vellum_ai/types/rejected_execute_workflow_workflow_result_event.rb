# frozen_string_literal: true
require "date"
require_relative "workflow_event_error"
require "ostruct"
require "json"

module Vellum
# The unsuccessful response from the Workflow execution containing an error
#  specifying what went wrong.
  class RejectedExecuteWorkflowWorkflowResultEvent
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :state
  # @return [DateTime] 
    attr_reader :ts
  # @return [Vellum::WorkflowEventError] 
    attr_reader :error
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param state [String] 
    # @param ts [DateTime] 
    # @param error [Vellum::WorkflowEventError] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::RejectedExecuteWorkflowWorkflowResultEvent]
    def initialize(id:, state:, ts:, error:, additional_properties: nil)
      @id = id
      @state = state
      @ts = ts
      @error = error
      @additional_properties = additional_properties
      @_field_set = { "id": id, "state": state, "ts": ts, "error": error }
    end
# Deserialize a JSON object to an instance of
#  RejectedExecuteWorkflowWorkflowResultEvent
    #
    # @param json_object [String] 
    # @return [Vellum::RejectedExecuteWorkflowWorkflowResultEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      state = parsed_json["state"]
      ts = unless parsed_json["ts"].nil?
  DateTime.parse(parsed_json["ts"])
else
  nil
end
      unless parsed_json["error"].nil?
        error = parsed_json["error"].to_json
        error = Vellum::WorkflowEventError.from_json(json_object: error)
      else
        error = nil
      end
      new(
        id: id,
        state: state,
        ts: ts,
        error: error,
        additional_properties: struct
      )
    end
# Serialize an instance of RejectedExecuteWorkflowWorkflowResultEvent to a JSON
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.state.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.ts.is_a?(DateTime) != false || raise("Passed value for field obj.ts is not the expected type, validation failed.")
      Vellum::WorkflowEventError.validate_raw(obj: obj.error)
    end
  end
end