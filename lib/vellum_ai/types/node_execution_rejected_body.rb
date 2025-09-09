# frozen_string_literal: true
require_relative "vellum_code_resource_definition"
require_relative "vellum_sdk_error"
require "ostruct"
require "json"

module Vellum
  class NodeExecutionRejectedBody
  # @return [Vellum::VellumCodeResourceDefinition] 
    attr_reader :node_definition
  # @return [Vellum::VellumSdkError] 
    attr_reader :error
  # @return [String] 
    attr_reader :stacktrace
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param node_definition [Vellum::VellumCodeResourceDefinition] 
    # @param error [Vellum::VellumSdkError] 
    # @param stacktrace [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::NodeExecutionRejectedBody]
    def initialize(node_definition:, error:, stacktrace: OMIT, additional_properties: nil)
      @node_definition = node_definition
      @error = error
      @stacktrace = stacktrace if stacktrace != OMIT
      @additional_properties = additional_properties
      @_field_set = { "node_definition": node_definition, "error": error, "stacktrace": stacktrace }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of NodeExecutionRejectedBody
    #
    # @param json_object [String] 
    # @return [Vellum::NodeExecutionRejectedBody]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["node_definition"].nil?
        node_definition = parsed_json["node_definition"].to_json
        node_definition = Vellum::VellumCodeResourceDefinition.from_json(json_object: node_definition)
      else
        node_definition = nil
      end
      unless parsed_json["error"].nil?
        error = parsed_json["error"].to_json
        error = Vellum::VellumSdkError.from_json(json_object: error)
      else
        error = nil
      end
      stacktrace = parsed_json["stacktrace"]
      new(
        node_definition: node_definition,
        error: error,
        stacktrace: stacktrace,
        additional_properties: struct
      )
    end
# Serialize an instance of NodeExecutionRejectedBody to a JSON object
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
      Vellum::VellumSdkError.validate_raw(obj: obj.error)
      obj.stacktrace&.is_a?(String) != false || raise("Passed value for field obj.stacktrace is not the expected type, validation failed.")
    end
  end
end