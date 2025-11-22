# frozen_string_literal: true
require_relative "vellum_variable_type"
require_relative "vellum_value"
require_relative "vellum_variable_extensions"
require "ostruct"
require "json"

module Vellum
  class VellumVariable
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :key
  # @return [Vellum::VellumVariableType] 
    attr_reader :type
  # @return [Boolean] 
    attr_reader :required
  # @return [Vellum::VellumValue] 
    attr_reader :default
  # @return [Vellum::VellumVariableExtensions] 
    attr_reader :extensions
  # @return [Hash{String => Object}] 
    attr_reader :schema
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param key [String] 
    # @param type [Vellum::VellumVariableType] 
    # @param required [Boolean] 
    # @param default [Vellum::VellumValue] 
    # @param extensions [Vellum::VellumVariableExtensions] 
    # @param schema [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::VellumVariable]
    def initialize(id:, key:, type:, required: OMIT, default: OMIT, extensions: OMIT, schema: OMIT, additional_properties: nil)
      @id = id
      @key = key
      @type = type
      @required = required if required != OMIT
      @default = default if default != OMIT
      @extensions = extensions if extensions != OMIT
      @schema = schema if schema != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "key": key, "type": type, "required": required, "default": default, "extensions": extensions, "schema": schema }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of VellumVariable
    #
    # @param json_object [String] 
    # @return [Vellum::VellumVariable]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      key = parsed_json["key"]
      type = parsed_json["type"]
      required = parsed_json["required"]
      unless parsed_json["default"].nil?
        default = parsed_json["default"].to_json
        default = Vellum::VellumValue.from_json(json_object: default)
      else
        default = nil
      end
      unless parsed_json["extensions"].nil?
        extensions = parsed_json["extensions"].to_json
        extensions = Vellum::VellumVariableExtensions.from_json(json_object: extensions)
      else
        extensions = nil
      end
      schema = parsed_json["schema"]
      new(
        id: id,
        key: key,
        type: type,
        required: required,
        default: default,
        extensions: extensions,
        schema: schema,
        additional_properties: struct
      )
    end
# Serialize an instance of VellumVariable to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.type.is_a?(Vellum::VellumVariableType) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.required&.is_a?(Boolean) != false || raise("Passed value for field obj.required is not the expected type, validation failed.")
      obj.default.nil? || Vellum::VellumValue.validate_raw(obj: obj.default)
      obj.extensions.nil? || Vellum::VellumVariableExtensions.validate_raw(obj: obj.extensions)
      obj.schema&.is_a?(Hash) != false || raise("Passed value for field obj.schema is not the expected type, validation failed.")
    end
  end
end