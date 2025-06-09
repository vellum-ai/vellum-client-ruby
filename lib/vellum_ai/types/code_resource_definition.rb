# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# The definition of a resource defined in code.
  class CodeResourceDefinition
  # @return [String] The name of the resource, typically a class name.
    attr_reader :name
  # @return [Array<String>] The module that this resource is defined in.
    attr_reader :module_
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name of the resource, typically a class name.
    # @param module_ [Array<String>] The module that this resource is defined in.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::CodeResourceDefinition]
    def initialize(name:, module_:, additional_properties: nil)
      @name = name
      @module_ = module_
      @additional_properties = additional_properties
      @_field_set = { "name": name, "module": module_ }
    end
# Deserialize a JSON object to an instance of CodeResourceDefinition
    #
    # @param json_object [String] 
    # @return [Vellum::CodeResourceDefinition]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      module_ = parsed_json["module"]
      new(
        name: name,
        module_: module_,
        additional_properties: struct
      )
    end
# Serialize an instance of CodeResourceDefinition to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.module_.is_a?(Array) != false || raise("Passed value for field obj.module_ is not the expected type, validation failed.")
    end
  end
end