# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class MergeNodeResultData
  # @return [Hash{String => Object}] 
    attr_reader :paused_node_data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param paused_node_data [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::MergeNodeResultData]
    def initialize(paused_node_data: OMIT, additional_properties: nil)
      @paused_node_data = paused_node_data if paused_node_data != OMIT
      @additional_properties = additional_properties
      @_field_set = { "paused_node_data": paused_node_data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of MergeNodeResultData
    #
    # @param json_object [String] 
    # @return [Vellum::MergeNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      paused_node_data = parsed_json["paused_node_data"]
      new(paused_node_data: paused_node_data, additional_properties: struct)
    end
# Serialize an instance of MergeNodeResultData to a JSON object
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
      obj.paused_node_data&.is_a?(Hash) != false || raise("Passed value for field obj.paused_node_data is not the expected type, validation failed.")
    end
  end
end