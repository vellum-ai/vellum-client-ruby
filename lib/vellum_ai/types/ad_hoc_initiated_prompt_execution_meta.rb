# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# The subset of the metadata tracked by Vellum during prompt execution that the
#  request opted into with `expand_meta`.
  class AdHocInitiatedPromptExecutionMeta
  # @return [String] 
    attr_reader :model_name
  # @return [Integer] 
    attr_reader :latency
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model_name [String] 
    # @param latency [Integer] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::AdHocInitiatedPromptExecutionMeta]
    def initialize(model_name: OMIT, latency: OMIT, additional_properties: nil)
      @model_name = model_name if model_name != OMIT
      @latency = latency if latency != OMIT
      @additional_properties = additional_properties
      @_field_set = { "model_name": model_name, "latency": latency }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AdHocInitiatedPromptExecutionMeta
    #
    # @param json_object [String] 
    # @return [Vellum::AdHocInitiatedPromptExecutionMeta]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model_name = parsed_json["model_name"]
      latency = parsed_json["latency"]
      new(
        model_name: model_name,
        latency: latency,
        additional_properties: struct
      )
    end
# Serialize an instance of AdHocInitiatedPromptExecutionMeta to a JSON object
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
      obj.model_name&.is_a?(String) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
      obj.latency&.is_a?(Integer) != false || raise("Passed value for field obj.latency is not the expected type, validation failed.")
    end
  end
end