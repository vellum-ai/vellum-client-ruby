# frozen_string_literal: true
require_relative "search_result_request"
require "ostruct"
require "json"

module Vellum
# A value representing Search Results.
  class SearchResultsVellumValueRequest
  # @return [String] 
    attr_reader :type
  # @return [Array<Vellum::SearchResultRequest>] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] 
    # @param value [Array<Vellum::SearchResultRequest>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SearchResultsVellumValueRequest]
    def initialize(type:, value: OMIT, additional_properties: nil)
      @type = type
      @value = value if value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchResultsVellumValueRequest
    #
    # @param json_object [String] 
    # @return [Vellum::SearchResultsVellumValueRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      value = parsed_json["value"]&.map do | item |
  item = item.to_json
  Vellum::SearchResultRequest.from_json(json_object: item)
end
      new(
        type: type,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of SearchResultsVellumValueRequest to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.value&.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end