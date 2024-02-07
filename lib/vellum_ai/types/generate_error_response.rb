# frozen_string_literal: true

require "json"

module Vellum
  class GenerateErrorResponse
    attr_reader :detail, :additional_properties

    # @param detail [String] Details about why the request failed.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [GenerateErrorResponse]
    def initialize(detail:, additional_properties: nil)
      # @type [String] Details about why the request failed.
      @detail = detail
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of GenerateErrorResponse
    #
    # @param json_object [JSON]
    # @return [GenerateErrorResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      detail = struct.detail
      new(detail: detail, additional_properties: struct)
    end

    # Serialize an instance of GenerateErrorResponse to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "detail": @detail }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.detail.is_a?(String) != false || raise("Passed value for field obj.detail is not the expected type, validation failed.")
    end
  end
end
