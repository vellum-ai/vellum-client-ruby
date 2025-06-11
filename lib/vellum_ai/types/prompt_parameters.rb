# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class PromptParameters
  # @return [Array<String>] 
    attr_reader :stop
  # @return [Float] 
    attr_reader :temperature
  # @return [Integer] 
    attr_reader :max_tokens
  # @return [Float] 
    attr_reader :top_p
  # @return [Integer] 
    attr_reader :top_k
  # @return [Float] 
    attr_reader :frequency_penalty
  # @return [Float] 
    attr_reader :presence_penalty
  # @return [Hash{String => Float}] 
    attr_reader :logit_bias
  # @return [Hash{String => Object}] 
    attr_reader :custom_parameters
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param stop [Array<String>] 
    # @param temperature [Float] 
    # @param max_tokens [Integer] 
    # @param top_p [Float] 
    # @param top_k [Integer] 
    # @param frequency_penalty [Float] 
    # @param presence_penalty [Float] 
    # @param logit_bias [Hash{String => Float}] 
    # @param custom_parameters [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PromptParameters]
    def initialize(stop: OMIT, temperature: OMIT, max_tokens: OMIT, top_p: OMIT, top_k: OMIT, frequency_penalty: OMIT, presence_penalty: OMIT, logit_bias: OMIT, custom_parameters: OMIT, additional_properties: nil)
      @stop = stop if stop != OMIT
      @temperature = temperature if temperature != OMIT
      @max_tokens = max_tokens if max_tokens != OMIT
      @top_p = top_p if top_p != OMIT
      @top_k = top_k if top_k != OMIT
      @frequency_penalty = frequency_penalty if frequency_penalty != OMIT
      @presence_penalty = presence_penalty if presence_penalty != OMIT
      @logit_bias = logit_bias if logit_bias != OMIT
      @custom_parameters = custom_parameters if custom_parameters != OMIT
      @additional_properties = additional_properties
      @_field_set = { "stop": stop, "temperature": temperature, "max_tokens": max_tokens, "top_p": top_p, "top_k": top_k, "frequency_penalty": frequency_penalty, "presence_penalty": presence_penalty, "logit_bias": logit_bias, "custom_parameters": custom_parameters }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PromptParameters
    #
    # @param json_object [String] 
    # @return [Vellum::PromptParameters]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      stop = parsed_json["stop"]
      temperature = parsed_json["temperature"]
      max_tokens = parsed_json["max_tokens"]
      top_p = parsed_json["top_p"]
      top_k = parsed_json["top_k"]
      frequency_penalty = parsed_json["frequency_penalty"]
      presence_penalty = parsed_json["presence_penalty"]
      logit_bias = parsed_json["logit_bias"]
      custom_parameters = parsed_json["custom_parameters"]
      new(
        stop: stop,
        temperature: temperature,
        max_tokens: max_tokens,
        top_p: top_p,
        top_k: top_k,
        frequency_penalty: frequency_penalty,
        presence_penalty: presence_penalty,
        logit_bias: logit_bias,
        custom_parameters: custom_parameters,
        additional_properties: struct
      )
    end
# Serialize an instance of PromptParameters to a JSON object
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
      obj.stop&.is_a?(Array) != false || raise("Passed value for field obj.stop is not the expected type, validation failed.")
      obj.temperature&.is_a?(Float) != false || raise("Passed value for field obj.temperature is not the expected type, validation failed.")
      obj.max_tokens&.is_a?(Integer) != false || raise("Passed value for field obj.max_tokens is not the expected type, validation failed.")
      obj.top_p&.is_a?(Float) != false || raise("Passed value for field obj.top_p is not the expected type, validation failed.")
      obj.top_k&.is_a?(Integer) != false || raise("Passed value for field obj.top_k is not the expected type, validation failed.")
      obj.frequency_penalty&.is_a?(Float) != false || raise("Passed value for field obj.frequency_penalty is not the expected type, validation failed.")
      obj.presence_penalty&.is_a?(Float) != false || raise("Passed value for field obj.presence_penalty is not the expected type, validation failed.")
      obj.logit_bias&.is_a?(Hash) != false || raise("Passed value for field obj.logit_bias is not the expected type, validation failed.")
      obj.custom_parameters&.is_a?(Hash) != false || raise("Passed value for field obj.custom_parameters is not the expected type, validation failed.")
    end
  end
end