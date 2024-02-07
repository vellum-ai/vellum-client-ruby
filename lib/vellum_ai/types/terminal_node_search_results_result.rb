# frozen_string_literal: true

require_relative "search_result"
require "json"

module Vellum
  class TerminalNodeSearchResultsResult
    attr_reader :id, :name, :value, :additional_properties

    # @param id [String]
    # @param name [String] The unique name given to the terminal node that produced this output.
    # @param value [Array<SearchResult>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TerminalNodeSearchResultsResult]
    def initialize(name:, id: nil, value: nil, additional_properties: nil)
      # @type [String]
      @id = id
      # @type [String] The unique name given to the terminal node that produced this output.
      @name = name
      # @type [Array<SearchResult>]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TerminalNodeSearchResultsResult
    #
    # @param json_object [JSON]
    # @return [TerminalNodeSearchResultsResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      name = struct.name
      value = parsed_json["value"].map do |v|
        v = v.to_json
        SearchResult.from_json(json_object: v)
      end
      new(id: id, name: name, value: value, additional_properties: struct)
    end

    # Serialize an instance of TerminalNodeSearchResultsResult to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "id": @id, "name": @name, "value": @value }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.value&.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
