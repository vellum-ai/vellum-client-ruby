# frozen_string_literal: true

require "json"

module Vellum
  class ModelVersionExecConfigParameters
    attr_reader :temperature, :max_tokens, :top_p, :frequency_penalty, :presence_penalty, :logit_bias, :stop, :top_k,
                :custom_parameters, :additional_properties

    # @param temperature [Float]
    # @param max_tokens [Integer]
    # @param top_p [Float]
    # @param frequency_penalty [Float]
    # @param presence_penalty [Float]
    # @param logit_bias [Hash{String => String}]
    # @param stop [Array<String>]
    # @param top_k [Float]
    # @param custom_parameters [Hash{String => String}]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ModelVersionExecConfigParameters]
    def initialize(top_p:, frequency_penalty:, presence_penalty:, temperature: nil, max_tokens: nil, logit_bias: nil,
                   stop: nil, top_k: nil, custom_parameters: nil, additional_properties: nil)
      # @type [Float]
      @temperature = temperature
      # @type [Integer]
      @max_tokens = max_tokens
      # @type [Float]
      @top_p = top_p
      # @type [Float]
      @frequency_penalty = frequency_penalty
      # @type [Float]
      @presence_penalty = presence_penalty
      # @type [Hash{String => String}]
      @logit_bias = logit_bias
      # @type [Array<String>]
      @stop = stop
      # @type [Float]
      @top_k = top_k
      # @type [Hash{String => String}]
      @custom_parameters = custom_parameters
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of ModelVersionExecConfigParameters
    #
    # @param json_object [JSON]
    # @return [ModelVersionExecConfigParameters]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      temperature = struct.temperature
      max_tokens = struct.max_tokens
      top_p = struct.top_p
      frequency_penalty = struct.frequency_penalty
      presence_penalty = struct.presence_penalty
      logit_bias = struct.logit_bias
      stop = struct.stop
      top_k = struct.top_k
      custom_parameters = struct.custom_parameters
      new(temperature: temperature, max_tokens: max_tokens, top_p: top_p, frequency_penalty: frequency_penalty,
          presence_penalty: presence_penalty, logit_bias: logit_bias, stop: stop, top_k: top_k, custom_parameters: custom_parameters, additional_properties: struct)
    end

    # Serialize an instance of ModelVersionExecConfigParameters to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "temperature": @temperature,
        "max_tokens": @max_tokens,
        "top_p": @top_p,
        "frequency_penalty": @frequency_penalty,
        "presence_penalty": @presence_penalty,
        "logit_bias": @logit_bias,
        "stop": @stop,
        "top_k": @top_k,
        "custom_parameters": @custom_parameters
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.temperature&.is_a?(Float) != false || raise("Passed value for field obj.temperature is not the expected type, validation failed.")
      obj.max_tokens&.is_a?(Integer) != false || raise("Passed value for field obj.max_tokens is not the expected type, validation failed.")
      obj.top_p.is_a?(Float) != false || raise("Passed value for field obj.top_p is not the expected type, validation failed.")
      obj.frequency_penalty.is_a?(Float) != false || raise("Passed value for field obj.frequency_penalty is not the expected type, validation failed.")
      obj.presence_penalty.is_a?(Float) != false || raise("Passed value for field obj.presence_penalty is not the expected type, validation failed.")
      obj.logit_bias&.is_a?(Hash) != false || raise("Passed value for field obj.logit_bias is not the expected type, validation failed.")
      obj.stop&.is_a?(Array) != false || raise("Passed value for field obj.stop is not the expected type, validation failed.")
      obj.top_k&.is_a?(Float) != false || raise("Passed value for field obj.top_k is not the expected type, validation failed.")
      obj.custom_parameters&.is_a?(Hash) != false || raise("Passed value for field obj.custom_parameters is not the expected type, validation failed.")
    end
  end
end
