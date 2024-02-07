# frozen_string_literal: true

require "json"

module Vellum
  class DeploymentProviderPayloadResponse
    attr_reader :payload, :additional_properties

    # @param payload [Hash{String => String}]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [DeploymentProviderPayloadResponse]
    def initialize(payload:, additional_properties: nil)
      # @type [Hash{String => String}]
      @payload = payload
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of DeploymentProviderPayloadResponse
    #
    # @param json_object [JSON]
    # @return [DeploymentProviderPayloadResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      payload = struct.payload
      new(payload: payload, additional_properties: struct)
    end

    # Serialize an instance of DeploymentProviderPayloadResponse to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "payload": @payload }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.payload.is_a?(Hash) != false || raise("Passed value for field obj.payload is not the expected type, validation failed.")
    end
  end
end
