# frozen_string_literal: true

require_relative "chat_message_request"
require "json"

module Vellum
  class WorkflowRequestChatHistoryInputRequest
    attr_reader :name, :value, :additional_properties

    # @param name [String] The variable's name, as defined in the Workflow.
    # @param value [Array<ChatMessageRequest>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [WorkflowRequestChatHistoryInputRequest]
    def initialize(name:, value:, additional_properties: nil)
      # @type [String] The variable's name, as defined in the Workflow.
      @name = name
      # @type [Array<ChatMessageRequest>]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of WorkflowRequestChatHistoryInputRequest
    #
    # @param json_object [JSON]
    # @return [WorkflowRequestChatHistoryInputRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = struct.name
      value = parsed_json["value"].map do |v|
        v = v.to_json
        ChatMessageRequest.from_json(json_object: v)
      end
      new(name: name, value: value, additional_properties: struct)
    end

    # Serialize an instance of WorkflowRequestChatHistoryInputRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "name": @name, "value": @value }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.value.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
