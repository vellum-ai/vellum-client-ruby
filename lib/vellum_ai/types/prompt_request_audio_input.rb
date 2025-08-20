# frozen_string_literal: true
require_relative "vellum_audio"
require "ostruct"
require "json"

module Vellum
  class PromptRequestAudioInput
  # @return [String] The variable's name, as defined in the Prompt.
    attr_reader :key
  # @return [String] 
    attr_reader :type
  # @return [Vellum::VellumAudio] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param key [String] The variable's name, as defined in the Prompt.
    # @param type [String] 
    # @param value [Vellum::VellumAudio] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PromptRequestAudioInput]
    def initialize(key:, type:, value:, additional_properties: nil)
      @key = key
      @type = type
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "key": key, "type": type, "value": value }
    end
# Deserialize a JSON object to an instance of PromptRequestAudioInput
    #
    # @param json_object [String] 
    # @return [Vellum::PromptRequestAudioInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      key = parsed_json["key"]
      type = parsed_json["type"]
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::VellumAudio.from_json(json_object: value)
      else
        value = nil
      end
      new(
        key: key,
        type: type,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of PromptRequestAudioInput to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      Vellum::VellumAudio.validate_raw(obj: obj.value)
    end
  end
end