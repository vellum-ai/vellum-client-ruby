# frozen_string_literal: true
require_relative "generate_result"
require "ostruct"
require "json"

module Vellum
  class GenerateResponse
  # @return [Array<Vellum::GenerateResult>] The results of each generation request.
    attr_reader :results
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param results [Array<Vellum::GenerateResult>] The results of each generation request.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::GenerateResponse]
    def initialize(results:, additional_properties: nil)
      @results = results
      @additional_properties = additional_properties
      @_field_set = { "results": results }
    end
# Deserialize a JSON object to an instance of GenerateResponse
    #
    # @param json_object [String] 
    # @return [Vellum::GenerateResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      results = parsed_json["results"]&.map do | item |
  item = item.to_json
  Vellum::GenerateResult.from_json(json_object: item)
end
      new(results: results, additional_properties: struct)
    end
# Serialize an instance of GenerateResponse to a JSON object
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
      obj.results.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
    end
  end
end