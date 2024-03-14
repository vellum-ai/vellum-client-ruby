# frozen_string_literal: true

require_relative "chat_message_role"
require_relative "chat_message_content_request"
require "json"

module Vellum
  class ChatMessageRequest
    attr_reader :text, :role, :content, :source, :additional_properties

    # @param text [String]
    # @param role [CHAT_MESSAGE_ROLE]
    # @param content [ChatMessageContentRequest]
    # @param source [String] An optional identifier representing who or what generated this message.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChatMessageRequest]
    def initialize(role:, text: nil, content: nil, source: nil, additional_properties: nil)
      # @type [String]
      @text = text
      # @type [CHAT_MESSAGE_ROLE]
      @role = role
      # @type [ChatMessageContentRequest]
      @content = content
      # @type [String] An optional identifier representing who or what generated this message.
      @source = source
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of ChatMessageRequest
    #
    # @param json_object [JSON]
    # @return [ChatMessageRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      text = struct.text
      role = CHAT_MESSAGE_ROLE.key(parsed_json["role"]) || parsed_json["role"]
      if parsed_json["content"].nil?
        content = nil
      else
        content = parsed_json["content"].to_json
        content = ChatMessageContentRequest.from_json(json_object: content)
      end
      source = struct.source
      new(text: text, role: role, content: content, source: source, additional_properties: struct)
    end

    # Serialize an instance of ChatMessageRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "text": @text, "role": CHAT_MESSAGE_ROLE[@role] || @role, "content": @content, "source": @source }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.role.is_a?(CHAT_MESSAGE_ROLE) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.content.nil? || ChatMessageContentRequest.validate_raw(obj: obj.content)
      obj.source&.is_a?(String) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
    end
  end
end
