# frozen_string_literal: true
require_relative "scenario_input"
require "ostruct"
require "json"

module Vellum
# Sandbox Scenario
  class SandboxScenario
  # @return [String] 
    attr_reader :label
  # @return [Array<Vellum::ScenarioInput>] The inputs for the scenario
    attr_reader :inputs
  # @return [String] The id of the scenario
    attr_reader :id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param label [String] 
    # @param inputs [Array<Vellum::ScenarioInput>] The inputs for the scenario
    # @param id [String] The id of the scenario
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SandboxScenario]
    def initialize(label: OMIT, inputs:, id:, additional_properties: nil)
      @label = label if label != OMIT
      @inputs = inputs
      @id = id
      @additional_properties = additional_properties
      @_field_set = { "label": label, "inputs": inputs, "id": id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SandboxScenario
    #
    # @param json_object [String] 
    # @return [Vellum::SandboxScenario]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      label = parsed_json["label"]
      inputs = parsed_json["inputs"]&.map do | item |
  item = item.to_json
  Vellum::ScenarioInput.from_json(json_object: item)
end
      id = parsed_json["id"]
      new(
        label: label,
        inputs: inputs,
        id: id,
        additional_properties: struct
      )
    end
# Serialize an instance of SandboxScenario to a JSON object
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
      obj.label&.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.inputs.is_a?(Array) != false || raise("Passed value for field obj.inputs is not the expected type, validation failed.")
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
    end
  end
end