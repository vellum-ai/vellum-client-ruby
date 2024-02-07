# frozen_string_literal: true

require_relative "workflow_execution_event_error_code"
require "json"

module Vellum
  class WorkflowEventError
    attr_reader :message, :code, :additional_properties

    # @param message [String]
    # @param code [WORKFLOW_EXECUTION_EVENT_ERROR_CODE]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [WorkflowEventError]
    def initialize(message:, code:, additional_properties: nil)
      # @type [String]
      @message = message
      # @type [WORKFLOW_EXECUTION_EVENT_ERROR_CODE]
      @code = code
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of WorkflowEventError
    #
    # @param json_object [JSON]
    # @return [WorkflowEventError]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      message = struct.message
      code = WORKFLOW_EXECUTION_EVENT_ERROR_CODE.key(parsed_json["code"]) || parsed_json["code"]
      new(message: message, code: code, additional_properties: struct)
    end

    # Serialize an instance of WorkflowEventError to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "message": @message, "code": WORKFLOW_EXECUTION_EVENT_ERROR_CODE[@code] || @code }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.code.is_a?(WORKFLOW_EXECUTION_EVENT_ERROR_CODE) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
    end
  end
end
