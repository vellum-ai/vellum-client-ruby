# frozen_string_literal: true
require "json"
require_relative "jinja_prompt_block"
require_relative "chat_message_prompt_block"
require_relative "variable_prompt_block"
require_relative "rich_text_prompt_block"
require_relative "function_call_prompt_block"
require_relative "audio_prompt_block"
require_relative "video_prompt_block"
require_relative "image_prompt_block"
require_relative "document_prompt_block"

module Vellum
  class PromptBlock
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::PromptBlock]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of PromptBlock
    #
    # @param json_object [String] 
    # @return [Vellum::PromptBlock]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.block_type
      when "JINJA"
        member = Vellum::JinjaPromptBlock.from_json(json_object: json_object)
      when "CHAT_MESSAGE"
        member = Vellum::ChatMessagePromptBlock.from_json(json_object: json_object)
      when "VARIABLE"
        member = Vellum::VariablePromptBlock.from_json(json_object: json_object)
      when "RICH_TEXT"
        member = Vellum::RichTextPromptBlock.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::FunctionCallPromptBlock.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::AudioPromptBlock.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::VideoPromptBlock.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::ImagePromptBlock.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::DocumentPromptBlock.from_json(json_object: json_object)
      else
        member = Vellum::JinjaPromptBlock.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.block_type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "JINJA"
        { **@member.to_json, block_type: @discriminant }.to_json
      when "CHAT_MESSAGE"
        { **@member.to_json, block_type: @discriminant }.to_json
      when "VARIABLE"
        { **@member.to_json, block_type: @discriminant }.to_json
      when "RICH_TEXT"
        { **@member.to_json, block_type: @discriminant }.to_json
      when "FUNCTION_CALL"
        { **@member.to_json, block_type: @discriminant }.to_json
      when "AUDIO"
        { **@member.to_json, block_type: @discriminant }.to_json
      when "VIDEO"
        { **@member.to_json, block_type: @discriminant }.to_json
      when "IMAGE"
        { **@member.to_json, block_type: @discriminant }.to_json
      when "DOCUMENT"
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
      when "JINJA"
        Vellum::JinjaPromptBlock.validate_raw(obj: obj)
      when "CHAT_MESSAGE"
        Vellum::ChatMessagePromptBlock.validate_raw(obj: obj)
      when "VARIABLE"
        Vellum::VariablePromptBlock.validate_raw(obj: obj)
      when "RICH_TEXT"
        Vellum::RichTextPromptBlock.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::FunctionCallPromptBlock.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::AudioPromptBlock.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::VideoPromptBlock.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::ImagePromptBlock.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::DocumentPromptBlock.validate_raw(obj: obj)
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
    # @param member [Vellum::JinjaPromptBlock] 
    # @return [Vellum::PromptBlock]
    def self.jinja(member:)
      new(member: member, discriminant: "JINJA")
    end
    # @param member [Vellum::ChatMessagePromptBlock] 
    # @return [Vellum::PromptBlock]
    def self.chat_message(member:)
      new(member: member, discriminant: "CHAT_MESSAGE")
    end
    # @param member [Vellum::VariablePromptBlock] 
    # @return [Vellum::PromptBlock]
    def self.variable(member:)
      new(member: member, discriminant: "VARIABLE")
    end
    # @param member [Vellum::RichTextPromptBlock] 
    # @return [Vellum::PromptBlock]
    def self.rich_text(member:)
      new(member: member, discriminant: "RICH_TEXT")
    end
    # @param member [Vellum::FunctionCallPromptBlock] 
    # @return [Vellum::PromptBlock]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::AudioPromptBlock] 
    # @return [Vellum::PromptBlock]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::VideoPromptBlock] 
    # @return [Vellum::PromptBlock]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::ImagePromptBlock] 
    # @return [Vellum::PromptBlock]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::DocumentPromptBlock] 
    # @return [Vellum::PromptBlock]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end