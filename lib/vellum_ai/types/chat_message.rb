# frozen_string_literal: true
require_relative "chat_message_role"
require_relative "chat_message_content"
require "ostruct"
require "json"

module Vellum
  class ChatMessage
  # @return [String] 
    attr_reader :text
  # @return [Vellum::ChatMessageRole] 
    attr_reader :role
  # @return [Vellum::ChatMessageContent] 
    attr_reader :content
  # @return [String] An optional identifier representing who or what generated this message.
    attr_reader :source
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param text [String] 
    # @param role [Vellum::ChatMessageRole] 
    # @param content [Vellum::ChatMessageContent] 
    # @param source [String] An optional identifier representing who or what generated this message.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ChatMessage]
    def initialize(text: OMIT, role:, content: OMIT, source: OMIT, additional_properties: nil)
      @text = text if text != OMIT
      @role = role
      @content = content if content != OMIT
      @source = source if source != OMIT
      @additional_properties = additional_properties
      @_field_set = { "text": text, "role": role, "content": content, "source": source }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ChatMessage
    #
    # @param json_object [String] 
    # @return [Vellum::ChatMessage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      text = parsed_json["text"]
      role = parsed_json["role"]
      unless parsed_json["content"].nil?
        content = parsed_json["content"].to_json
        content = Vellum::ChatMessageContent.from_json(json_object: content)
      else
        content = nil
      end
      source = parsed_json["source"]
      new(
        text: text,
        role: role,
        content: content,
        source: source,
        additional_properties: struct
      )
    end
# Serialize an instance of ChatMessage to a JSON object
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
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.role.is_a?(Vellum::ChatMessageRole) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
      obj.content.nil? || Vellum::ChatMessageContent.validate_raw(obj: obj.content)
      obj.source&.is_a?(String) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
    end
  end
end