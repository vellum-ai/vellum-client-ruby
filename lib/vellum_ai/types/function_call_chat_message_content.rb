# frozen_string_literal: true
require_relative "function_call_chat_message_content_value"
require "ostruct"
require "json"

module Vellum
# A function call value that is used in a chat message.
  class FunctionCallChatMessageContent
  # @return [Vellum::FunctionCallChatMessageContentValue] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param value [Vellum::FunctionCallChatMessageContentValue] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::FunctionCallChatMessageContent]
    def initialize(value:, additional_properties: nil)
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "value": value }
    end
# Deserialize a JSON object to an instance of FunctionCallChatMessageContent
    #
    # @param json_object [String] 
    # @return [Vellum::FunctionCallChatMessageContent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::FunctionCallChatMessageContentValue.from_json(json_object: value)
      else
        value = nil
      end
      new(value: value, additional_properties: struct)
    end
# Serialize an instance of FunctionCallChatMessageContent to a JSON object
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
      Vellum::FunctionCallChatMessageContentValue.validate_raw(obj: obj.value)
    end
  end
end