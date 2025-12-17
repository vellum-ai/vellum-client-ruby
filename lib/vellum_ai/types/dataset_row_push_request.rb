# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class DatasetRowPushRequest
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :label
  # @return [Hash{String => Object}] 
    attr_reader :inputs
  # @return [Array<Hash{String => Object}>] 
    attr_reader :mocks
  # @return [String] 
    attr_reader :workflow_trigger_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param label [String] 
    # @param inputs [Hash{String => Object}] 
    # @param mocks [Array<Hash{String => Object}>] 
    # @param workflow_trigger_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::DatasetRowPushRequest]
    def initialize(id: OMIT, label:, inputs:, mocks: OMIT, workflow_trigger_id: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @label = label
      @inputs = inputs
      @mocks = mocks if mocks != OMIT
      @workflow_trigger_id = workflow_trigger_id if workflow_trigger_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "label": label, "inputs": inputs, "mocks": mocks, "workflow_trigger_id": workflow_trigger_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DatasetRowPushRequest
    #
    # @param json_object [String] 
    # @return [Vellum::DatasetRowPushRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      label = parsed_json["label"]
      inputs = parsed_json["inputs"]
      mocks = parsed_json["mocks"]
      workflow_trigger_id = parsed_json["workflow_trigger_id"]
      new(
        id: id,
        label: label,
        inputs: inputs,
        mocks: mocks,
        workflow_trigger_id: workflow_trigger_id,
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.inputs.is_a?(Hash) != false || raise("Passed value for field obj.inputs is not the expected type, validation failed.")
      obj.mocks&.is_a?(Array) != false || raise("Passed value for field obj.mocks is not the expected type, validation failed.")
      obj.workflow_trigger_id&.is_a?(String) != false || raise("Passed value for field obj.workflow_trigger_id is not the expected type, validation failed.")
    end
  end
end