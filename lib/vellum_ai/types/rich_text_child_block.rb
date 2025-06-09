# frozen_string_literal: true
require "json"
require_relative "variable_prompt_block"
require_relative "plain_text_prompt_block"

module Vellum
  class RichTextChildBlock


# Deserialize a JSON object to an instance of RichTextChildBlock
    #
    # @param json_object [String] 
    # @return [Vellum::RichTextChildBlock]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
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
        Vellum::PlainTextPromptBlock.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::PlainTextPromptBlock.from_json(json_object: struct)
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
        return Vellum::VariablePromptBlock.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::PlainTextPromptBlock.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end