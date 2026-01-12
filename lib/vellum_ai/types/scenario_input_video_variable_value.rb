# frozen_string_literal: true
require_relative "vellum_video"
require "ostruct"
require "json"

module Vellum
  class ScenarioInputVideoVariableValue
  # @return [Vellum::VellumVideo] 
    attr_reader :value
  # @return [String] 
    attr_reader :input_variable_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param value [Vellum::VellumVideo] 
    # @param input_variable_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ScenarioInputVideoVariableValue]
    def initialize(value: OMIT, input_variable_id:, additional_properties: nil)
      @value = value if value != OMIT
      @input_variable_id = input_variable_id
      @additional_properties = additional_properties
      @_field_set = { "value": value, "input_variable_id": input_variable_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ScenarioInputVideoVariableValue
    #
    # @param json_object [String] 
    # @return [Vellum::ScenarioInputVideoVariableValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::VellumVideo.from_json(json_object: value)
      else
        value = nil
      end
      input_variable_id = parsed_json["input_variable_id"]
      new(
        value: value,
        input_variable_id: input_variable_id,
        additional_properties: struct
      )
    end
# Serialize an instance of ScenarioInputVideoVariableValue to a JSON object
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
      obj.value.nil? || Vellum::VellumVideo.validate_raw(obj: obj.value)
      obj.input_variable_id.is_a?(String) != false || raise("Passed value for field obj.input_variable_id is not the expected type, validation failed.")
    end
  end
end