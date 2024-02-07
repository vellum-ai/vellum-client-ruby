# frozen_string_literal: true

require_relative "vellum_error_code_enum"
require "json"

module Vellum
  class VellumError
    attr_reader :message, :code, :additional_properties

    # @param message [String]
    # @param code [VELLUM_ERROR_CODE_ENUM]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [VellumError]
    def initialize(message:, code:, additional_properties: nil)
      # @type [String]
      @message = message
      # @type [VELLUM_ERROR_CODE_ENUM]
      @code = code
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of VellumError
    #
    # @param json_object [JSON]
    # @return [VellumError]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      message = struct.message
      code = VELLUM_ERROR_CODE_ENUM.key(parsed_json["code"]) || parsed_json["code"]
      new(message: message, code: code, additional_properties: struct)
    end

    # Serialize an instance of VellumError to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "message": @message, "code": VELLUM_ERROR_CODE_ENUM[@code] || @code }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.code.is_a?(VELLUM_ERROR_CODE_ENUM) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
    end
  end
end
