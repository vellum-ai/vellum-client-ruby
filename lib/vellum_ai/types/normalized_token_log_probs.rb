# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class NormalizedTokenLogProbs
  # @return [String] 
    attr_reader :token
  # @return [Float] 
    attr_reader :logprob
  # @return [Hash{String => Float}] 
    attr_reader :top_logprobs
  # @return [Integer] 
    attr_reader :text_offset
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param token [String] 
    # @param logprob [Float] 
    # @param top_logprobs [Hash{String => Float}] 
    # @param text_offset [Integer] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::NormalizedTokenLogProbs]
    def initialize(token:, logprob: OMIT, top_logprobs: OMIT, text_offset:, additional_properties: nil)
      @token = token
      @logprob = logprob if logprob != OMIT
      @top_logprobs = top_logprobs if top_logprobs != OMIT
      @text_offset = text_offset
      @additional_properties = additional_properties
      @_field_set = { "token": token, "logprob": logprob, "top_logprobs": top_logprobs, "text_offset": text_offset }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of NormalizedTokenLogProbs
    #
    # @param json_object [String] 
    # @return [Vellum::NormalizedTokenLogProbs]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      token = parsed_json["token"]
      logprob = parsed_json["logprob"]
      top_logprobs = parsed_json["top_logprobs"]
      text_offset = parsed_json["text_offset"]
      new(
        token: token,
        logprob: logprob,
        top_logprobs: top_logprobs,
        text_offset: text_offset,
        additional_properties: struct
      )
    end
# Serialize an instance of NormalizedTokenLogProbs to a JSON object
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
      obj.token.is_a?(String) != false || raise("Passed value for field obj.token is not the expected type, validation failed.")
      obj.logprob&.is_a?(Float) != false || raise("Passed value for field obj.logprob is not the expected type, validation failed.")
      obj.top_logprobs&.is_a?(Hash) != false || raise("Passed value for field obj.top_logprobs is not the expected type, validation failed.")
      obj.text_offset.is_a?(Integer) != false || raise("Passed value for field obj.text_offset is not the expected type, validation failed.")
    end
  end
end