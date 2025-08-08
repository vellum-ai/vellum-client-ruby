# frozen_string_literal: true
require "json"
require_relative "string_chat_message_content_request"
require_relative "function_call_chat_message_content_request"
require_relative "array_chat_message_content_request"
require_relative "audio_chat_message_content_request"
require_relative "video_chat_message_content_request"
require_relative "image_chat_message_content_request"
require_relative "document_chat_message_content_request"

module Vellum
  class ChatMessageContentRequest


# Deserialize a JSON object to an instance of ChatMessageContentRequest
    #
    # @param json_object [String] 
    # @return [Vellum::ChatMessageContentRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::StringChatMessageContentRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::StringChatMessageContentRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FunctionCallChatMessageContentRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FunctionCallChatMessageContentRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ArrayChatMessageContentRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ArrayChatMessageContentRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::AudioChatMessageContentRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::AudioChatMessageContentRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::VideoChatMessageContentRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::VideoChatMessageContentRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ImageChatMessageContentRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ImageChatMessageContentRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::DocumentChatMessageContentRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::DocumentChatMessageContentRequest.from_json(json_object: struct)
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
        return Vellum::StringChatMessageContentRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FunctionCallChatMessageContentRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ArrayChatMessageContentRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::AudioChatMessageContentRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::VideoChatMessageContentRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ImageChatMessageContentRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::DocumentChatMessageContentRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end