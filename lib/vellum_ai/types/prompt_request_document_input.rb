# frozen_string_literal: true
require_relative "vellum_document"
require "ostruct"
require "json"

module Vellum
  class PromptRequestDocumentInput
  # @return [String] The variable's name, as defined in the Prompt.
    attr_reader :key
  # @return [Vellum::VellumDocument] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param key [String] The variable's name, as defined in the Prompt.
    # @param value [Vellum::VellumDocument] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PromptRequestDocumentInput]
    def initialize(key:, value:, additional_properties: nil)
      @key = key
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "key": key, "value": value }
    end
# Deserialize a JSON object to an instance of PromptRequestDocumentInput
    #
    # @param json_object [String] 
    # @return [Vellum::PromptRequestDocumentInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      key = parsed_json["key"]
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::VellumDocument.from_json(json_object: value)
      else
        value = nil
      end
      new(
        key: key,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of PromptRequestDocumentInput to a JSON object
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
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      Vellum::VellumDocument.validate_raw(obj: obj.value)
    end
  end
end