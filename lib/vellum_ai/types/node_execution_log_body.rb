# frozen_string_literal: true
require_relative "vellum_code_resource_definition"
require_relative "severity_enum"
require "ostruct"
require "json"

module Vellum
  class NodeExecutionLogBody
  # @return [Vellum::VellumCodeResourceDefinition] 
    attr_reader :node_definition
  # @return [Hash{String => Object}] 
    attr_reader :attributes
  # @return [Vellum::SeverityEnum] 
    attr_reader :severity
  # @return [String] 
    attr_reader :message
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param node_definition [Vellum::VellumCodeResourceDefinition] 
    # @param attributes [Hash{String => Object}] 
    # @param severity [Vellum::SeverityEnum] 
    # @param message [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::NodeExecutionLogBody]
    def initialize(node_definition:, attributes: OMIT, severity:, message:, additional_properties: nil)
      @node_definition = node_definition
      @attributes = attributes if attributes != OMIT
      @severity = severity
      @message = message
      @additional_properties = additional_properties
      @_field_set = { "node_definition": node_definition, "attributes": attributes, "severity": severity, "message": message }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of NodeExecutionLogBody
    #
    # @param json_object [String] 
    # @return [Vellum::NodeExecutionLogBody]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["node_definition"].nil?
        node_definition = parsed_json["node_definition"].to_json
        node_definition = Vellum::VellumCodeResourceDefinition.from_json(json_object: node_definition)
      else
        node_definition = nil
      end
      attributes = parsed_json["attributes"]
      severity = parsed_json["severity"]
      message = parsed_json["message"]
      new(
        node_definition: node_definition,
        attributes: attributes,
        severity: severity,
        message: message,
        additional_properties: struct
      )
    end
# Serialize an instance of NodeExecutionLogBody to a JSON object
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
      obj.attributes&.is_a?(Hash) != false || raise("Passed value for field obj.attributes is not the expected type, validation failed.")
      obj.severity.is_a?(Vellum::SeverityEnum) != false || raise("Passed value for field obj.severity is not the expected type, validation failed.")
      obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
    end
  end
end