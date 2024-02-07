# frozen_string_literal: true

require_relative "vellum_error"
require "json"

module Vellum
  # Returned if the function call failed to parse for some reason.
  class RejectedFunctionCall
    attr_reader :error, :id, :name, :additional_properties

    # @param error [VellumError]
    # @param id [String]
    # @param name [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RejectedFunctionCall]
    def initialize(error:, name:, id: nil, additional_properties: nil)
      # @type [VellumError]
      @error = error
      # @type [String]
      @id = id
      # @type [String]
      @name = name
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of RejectedFunctionCall
    #
    # @param json_object [JSON]
    # @return [RejectedFunctionCall]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["error"].nil?
        error = nil
      else
        error = parsed_json["error"].to_json
        error = VellumError.from_json(json_object: error)
      end
      id = struct.id
      name = struct.name
      new(error: error, id: id, name: name, additional_properties: struct)
    end

    # Serialize an instance of RejectedFunctionCall to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "error": @error, "id": @id, "name": @name }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      VellumError.validate_raw(obj: obj.error)
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end
