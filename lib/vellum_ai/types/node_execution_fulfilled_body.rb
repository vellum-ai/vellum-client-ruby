# frozen_string_literal: true
require_relative "vellum_code_resource_definition"
require_relative "invoked_port"
require "ostruct"
require "json"

module Vellum
  class NodeExecutionFulfilledBody
  # @return [Vellum::VellumCodeResourceDefinition] 
    attr_reader :node_definition
  # @return [Array<Vellum::InvokedPort>] 
    attr_reader :invoked_ports
  # @return [Hash{String => Object}] 
    attr_reader :outputs
  # @return [Boolean] 
    attr_reader :mocked
  # @return [Boolean] 
    attr_reader :redacted
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param node_definition [Vellum::VellumCodeResourceDefinition] 
    # @param invoked_ports [Array<Vellum::InvokedPort>] 
    # @param outputs [Hash{String => Object}] 
    # @param mocked [Boolean] 
    # @param redacted [Boolean] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::NodeExecutionFulfilledBody]
    def initialize(node_definition:, invoked_ports: OMIT, outputs:, mocked: OMIT, redacted: OMIT, additional_properties: nil)
      @node_definition = node_definition
      @invoked_ports = invoked_ports if invoked_ports != OMIT
      @outputs = outputs
      @mocked = mocked if mocked != OMIT
      @redacted = redacted if redacted != OMIT
      @additional_properties = additional_properties
      @_field_set = { "node_definition": node_definition, "invoked_ports": invoked_ports, "outputs": outputs, "mocked": mocked, "redacted": redacted }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of NodeExecutionFulfilledBody
    #
    # @param json_object [String] 
    # @return [Vellum::NodeExecutionFulfilledBody]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["node_definition"].nil?
        node_definition = parsed_json["node_definition"].to_json
        node_definition = Vellum::VellumCodeResourceDefinition.from_json(json_object: node_definition)
      else
        node_definition = nil
      end
      invoked_ports = parsed_json["invoked_ports"]&.map do | item |
  item = item.to_json
  Vellum::InvokedPort.from_json(json_object: item)
end
      outputs = parsed_json["outputs"]
      mocked = parsed_json["mocked"]
      redacted = parsed_json["redacted"]
      new(
        node_definition: node_definition,
        invoked_ports: invoked_ports,
        outputs: outputs,
        mocked: mocked,
        redacted: redacted,
        additional_properties: struct
      )
    end
# Serialize an instance of NodeExecutionFulfilledBody to a JSON object
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
      obj.invoked_ports&.is_a?(Array) != false || raise("Passed value for field obj.invoked_ports is not the expected type, validation failed.")
      obj.outputs.is_a?(Hash) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
      obj.mocked&.is_a?(Boolean) != false || raise("Passed value for field obj.mocked is not the expected type, validation failed.")
      obj.redacted&.is_a?(Boolean) != false || raise("Passed value for field obj.redacted is not the expected type, validation failed.")
    end
  end
end