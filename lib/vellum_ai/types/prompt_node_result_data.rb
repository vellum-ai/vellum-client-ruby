# frozen_string_literal: true

require "json"

module Vellum
  class PromptNodeResultData
    attr_reader :output_id, :array_output_id, :text, :delta, :additional_properties

    # @param output_id [String]
    # @param array_output_id [String]
    # @param text [String]
    # @param delta [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [PromptNodeResultData]
    def initialize(output_id:, array_output_id: nil, text: nil, delta: nil, additional_properties: nil)
      # @type [String]
      @output_id = output_id
      # @type [String]
      @array_output_id = array_output_id
      # @type [String]
      @text = text
      # @type [String]
      @delta = delta
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of PromptNodeResultData
    #
    # @param json_object [JSON]
    # @return [PromptNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      output_id = struct.output_id
      array_output_id = struct.array_output_id
      text = struct.text
      delta = struct.delta
      new(output_id: output_id, array_output_id: array_output_id, text: text, delta: delta,
          additional_properties: struct)
    end

    # Serialize an instance of PromptNodeResultData to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "output_id": @output_id, "array_output_id": @array_output_id, "text": @text, "delta": @delta }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.output_id.is_a?(String) != false || raise("Passed value for field obj.output_id is not the expected type, validation failed.")
      obj.array_output_id&.is_a?(String) != false || raise("Passed value for field obj.array_output_id is not the expected type, validation failed.")
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.delta&.is_a?(String) != false || raise("Passed value for field obj.delta is not the expected type, validation failed.")
    end
  end
end
