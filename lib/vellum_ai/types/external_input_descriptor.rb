# frozen_string_literal: true
require_relative "code_resource_definition"
require "ostruct"
require "json"

module Vellum
  class ExternalInputDescriptor
  # @return [Array<Vellum::CodeResourceDefinition>] 
    attr_reader :types
  # @return [Vellum::CodeResourceDefinition] 
    attr_reader :inputs_class
  # @return [Object] 
    attr_reader :instance
  # @return [String] 
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param types [Array<Vellum::CodeResourceDefinition>] 
    # @param inputs_class [Vellum::CodeResourceDefinition] 
    # @param instance [Object] 
    # @param name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ExternalInputDescriptor]
    def initialize(types:, inputs_class: OMIT, instance: OMIT, name:, additional_properties: nil)
      @types = types
      @inputs_class = inputs_class if inputs_class != OMIT
      @instance = instance if instance != OMIT
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "types": types, "inputs_class": inputs_class, "instance": instance, "name": name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ExternalInputDescriptor
    #
    # @param json_object [String] 
    # @return [Vellum::ExternalInputDescriptor]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      types = parsed_json["types"]&.map do | item |
  item = item.to_json
  Vellum::CodeResourceDefinition.from_json(json_object: item)
end
      unless parsed_json["inputs_class"].nil?
        inputs_class = parsed_json["inputs_class"].to_json
        inputs_class = Vellum::CodeResourceDefinition.from_json(json_object: inputs_class)
      else
        inputs_class = nil
      end
      instance = parsed_json["instance"]
      name = parsed_json["name"]
      new(
        types: types,
        inputs_class: inputs_class,
        instance: instance,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of ExternalInputDescriptor to a JSON object
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
      obj.types.is_a?(Array) != false || raise("Passed value for field obj.types is not the expected type, validation failed.")
      obj.inputs_class.nil? || Vellum::CodeResourceDefinition.validate_raw(obj: obj.inputs_class)
      obj.instance&.is_a?(Object) != false || raise("Passed value for field obj.instance is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end