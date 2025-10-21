# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class DatasetRowPushRequest
  # @return [String] 
    attr_reader :label
  # @return [Hash{String => Object}] 
    attr_reader :inputs
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param label [String] 
    # @param inputs [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::DatasetRowPushRequest]
    def initialize(label:, inputs:, additional_properties: nil)
      @label = label
      @inputs = inputs
      @additional_properties = additional_properties
      @_field_set = { "label": label, "inputs": inputs }
    end
# Deserialize a JSON object to an instance of DatasetRowPushRequest
    #
    # @param json_object [String] 
    # @return [Vellum::DatasetRowPushRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      label = parsed_json["label"]
      inputs = parsed_json["inputs"]
      new(
        label: label,
        inputs: inputs,
        additional_properties: struct
      )
    end
# Serialize an instance of DatasetRowPushRequest to a JSON object
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
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.inputs.is_a?(Hash) != false || raise("Passed value for field obj.inputs is not the expected type, validation failed.")
    end
  end
end