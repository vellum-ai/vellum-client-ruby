# frozen_string_literal: true

require "date"
require_relative "workflow_event_error"
require "json"

module Vellum
  # The unsuccessful response from the Workflow execution containing an error specifying what went wrong.
  class RejectedExecuteWorkflowWorkflowResultEvent
    attr_reader :id, :ts, :error, :additional_properties

    # @param id [String]
    # @param ts [DateTime]
    # @param error [WorkflowEventError]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RejectedExecuteWorkflowWorkflowResultEvent]
    def initialize(id:, ts:, error:, additional_properties: nil)
      # @type [String]
      @id = id
      # @type [DateTime]
      @ts = ts
      # @type [WorkflowEventError]
      @error = error
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of RejectedExecuteWorkflowWorkflowResultEvent
    #
    # @param json_object [JSON]
    # @return [RejectedExecuteWorkflowWorkflowResultEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      ts = DateTime.parse(parsed_json["ts"])
      if parsed_json["error"].nil?
        error = nil
      else
        error = parsed_json["error"].to_json
        error = WorkflowEventError.from_json(json_object: error)
      end
      new(id: id, ts: ts, error: error, additional_properties: struct)
    end

    # Serialize an instance of RejectedExecuteWorkflowWorkflowResultEvent to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "id": @id, "ts": @ts, "error": @error }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.ts.is_a?(DateTime) != false || raise("Passed value for field obj.ts is not the expected type, validation failed.")
      WorkflowEventError.validate_raw(obj: obj.error)
    end
  end
end
