# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class ErrorDetailResponse
  # @return [String] Message informing the user of the error.
    attr_reader :detail
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param detail [String] Message informing the user of the error.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ErrorDetailResponse]
    def initialize(detail:, additional_properties: nil)
      @detail = detail
      @additional_properties = additional_properties
      @_field_set = { "detail": detail }
    end
# Deserialize a JSON object to an instance of ErrorDetailResponse
    #
    # @param json_object [String] 
    # @return [Vellum::ErrorDetailResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      detail = parsed_json["detail"]
      new(detail: detail, additional_properties: struct)
    end
# Serialize an instance of ErrorDetailResponse to a JSON object
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
      obj.detail.is_a?(String) != false || raise("Passed value for field obj.detail is not the expected type, validation failed.")
    end
  end
end