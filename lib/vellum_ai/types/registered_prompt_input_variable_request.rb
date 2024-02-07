# frozen_string_literal: true

require_relative "vellum_variable_type"
require "json"

module Vellum
  class RegisteredPromptInputVariableRequest
    attr_reader :key, :id, :type, :additional_properties

    # @param key [String]
    # @param id [String]
    # @param type [VELLUM_VARIABLE_TYPE]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RegisteredPromptInputVariableRequest]
    def initialize(key:, id: nil, type: nil, additional_properties: nil)
      # @type [String]
      @key = key
      # @type [String]
      @id = id
      # @type [VELLUM_VARIABLE_TYPE]
      @type = type
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of RegisteredPromptInputVariableRequest
    #
    # @param json_object [JSON]
    # @return [RegisteredPromptInputVariableRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      key = struct.key
      id = struct.id
      type = VELLUM_VARIABLE_TYPE.key(parsed_json["type"]) || parsed_json["type"]
      new(key: key, id: id, type: type, additional_properties: struct)
    end

    # Serialize an instance of RegisteredPromptInputVariableRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "key": @key, "id": @id, "type": VELLUM_VARIABLE_TYPE[@type] || @type }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.key.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.type&.is_a?(VELLUM_VARIABLE_TYPE) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
    end
  end
end
