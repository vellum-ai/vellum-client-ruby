# frozen_string_literal: true
require "json"
require_relative "variable_prompt_block"
require_relative "plain_text_prompt_block"

module Vellum
  class RichTextChildBlock
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::RichTextChildBlock]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of RichTextChildBlock
    #
    # @param json_object [String] 
    # @return [Vellum::RichTextChildBlock]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.block_type
      when "VARIABLE"
        member = Vellum::VariablePromptBlock.from_json(json_object: json_object)
      when "PLAIN_TEXT"
        member = Vellum::PlainTextPromptBlock.from_json(json_object: json_object)
      else
        member = Vellum::VariablePromptBlock.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.block_type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "VARIABLE"
        { **@member.to_json, block_type: @discriminant }.to_json
      when "PLAIN_TEXT"
        { **@member.to_json, block_type: @discriminant }.to_json
      else
        { "block_type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.block_type
      when "VARIABLE"
        Vellum::VariablePromptBlock.validate_raw(obj: obj)
      when "PLAIN_TEXT"
        Vellum::PlainTextPromptBlock.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
# For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object] 
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end
    # @param member [Vellum::VariablePromptBlock] 
    # @return [Vellum::RichTextChildBlock]
    def self.variable(member:)
      new(member: member, discriminant: "VARIABLE")
    end
    # @param member [Vellum::PlainTextPromptBlock] 
    # @return [Vellum::RichTextChildBlock]
    def self.plain_text(member:)
      new(member: member, discriminant: "PLAIN_TEXT")
    end
  end
end