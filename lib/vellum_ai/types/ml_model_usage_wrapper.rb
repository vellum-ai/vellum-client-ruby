# frozen_string_literal: true
require_relative "ml_model_usage"
require "ostruct"
require "json"

module Vellum
  class MlModelUsageWrapper
  # @return [String] 
    attr_reader :ml_model_name
  # @return [Vellum::MlModelUsage] 
    attr_reader :ml_model_usage
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param ml_model_name [String] 
    # @param ml_model_usage [Vellum::MlModelUsage] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::MlModelUsageWrapper]
    def initialize(ml_model_name:, ml_model_usage:, additional_properties: nil)
      @ml_model_name = ml_model_name
      @ml_model_usage = ml_model_usage
      @additional_properties = additional_properties
      @_field_set = { "ml_model_name": ml_model_name, "ml_model_usage": ml_model_usage }
    end
# Deserialize a JSON object to an instance of MlModelUsageWrapper
    #
    # @param json_object [String] 
    # @return [Vellum::MlModelUsageWrapper]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      ml_model_name = parsed_json["ml_model_name"]
      unless parsed_json["ml_model_usage"].nil?
        ml_model_usage = parsed_json["ml_model_usage"].to_json
        ml_model_usage = Vellum::MlModelUsage.from_json(json_object: ml_model_usage)
      else
        ml_model_usage = nil
      end
      new(
        ml_model_name: ml_model_name,
        ml_model_usage: ml_model_usage,
        additional_properties: struct
      )
    end
# Serialize an instance of MlModelUsageWrapper to a JSON object
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
      obj.ml_model_name.is_a?(String) != false || raise("Passed value for field obj.ml_model_name is not the expected type, validation failed.")
      Vellum::MlModelUsage.validate_raw(obj: obj.ml_model_usage)
    end
  end
end