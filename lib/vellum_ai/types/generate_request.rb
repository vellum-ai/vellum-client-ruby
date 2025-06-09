# frozen_string_literal: true
require_relative "chat_message_request"
require "ostruct"
require "json"

module Vellum
  class GenerateRequest
  # @return [Hash{String => Object}] Key/value pairs for each template variable defined in the deployment's prompt.
    attr_reader :input_values
  # @return [Array<Vellum::ChatMessageRequest>] Optionally provide a list of chat messages that'll be used in place of the
#  special chat_history variable, if included in the prompt.
    attr_reader :chat_history
  # @return [Array<String>] Optionally include a unique identifier for each generation, as represented
#  outside of Vellum. Note that this should generally be a list of length one.
    attr_reader :external_ids
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param input_values [Hash{String => Object}] Key/value pairs for each template variable defined in the deployment's prompt.
    # @param chat_history [Array<Vellum::ChatMessageRequest>] Optionally provide a list of chat messages that'll be used in place of the
#  special chat_history variable, if included in the prompt.
    # @param external_ids [Array<String>] Optionally include a unique identifier for each generation, as represented
#  outside of Vellum. Note that this should generally be a list of length one.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::GenerateRequest]
    def initialize(input_values:, chat_history: OMIT, external_ids: OMIT, additional_properties: nil)
      @input_values = input_values
      @chat_history = chat_history if chat_history != OMIT
      @external_ids = external_ids if external_ids != OMIT
      @additional_properties = additional_properties
      @_field_set = { "input_values": input_values, "chat_history": chat_history, "external_ids": external_ids }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GenerateRequest
    #
    # @param json_object [String] 
    # @return [Vellum::GenerateRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      input_values = parsed_json["input_values"]
      chat_history = parsed_json["chat_history"]&.map do | item |
  item = item.to_json
  Vellum::ChatMessageRequest.from_json(json_object: item)
end
      external_ids = parsed_json["external_ids"]
      new(
        input_values: input_values,
        chat_history: chat_history,
        external_ids: external_ids,
        additional_properties: struct
      )
    end
# Serialize an instance of GenerateRequest to a JSON object
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
      obj.input_values.is_a?(Hash) != false || raise("Passed value for field obj.input_values is not the expected type, validation failed.")
      obj.chat_history&.is_a?(Array) != false || raise("Passed value for field obj.chat_history is not the expected type, validation failed.")
      obj.external_ids&.is_a?(Array) != false || raise("Passed value for field obj.external_ids is not the expected type, validation failed.")
    end
  end
end