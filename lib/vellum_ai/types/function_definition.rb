# frozen_string_literal: true
require_relative "prompt_block_state"
require_relative "ephemeral_prompt_cache_config"
require "ostruct"
require "json"

module Vellum
# The definition of a Function (aka "Tool Call") that a Prompt/Model has access
#  to.
  class FunctionDefinition
  # @return [Vellum::PromptBlockState] 
    attr_reader :state
  # @return [Vellum::EphemeralPromptCacheConfig] 
    attr_reader :cache_config
  # @return [String] The name identifying the function.
    attr_reader :name
  # @return [String] A description to help guide the model when to invoke this function.
    attr_reader :description
  # @return [Hash{String => Object}] An OpenAPI specification of parameters that are supported by this function.
    attr_reader :parameters
  # @return [Boolean] Set this option to true to force the model to return a function call of this
#  function.
    attr_reader :forced
  # @return [Boolean] Set this option to use strict schema decoding when available.
    attr_reader :strict
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param state [Vellum::PromptBlockState] 
    # @param cache_config [Vellum::EphemeralPromptCacheConfig] 
    # @param name [String] The name identifying the function.
    # @param description [String] A description to help guide the model when to invoke this function.
    # @param parameters [Hash{String => Object}] An OpenAPI specification of parameters that are supported by this function.
    # @param forced [Boolean] Set this option to true to force the model to return a function call of this
#  function.
    # @param strict [Boolean] Set this option to use strict schema decoding when available.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::FunctionDefinition]
    def initialize(state: OMIT, cache_config: OMIT, name: OMIT, description: OMIT, parameters: OMIT, forced: OMIT, strict: OMIT, additional_properties: nil)
      @state = state if state != OMIT
      @cache_config = cache_config if cache_config != OMIT
      @name = name if name != OMIT
      @description = description if description != OMIT
      @parameters = parameters if parameters != OMIT
      @forced = forced if forced != OMIT
      @strict = strict if strict != OMIT
      @additional_properties = additional_properties
      @_field_set = { "state": state, "cache_config": cache_config, "name": name, "description": description, "parameters": parameters, "forced": forced, "strict": strict }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FunctionDefinition
    #
    # @param json_object [String] 
    # @return [Vellum::FunctionDefinition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      state = parsed_json["state"]
      unless parsed_json["cache_config"].nil?
        cache_config = parsed_json["cache_config"].to_json
        cache_config = Vellum::EphemeralPromptCacheConfig.from_json(json_object: cache_config)
      else
        cache_config = nil
      end
      name = parsed_json["name"]
      description = parsed_json["description"]
      parameters = parsed_json["parameters"]
      forced = parsed_json["forced"]
      strict = parsed_json["strict"]
      new(
        state: state,
        cache_config: cache_config,
        name: name,
        description: description,
        parameters: parameters,
        forced: forced,
        strict: strict,
        additional_properties: struct
      )
    end
# Serialize an instance of FunctionDefinition to a JSON object
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
      obj.state&.is_a?(Vellum::PromptBlockState) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      obj.cache_config.nil? || Vellum::EphemeralPromptCacheConfig.validate_raw(obj: obj.cache_config)
      obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.parameters&.is_a?(Hash) != false || raise("Passed value for field obj.parameters is not the expected type, validation failed.")
      obj.forced&.is_a?(Boolean) != false || raise("Passed value for field obj.forced is not the expected type, validation failed.")
      obj.strict&.is_a?(Boolean) != false || raise("Passed value for field obj.strict is not the expected type, validation failed.")
    end
  end
end