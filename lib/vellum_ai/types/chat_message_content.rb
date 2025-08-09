# frozen_string_literal: true
require "json"
require_relative "string_chat_message_content"
require_relative "function_call_chat_message_content"
require_relative "array_chat_message_content"
require_relative "audio_chat_message_content"
require_relative "video_chat_message_content"
require_relative "image_chat_message_content"
require_relative "document_chat_message_content"

module Vellum
  class ChatMessageContent


# Deserialize a JSON object to an instance of ChatMessageContent
    #
    # @param json_object [String] 
    # @return [Vellum::ChatMessageContent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::StringChatMessageContent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::StringChatMessageContent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FunctionCallChatMessageContent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FunctionCallChatMessageContent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ArrayChatMessageContent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ArrayChatMessageContent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::AudioChatMessageContent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::AudioChatMessageContent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::VideoChatMessageContent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::VideoChatMessageContent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ImageChatMessageContent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ImageChatMessageContent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::DocumentChatMessageContent.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::DocumentChatMessageContent.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Vellum::StringChatMessageContent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FunctionCallChatMessageContent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ArrayChatMessageContent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::AudioChatMessageContent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::VideoChatMessageContent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ImageChatMessageContent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::DocumentChatMessageContent.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end