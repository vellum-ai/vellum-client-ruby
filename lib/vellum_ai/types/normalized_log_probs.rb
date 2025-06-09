# frozen_string_literal: true
require_relative "normalized_token_log_probs"
require "ostruct"
require "json"

module Vellum
  class NormalizedLogProbs
  # @return [Array<Vellum::NormalizedTokenLogProbs>] 
    attr_reader :tokens
  # @return [Float] 
    attr_reader :likelihood
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param tokens [Array<Vellum::NormalizedTokenLogProbs>] 
    # @param likelihood [Float] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::NormalizedLogProbs]
    def initialize(tokens:, likelihood: OMIT, additional_properties: nil)
      @tokens = tokens
      @likelihood = likelihood if likelihood != OMIT
      @additional_properties = additional_properties
      @_field_set = { "tokens": tokens, "likelihood": likelihood }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of NormalizedLogProbs
    #
    # @param json_object [String] 
    # @return [Vellum::NormalizedLogProbs]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      tokens = parsed_json["tokens"]&.map do | item |
  item = item.to_json
  Vellum::NormalizedTokenLogProbs.from_json(json_object: item)
end
      likelihood = parsed_json["likelihood"]
      new(
        tokens: tokens,
        likelihood: likelihood,
        additional_properties: struct
      )
    end
# Serialize an instance of NormalizedLogProbs to a JSON object
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
      obj.tokens.is_a?(Array) != false || raise("Passed value for field obj.tokens is not the expected type, validation failed.")
      obj.likelihood&.is_a?(Float) != false || raise("Passed value for field obj.likelihood is not the expected type, validation failed.")
    end
  end
end