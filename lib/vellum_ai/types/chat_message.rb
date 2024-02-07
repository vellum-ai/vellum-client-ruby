# frozen_string_literal: true

require_relative "chat_message_role"
require_relative "chat_message_content"
require "json"

module Vellum
  class ChatMessage
    attr_reader :text, :role, :content, :additional_properties

    # @param text [String]
    # @param role [CHAT_MESSAGE_ROLE]
    # @param content [ChatMessageContent]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ChatMessage]
    def initialize(role:, text: nil, content: nil, additional_properties: nil)
      # @type [String]
      @text = text
      # @type [CHAT_MESSAGE_ROLE]
      @role = role
      # @type [ChatMessageContent]
      @content = content
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of ChatMessage
    #
    # @param json_object [JSON]
    # @return [ChatMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      text = struct.text
      role = CHAT_MESSAGE_ROLE.key(parsed_json["role"]) || parsed_json["role"]
      if parsed_json["content"].nil?
        content = nil
      else
        content = parsed_json["content"].to_json
        content = ChatMessageContent.from_json(json_object: content)
      end
      new(text: text, role: role, content: content, additional_properties: struct)
    end

    # Serialize an instance of ChatMessage to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "text": @text, "role": CHAT_MESSAGE_ROLE[@role] || @role, "content": @content }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.role.is_a?(CHAT_MESSAGE_ROLE) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.content.nil? || ChatMessageContent.validate_raw(obj: obj.content)
    end
  end
end
