# frozen_string_literal: true
require "json"
require_relative "jinja_prompt_block"
require_relative "chat_message_prompt_block"
require_relative "variable_prompt_block"
require_relative "rich_text_prompt_block"
require_relative "audio_prompt_block"
require_relative "function_call_prompt_block"
require_relative "image_prompt_block"
require_relative "document_prompt_block"

module Vellum
  class PromptBlock


# Deserialize a JSON object to an instance of PromptBlock
    #
    # @param json_object [String] 
    # @return [Vellum::PromptBlock]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::JinjaPromptBlock.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::JinjaPromptBlock.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ChatMessagePromptBlock.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ChatMessagePromptBlock.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::VariablePromptBlock.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::VariablePromptBlock.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::RichTextPromptBlock.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::RichTextPromptBlock.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::AudioPromptBlock.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::AudioPromptBlock.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FunctionCallPromptBlock.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FunctionCallPromptBlock.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ImagePromptBlock.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ImagePromptBlock.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::DocumentPromptBlock.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::DocumentPromptBlock.from_json(json_object: struct)
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
        return Vellum::JinjaPromptBlock.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ChatMessagePromptBlock.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::VariablePromptBlock.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::RichTextPromptBlock.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::AudioPromptBlock.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FunctionCallPromptBlock.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ImagePromptBlock.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::DocumentPromptBlock.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end