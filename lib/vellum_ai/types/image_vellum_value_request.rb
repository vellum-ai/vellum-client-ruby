# frozen_string_literal: true
require_relative "vellum_image_request"
require "ostruct"
require "json"

module Vellum
# A base Vellum primitive value representing an image.
  class ImageVellumValueRequest
  # @return [String] 
    attr_reader :type
  # @return [Vellum::VellumImageRequest] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] 
    # @param value [Vellum::VellumImageRequest] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ImageVellumValueRequest]
    def initialize(type:, value: OMIT, additional_properties: nil)
      @type = type
      @value = value if value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ImageVellumValueRequest
    #
    # @param json_object [String] 
    # @return [Vellum::ImageVellumValueRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::VellumImageRequest.from_json(json_object: value)
      else
        value = nil
      end
      new(
        type: type,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of ImageVellumValueRequest to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.value.nil? || Vellum::VellumImageRequest.validate_raw(obj: obj.value)
    end
  end
end