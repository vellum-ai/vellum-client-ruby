# frozen_string_literal: true
require_relative "prompt_block_state"
require_relative "ephemeral_prompt_cache_config"
require "ostruct"
require "json"

module Vellum
# A block that represents an audio file in a prompt template.
  class AudioPromptBlock
  # @return [String] 
    attr_reader :block_type
  # @return [Vellum::PromptBlockState] 
    attr_reader :state
  # @return [Vellum::EphemeralPromptCacheConfig] 
    attr_reader :cache_config
  # @return [String] 
    attr_reader :src
  # @return [Hash{String => Object}] 
    attr_reader :metadata
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param block_type [String] 
    # @param state [Vellum::PromptBlockState] 
    # @param cache_config [Vellum::EphemeralPromptCacheConfig] 
    # @param src [String] 
    # @param metadata [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::AudioPromptBlock]
    def initialize(block_type:, state: OMIT, cache_config: OMIT, src:, metadata: OMIT, additional_properties: nil)
      @block_type = block_type
      @state = state if state != OMIT
      @cache_config = cache_config if cache_config != OMIT
      @src = src
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "block_type": block_type, "state": state, "cache_config": cache_config, "src": src, "metadata": metadata }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AudioPromptBlock
    #
    # @param json_object [String] 
    # @return [Vellum::AudioPromptBlock]
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
      src = parsed_json["src"]
      metadata = parsed_json["metadata"]
      new(
        block_type: block_type,
        state: state,
        cache_config: cache_config,
        src: src,
        metadata: metadata,
        additional_properties: struct
      )
    end
# Serialize an instance of AudioPromptBlock to a JSON object
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
      obj.src.is_a?(String) != false || raise("Passed value for field obj.src is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end