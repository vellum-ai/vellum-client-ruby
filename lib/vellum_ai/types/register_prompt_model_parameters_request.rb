# frozen_string_literal: true

require "json"

module Vellum
  class RegisterPromptModelParametersRequest
    attr_reader :temperature, :max_tokens, :stop, :top_p, :top_k, :frequency_penalty, :presence_penalty, :logit_bias,
                :custom_parameters, :additional_properties

    # @param temperature [Float]
    # @param max_tokens [Integer]
    # @param stop [Array<String>]
    # @param top_p [Float]
    # @param top_k [Integer]
    # @param frequency_penalty [Float]
    # @param presence_penalty [Float]
    # @param logit_bias [Hash{String => String}]
    # @param custom_parameters [Hash{String => String}]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RegisterPromptModelParametersRequest]
    def initialize(temperature:, max_tokens:, top_p:, frequency_penalty:, presence_penalty:, stop: nil, top_k: nil,
                   logit_bias: nil, custom_parameters: nil, additional_properties: nil)
      # @type [Float]
      @temperature = temperature
      # @type [Integer]
      @max_tokens = max_tokens
      # @type [Array<String>]
      @stop = stop
      # @type [Float]
      @top_p = top_p
      # @type [Integer]
      @top_k = top_k
      # @type [Float]
      @frequency_penalty = frequency_penalty
      # @type [Float]
      @presence_penalty = presence_penalty
      # @type [Hash{String => String}]
      @logit_bias = logit_bias
      # @type [Hash{String => String}]
      @custom_parameters = custom_parameters
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of RegisterPromptModelParametersRequest
    #
    # @param json_object [JSON]
    # @return [RegisterPromptModelParametersRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      temperature = struct.temperature
      max_tokens = struct.max_tokens
      stop = struct.stop
      top_p = struct.top_p
      top_k = struct.top_k
      frequency_penalty = struct.frequency_penalty
      presence_penalty = struct.presence_penalty
      logit_bias = struct.logit_bias
      custom_parameters = struct.custom_parameters
      new(temperature: temperature, max_tokens: max_tokens, stop: stop, top_p: top_p, top_k: top_k,
          frequency_penalty: frequency_penalty, presence_penalty: presence_penalty, logit_bias: logit_bias, custom_parameters: custom_parameters, additional_properties: struct)
    end

    # Serialize an instance of RegisterPromptModelParametersRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "temperature": @temperature,
        "max_tokens": @max_tokens,
        "stop": @stop,
        "top_p": @top_p,
        "top_k": @top_k,
        "frequency_penalty": @frequency_penalty,
        "presence_penalty": @presence_penalty,
        "logit_bias": @logit_bias,
        "custom_parameters": @custom_parameters
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.temperature.is_a?(Float) != false || raise("Passed value for field obj.temperature is not the expected type, validation failed.")
      obj.max_tokens.is_a?(Integer) != false || raise("Passed value for field obj.max_tokens is not the expected type, validation failed.")
      obj.stop&.is_a?(Array) != false || raise("Passed value for field obj.stop is not the expected type, validation failed.")
      obj.top_p.is_a?(Float) != false || raise("Passed value for field obj.top_p is not the expected type, validation failed.")
      obj.top_k&.is_a?(Integer) != false || raise("Passed value for field obj.top_k is not the expected type, validation failed.")
      obj.frequency_penalty.is_a?(Float) != false || raise("Passed value for field obj.frequency_penalty is not the expected type, validation failed.")
      obj.presence_penalty.is_a?(Float) != false || raise("Passed value for field obj.presence_penalty is not the expected type, validation failed.")
      obj.logit_bias&.is_a?(Hash) != false || raise("Passed value for field obj.logit_bias is not the expected type, validation failed.")
      obj.custom_parameters&.is_a?(Hash) != false || raise("Passed value for field obj.custom_parameters is not the expected type, validation failed.")
    end
  end
end
