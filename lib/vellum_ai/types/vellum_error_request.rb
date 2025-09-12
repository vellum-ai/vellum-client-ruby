# frozen_string_literal: true
require_relative "vellum_error_code_enum"
require "ostruct"
require "json"

module Vellum
  class VellumErrorRequest
  # @return [Vellum::VellumErrorCodeEnum] 
    attr_reader :code
  # @return [String] 
    attr_reader :message
  # @return [Hash{String => Object}] 
    attr_reader :raw_data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param code [Vellum::VellumErrorCodeEnum] 
    # @param message [String] 
    # @param raw_data [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::VellumErrorRequest]
    def initialize(code:, message:, raw_data: OMIT, additional_properties: nil)
      @code = code
      @message = message
      @raw_data = raw_data if raw_data != OMIT
      @additional_properties = additional_properties
      @_field_set = { "code": code, "message": message, "raw_data": raw_data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of VellumErrorRequest
    #
    # @param json_object [String] 
    # @return [Vellum::VellumErrorRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      code = parsed_json["code"]
      message = parsed_json["message"]
      raw_data = parsed_json["raw_data"]
      new(
        code: code,
        message: message,
        raw_data: raw_data,
        additional_properties: struct
      )
    end
# Serialize an instance of VellumErrorRequest to a JSON object
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
      obj.code.is_a?(Vellum::VellumErrorCodeEnum) != false || raise("Passed value for field obj.code is not the expected type, validation failed.")
      obj.message.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      obj.raw_data&.is_a?(Hash) != false || raise("Passed value for field obj.raw_data is not the expected type, validation failed.")
    end
  end
end