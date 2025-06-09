# frozen_string_literal: true
require_relative "enriched_normalized_completion"
require "ostruct"
require "json"

module Vellum
  class GenerateResultData
  # @return [Array<Vellum::EnrichedNormalizedCompletion>] The generated completions. This will generally be a list of length one.
    attr_reader :completions
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param completions [Array<Vellum::EnrichedNormalizedCompletion>] The generated completions. This will generally be a list of length one.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::GenerateResultData]
    def initialize(completions:, additional_properties: nil)
      @completions = completions
      @additional_properties = additional_properties
      @_field_set = { "completions": completions }
    end
# Deserialize a JSON object to an instance of GenerateResultData
    #
    # @param json_object [String] 
    # @return [Vellum::GenerateResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      completions = parsed_json["completions"]&.map do | item |
  item = item.to_json
  Vellum::EnrichedNormalizedCompletion.from_json(json_object: item)
end
      new(completions: completions, additional_properties: struct)
    end
# Serialize an instance of GenerateResultData to a JSON object
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
      obj.completions.is_a?(Array) != false || raise("Passed value for field obj.completions is not the expected type, validation failed.")
    end
  end
end