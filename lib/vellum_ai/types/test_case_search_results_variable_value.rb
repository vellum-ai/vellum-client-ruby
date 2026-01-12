# frozen_string_literal: true
require_relative "search_result"
require "ostruct"
require "json"

module Vellum
# A search results value for a variable in a Test Case.
  class TestCaseSearchResultsVariableValue
  # @return [String] 
    attr_reader :variable_id
  # @return [String] 
    attr_reader :name
  # @return [Array<Vellum::SearchResult>] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param variable_id [String] 
    # @param name [String] 
    # @param value [Array<Vellum::SearchResult>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestCaseSearchResultsVariableValue]
    def initialize(variable_id:, name:, value: OMIT, additional_properties: nil)
      @variable_id = variable_id
      @name = name
      @value = value if value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "variable_id": variable_id, "name": name, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TestCaseSearchResultsVariableValue
    #
    # @param json_object [String] 
    # @return [Vellum::TestCaseSearchResultsVariableValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      variable_id = parsed_json["variable_id"]
      name = parsed_json["name"]
      value = parsed_json["value"]&.map do | item |
  item = item.to_json
  Vellum::SearchResult.from_json(json_object: item)
end
      new(
        variable_id: variable_id,
        name: name,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of TestCaseSearchResultsVariableValue to a JSON object
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
      obj.variable_id.is_a?(String) != false || raise("Passed value for field obj.variable_id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.value&.is_a?(Array) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end