# frozen_string_literal: true

require_relative "enriched_normalized_completion"
require "json"

module Vellum
  class GenerateResultData
    attr_reader :completions, :additional_properties

    # @param completions [Array<EnrichedNormalizedCompletion>] The generated completions. This will generally be a list of length one.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [GenerateResultData]
    def initialize(completions:, additional_properties: nil)
      # @type [Array<EnrichedNormalizedCompletion>] The generated completions. This will generally be a list of length one.
      @completions = completions
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of GenerateResultData
    #
    # @param json_object [JSON]
    # @return [GenerateResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      completions = parsed_json["completions"].map do |v|
        v = v.to_json
        EnrichedNormalizedCompletion.from_json(json_object: v)
      end
      new(completions: completions, additional_properties: struct)
    end

    # Serialize an instance of GenerateResultData to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "completions": @completions }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.completions.is_a?(Array) != false || raise("Passed value for field obj.completions is not the expected type, validation failed.")
    end
  end
end
