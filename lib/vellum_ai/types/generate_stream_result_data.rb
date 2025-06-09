# frozen_string_literal: true
require_relative "enriched_normalized_completion"
require "ostruct"
require "json"

module Vellum
  class GenerateStreamResultData
  # @return [Integer] 
    attr_reader :completion_index
  # @return [Vellum::EnrichedNormalizedCompletion] 
    attr_reader :completion
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param completion_index [Integer] 
    # @param completion [Vellum::EnrichedNormalizedCompletion] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::GenerateStreamResultData]
    def initialize(completion_index:, completion:, additional_properties: nil)
      @completion_index = completion_index
      @completion = completion
      @additional_properties = additional_properties
      @_field_set = { "completion_index": completion_index, "completion": completion }
    end
# Deserialize a JSON object to an instance of GenerateStreamResultData
    #
    # @param json_object [String] 
    # @return [Vellum::GenerateStreamResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      completion_index = parsed_json["completion_index"]
      unless parsed_json["completion"].nil?
        completion = parsed_json["completion"].to_json
        completion = Vellum::EnrichedNormalizedCompletion.from_json(json_object: completion)
      else
        completion = nil
      end
      new(
        completion_index: completion_index,
        completion: completion,
        additional_properties: struct
      )
    end
# Serialize an instance of GenerateStreamResultData to a JSON object
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
      obj.completion_index.is_a?(Integer) != false || raise("Passed value for field obj.completion_index is not the expected type, validation failed.")
      Vellum::EnrichedNormalizedCompletion.validate_raw(obj: obj.completion)
    end
  end
end