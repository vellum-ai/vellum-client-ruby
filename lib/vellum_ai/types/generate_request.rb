# frozen_string_literal: true

require_relative "chat_message_request"
require "json"

module Vellum
  class GenerateRequest
    attr_reader :input_values, :chat_history, :external_ids, :additional_properties

    # @param input_values [Hash{String => String}] Key/value pairs for each template variable defined in the deployment's prompt.
    # @param chat_history [Array<ChatMessageRequest>] Optionally provide a list of chat messages that'll be used in place of the special {$chat_history} variable, if included in the prompt.
    # @param external_ids [Array<String>] Optionally include a unique identifier for each generation, as represented outside of Vellum. Note that this should generally be a list of length one.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [GenerateRequest]
    def initialize(input_values:, chat_history: nil, external_ids: nil, additional_properties: nil)
      # @type [Hash{String => String}] Key/value pairs for each template variable defined in the deployment's prompt.
      @input_values = input_values
      # @type [Array<ChatMessageRequest>] Optionally provide a list of chat messages that'll be used in place of the special {$chat_history} variable, if included in the prompt.
      @chat_history = chat_history
      # @type [Array<String>] Optionally include a unique identifier for each generation, as represented outside of Vellum. Note that this should generally be a list of length one.
      @external_ids = external_ids
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of GenerateRequest
    #
    # @param json_object [JSON]
    # @return [GenerateRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      input_values = struct.input_values
      chat_history = parsed_json["chat_history"].map do |v|
        v = v.to_json
        ChatMessageRequest.from_json(json_object: v)
      end
      external_ids = struct.external_ids
      new(input_values: input_values, chat_history: chat_history, external_ids: external_ids,
          additional_properties: struct)
    end

    # Serialize an instance of GenerateRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "input_values": @input_values, "chat_history": @chat_history, "external_ids": @external_ids }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
