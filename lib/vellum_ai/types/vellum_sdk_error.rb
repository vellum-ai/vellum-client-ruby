# frozen_string_literal: true
require_relative "vellum_sdk_error_code_enum"
require "ostruct"
require "json"

module Vellum
  class VellumSdkError
  # @return [String] 
    attr_reader :message
  # @return [Vellum::VellumSdkErrorCodeEnum] 
    attr_reader :code
  # @return [Hash{String => Object}] 
    attr_reader :raw_data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [String] 
    # @param code [Vellum::VellumSdkErrorCodeEnum] 
    # @param raw_data [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::VellumSdkError]
    def initialize(message:, code:, raw_data: OMIT, additional_properties: nil)
      @message = message
      @code = code
      @raw_data = raw_data if raw_data != OMIT
      @additional_properties = additional_properties
      @_field_set = { "message": message, "code": code, "raw_data": raw_data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of VellumSdkError
    #
    # @param json_object [String] 
    # @return [Vellum::VellumSdkError]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      message = parsed_json["message"]
      code = parsed_json["code"]
      raw_data = parsed_json["raw_data"]
      new(
        message: message,
        code: code,
        raw_data: raw_data,
        additional_properties: struct
      )
    end
# Serialize an instance of VellumSdkError to a JSON object
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
      obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.code.is_a?(Vellum::VellumSdkErrorCodeEnum) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
      obj.raw_data&.is_a?(Hash) != false || raise("Passed value for field obj.raw_data is not the expected type, validation failed.")
    end
  end
end