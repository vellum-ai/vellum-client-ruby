# frozen_string_literal: true
require_relative "vellum_code_resource_definition"
require "ostruct"
require "json"

module Vellum
  class NodeExecutionResumedBody
  # @return [Vellum::VellumCodeResourceDefinition] 
    attr_reader :node_definition
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param node_definition [Vellum::VellumCodeResourceDefinition] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::NodeExecutionResumedBody]
    def initialize(node_definition:, additional_properties: nil)
      @node_definition = node_definition
      @additional_properties = additional_properties
      @_field_set = { "node_definition": node_definition }
    end
# Deserialize a JSON object to an instance of NodeExecutionResumedBody
    #
    # @param json_object [String] 
    # @return [Vellum::NodeExecutionResumedBody]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["node_definition"].nil?
        node_definition = parsed_json["node_definition"].to_json
        node_definition = Vellum::VellumCodeResourceDefinition.from_json(json_object: node_definition)
      else
        node_definition = nil
      end
      new(node_definition: node_definition, additional_properties: struct)
    end
# Serialize an instance of NodeExecutionResumedBody to a JSON object
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
      Vellum::VellumCodeResourceDefinition.validate_raw(obj: obj.node_definition)
    end
  end
end