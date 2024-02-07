# frozen_string_literal: true

require_relative "scenario_input"
require "json"

module Vellum
  class SandboxScenario
    attr_reader :label, :inputs, :id, :additional_properties

    # @param label [String]
    # @param inputs [Array<ScenarioInput>] The inputs for the scenario
    # @param id [String] The id of the scenario
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SandboxScenario]
    def initialize(inputs:, id:, label: nil, additional_properties: nil)
      # @type [String]
      @label = label
      # @type [Array<ScenarioInput>] The inputs for the scenario
      @inputs = inputs
      # @type [String] The id of the scenario
      @id = id
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of SandboxScenario
    #
    # @param json_object [JSON]
    # @return [SandboxScenario]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      label = struct.label
      inputs = parsed_json["inputs"].map do |v|
        v = v.to_json
        ScenarioInput.from_json(json_object: v)
      end
      id = struct.id
      new(label: label, inputs: inputs, id: id, additional_properties: struct)
    end

    # Serialize an instance of SandboxScenario to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "label": @label, "inputs": @inputs, "id": @id }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
