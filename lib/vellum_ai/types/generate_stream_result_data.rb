# frozen_string_literal: true

require_relative "enriched_normalized_completion"
require "json"

module Vellum
  class GenerateStreamResultData
    attr_reader :completion_index, :completion, :additional_properties

    # @param completion_index [Integer]
    # @param completion [EnrichedNormalizedCompletion]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [GenerateStreamResultData]
    def initialize(completion_index:, completion:, additional_properties: nil)
      # @type [Integer]
      @completion_index = completion_index
      # @type [EnrichedNormalizedCompletion]
      @completion = completion
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of GenerateStreamResultData
    #
    # @param json_object [JSON]
    # @return [GenerateStreamResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      completion_index = struct.completion_index
      if parsed_json["completion"].nil?
        completion = nil
      else
        completion = parsed_json["completion"].to_json
        completion = EnrichedNormalizedCompletion.from_json(json_object: completion)
      end
      new(completion_index: completion_index, completion: completion, additional_properties: struct)
    end

    # Serialize an instance of GenerateStreamResultData to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "completion_index": @completion_index, "completion": @completion }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.completion_index.is_a?(Integer) != false || raise("Passed value for field obj.completion_index is not the expected type, validation failed.")
      EnrichedNormalizedCompletion.validate_raw(obj: obj.completion)
    end
  end
end
