# frozen_string_literal: true

require "json"

module Vellum
  class RegisterPromptPrompt
    attr_reader :id, :label, :additional_properties

    # @param id [String] The ID of the generated prompt.
    # @param label [String] A human-friendly label for the generated prompt.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RegisterPromptPrompt]
    def initialize(id:, label:, additional_properties: nil)
      # @type [String] The ID of the generated prompt.
      @id = id
      # @type [String] A human-friendly label for the generated prompt.
      @label = label
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of RegisterPromptPrompt
    #
    # @param json_object [JSON]
    # @return [RegisterPromptPrompt]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      id = struct.id
      label = struct.label
      new(id: id, label: label, additional_properties: struct)
    end

    # Serialize an instance of RegisterPromptPrompt to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "id": @id, "label": @label }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
    end
  end
end
