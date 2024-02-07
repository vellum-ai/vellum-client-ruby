# frozen_string_literal: true

require_relative "normalized_token_log_probs"
require "json"

module Vellum
  class NormalizedLogProbs
    attr_reader :tokens, :likelihood, :additional_properties

    # @param tokens [Array<NormalizedTokenLogProbs>]
    # @param likelihood [Float]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [NormalizedLogProbs]
    def initialize(tokens:, likelihood: nil, additional_properties: nil)
      # @type [Array<NormalizedTokenLogProbs>]
      @tokens = tokens
      # @type [Float]
      @likelihood = likelihood
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of NormalizedLogProbs
    #
    # @param json_object [JSON]
    # @return [NormalizedLogProbs]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      tokens = parsed_json["tokens"].map do |v|
        v = v.to_json
        NormalizedTokenLogProbs.from_json(json_object: v)
      end
      likelihood = struct.likelihood
      new(tokens: tokens, likelihood: likelihood, additional_properties: struct)
    end

    # Serialize an instance of NormalizedLogProbs to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "tokens": @tokens, "likelihood": @likelihood }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.tokens.is_a?(Array) != false || raise("Passed value for field obj.tokens is not the expected type, validation failed.")
      obj.likelihood&.is_a?(Float) != false || raise("Passed value for field obj.likelihood is not the expected type, validation failed.")
    end
  end
end
