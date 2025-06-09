# frozen_string_literal: true
require_relative "prompt_block_state"
require_relative "ephemeral_prompt_cache_config"
require_relative "chat_message_role"
require_relative "prompt_block"
require "ostruct"
require "json"

module Vellum
# A block that represents a chat message in a prompt template.
  class ChatMessagePromptBlock
  # @return [String] 
    attr_reader :block_type
  # @return [Vellum::PromptBlockState] 
    attr_reader :state
  # @return [Vellum::EphemeralPromptCacheConfig] 
    attr_reader :cache_config
  # @return [Vellum::ChatMessageRole] 
    attr_reader :chat_role
  # @return [String] 
    attr_reader :chat_source
  # @return [Boolean] 
    attr_reader :chat_message_unterminated
  # @return [Array<Vellum::PromptBlock>] 
    attr_reader :blocks
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param block_type [String] 
    # @param state [Vellum::PromptBlockState] 
    # @param cache_config [Vellum::EphemeralPromptCacheConfig] 
    # @param chat_role [Vellum::ChatMessageRole] 
    # @param chat_source [String] 
    # @param chat_message_unterminated [Boolean] 
    # @param blocks [Array<Vellum::PromptBlock>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ChatMessagePromptBlock]
    def initialize(block_type:, state: OMIT, cache_config: OMIT, chat_role:, chat_source: OMIT, chat_message_unterminated: OMIT, blocks:, additional_properties: nil)
      @block_type = block_type
      @state = state if state != OMIT
      @cache_config = cache_config if cache_config != OMIT
      @chat_role = chat_role
      @chat_source = chat_source if chat_source != OMIT
      @chat_message_unterminated = chat_message_unterminated if chat_message_unterminated != OMIT
      @blocks = blocks
      @additional_properties = additional_properties
      @_field_set = { "block_type": block_type, "state": state, "cache_config": cache_config, "chat_role": chat_role, "chat_source": chat_source, "chat_message_unterminated": chat_message_unterminated, "blocks": blocks }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ChatMessagePromptBlock
    #
    # @param json_object [String] 
    # @return [Vellum::ChatMessagePromptBlock]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      block_type = parsed_json["block_type"]
      state = parsed_json["state"]
      unless parsed_json["cache_config"].nil?
        cache_config = parsed_json["cache_config"].to_json
        cache_config = Vellum::EphemeralPromptCacheConfig.from_json(json_object: cache_config)
      else
        cache_config = nil
      end
      chat_role = parsed_json["chat_role"]
      chat_source = parsed_json["chat_source"]
      chat_message_unterminated = parsed_json["chat_message_unterminated"]
      blocks = parsed_json["blocks"]&.map do | item |
  item = item.to_json
  Vellum::PromptBlock.from_json(json_object: item)
end
      new(
        block_type: block_type,
        state: state,
        cache_config: cache_config,
        chat_role: chat_role,
        chat_source: chat_source,
        chat_message_unterminated: chat_message_unterminated,
        blocks: blocks,
        additional_properties: struct
      )
    end
# Serialize an instance of ChatMessagePromptBlock to a JSON object
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
      obj.block_type.is_a?(String) != false || raise("Passed value for field obj.block_type is not the expected type, validation failed.")
      obj.state&.is_a?(Vellum::PromptBlockState) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.cache_config.nil? || Vellum::EphemeralPromptCacheConfig.validate_raw(obj: obj.cache_config)
      obj.chat_role.is_a?(Vellum::ChatMessageRole) != false || raise("Passed value for field obj.chat_role is not the expected type, validation failed.")
      obj.chat_source&.is_a?(String) != false || raise("Passed value for field obj.chat_source is not the expected type, validation failed.")
      obj.chat_message_unterminated&.is_a?(Boolean) != false || raise("Passed value for field obj.chat_message_unterminated is not the expected type, validation failed.")
      obj.blocks.is_a?(Array) != false || raise("Passed value for field obj.blocks is not the expected type, validation failed.")
    end
  end
end