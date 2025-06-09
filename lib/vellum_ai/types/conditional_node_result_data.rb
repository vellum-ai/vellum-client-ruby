# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class ConditionalNodeResultData
  # @return [String] 
    attr_reader :source_handle_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param source_handle_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ConditionalNodeResultData]
    def initialize(source_handle_id: OMIT, additional_properties: nil)
      @source_handle_id = source_handle_id if source_handle_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "source_handle_id": source_handle_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ConditionalNodeResultData
    #
    # @param json_object [String] 
    # @return [Vellum::ConditionalNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      source_handle_id = parsed_json["source_handle_id"]
      new(source_handle_id: source_handle_id, additional_properties: struct)
    end
# Serialize an instance of ConditionalNodeResultData to a JSON object
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
      obj.source_handle_id&.is_a?(String) != false || raise("Passed value for field obj.source_handle_id is not the expected type, validation failed.")
    end
  end
end