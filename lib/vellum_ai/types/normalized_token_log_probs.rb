# frozen_string_literal: true

require "json"

module Vellum
  class NormalizedTokenLogProbs
    attr_reader :token, :logprob, :top_logprobs, :text_offset, :additional_properties

    # @param token [String]
    # @param logprob [Float]
    # @param top_logprobs [Hash{String => String}]
    # @param text_offset [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [NormalizedTokenLogProbs]
    def initialize(token:, text_offset:, logprob: nil, top_logprobs: nil, additional_properties: nil)
      # @type [String]
      @token = token
      # @type [Float]
      @logprob = logprob
      # @type [Hash{String => String}]
      @top_logprobs = top_logprobs
      # @type [Integer]
      @text_offset = text_offset
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of NormalizedTokenLogProbs
    #
    # @param json_object [JSON]
    # @return [NormalizedTokenLogProbs]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      token = struct.token
      logprob = struct.logprob
      top_logprobs = struct.top_logprobs
      text_offset = struct.text_offset
      new(token: token, logprob: logprob, top_logprobs: top_logprobs, text_offset: text_offset,
          additional_properties: struct)
    end

    # Serialize an instance of NormalizedTokenLogProbs to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "token": @token, "logprob": @logprob, "top_logprobs": @top_logprobs, "text_offset": @text_offset }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.token.is_a?(String) != false || raise("Passed value for field obj.token is not the expected type, validation failed.")
      obj.logprob&.is_a?(Float) != false || raise("Passed value for field obj.logprob is not the expected type, validation failed.")
      obj.top_logprobs&.is_a?(Hash) != false || raise("Passed value for field obj.top_logprobs is not the expected type, validation failed.")
      obj.text_offset.is_a?(Integer) != false || raise("Passed value for field obj.text_offset is not the expected type, validation failed.")
    end
  end
end
