# frozen_string_literal: true
require_relative "workflow_event_error_raw_data"
require_relative "workflow_execution_event_error_code"
require "ostruct"
require "json"

module Vellum
  class WorkflowEventError
  # @return [String] 
    attr_reader :message
  # @return [Vellum::WorkflowEventErrorRawData] 
    attr_reader :raw_data
  # @return [Vellum::WorkflowExecutionEventErrorCode] 
    attr_reader :code
  # @return [String] 
    attr_reader :stacktrace
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [String] 
    # @param raw_data [Vellum::WorkflowEventErrorRawData] 
    # @param code [Vellum::WorkflowExecutionEventErrorCode] 
    # @param stacktrace [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowEventError]
    def initialize(message:, raw_data: OMIT, code:, stacktrace: OMIT, additional_properties: nil)
      @message = message
      @raw_data = raw_data if raw_data != OMIT
      @code = code
      @stacktrace = stacktrace if stacktrace != OMIT
      @additional_properties = additional_properties
      @_field_set = { "message": message, "raw_data": raw_data, "code": code, "stacktrace": stacktrace }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowEventError
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowEventError]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      message = parsed_json["message"]
      unless parsed_json["raw_data"].nil?
        raw_data = parsed_json["raw_data"].to_json
        raw_data = Vellum::WorkflowEventErrorRawData.from_json(json_object: raw_data)
      else
        raw_data = nil
      end
      code = parsed_json["code"]
      stacktrace = parsed_json["stacktrace"]
      new(
        message: message,
        raw_data: raw_data,
        code: code,
        stacktrace: stacktrace,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowEventError to a JSON object
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
      obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.raw_data.nil? || Vellum::WorkflowEventErrorRawData.validate_raw(obj: obj.raw_data)
      obj.code.is_a?(Vellum::WorkflowExecutionEventErrorCode) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
      obj.stacktrace&.is_a?(String) != false || raise("Passed value for field obj.stacktrace is not the expected type, validation failed.")
    end
  end
end