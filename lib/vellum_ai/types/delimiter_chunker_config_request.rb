# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class DelimiterChunkerConfigRequest
  # @return [String] 
    attr_reader :delimiter
  # @return [Boolean] 
    attr_reader :is_regex
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param delimiter [String] 
    # @param is_regex [Boolean] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::DelimiterChunkerConfigRequest]
    def initialize(delimiter: OMIT, is_regex: OMIT, additional_properties: nil)
      @delimiter = delimiter if delimiter != OMIT
      @is_regex = is_regex if is_regex != OMIT
      @additional_properties = additional_properties
      @_field_set = { "delimiter": delimiter, "is_regex": is_regex }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DelimiterChunkerConfigRequest
    #
    # @param json_object [String] 
    # @return [Vellum::DelimiterChunkerConfigRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      delimiter = parsed_json["delimiter"]
      is_regex = parsed_json["is_regex"]
      new(
        delimiter: delimiter,
        is_regex: is_regex,
        additional_properties: struct
      )
    end
# Serialize an instance of DelimiterChunkerConfigRequest to a JSON object
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
      obj.delimiter&.is_a?(String) != false || raise("Passed value for field obj.delimiter is not the expected type, validation failed.")
      obj.is_regex&.is_a?(Boolean) != false || raise("Passed value for field obj.is_regex is not the expected type, validation failed.")
    end
  end
end