# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class GenerateResultError
  # @return [String] The error message returned by the LLM provider.
    attr_reader :message
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param message [String] The error message returned by the LLM provider.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::GenerateResultError]
    def initialize(message:, additional_properties: nil)
      @message = message
      @additional_properties = additional_properties
      @_field_set = { "message": message }
    end
# Deserialize a JSON object to an instance of GenerateResultError
    #
    # @param json_object [String] 
    # @return [Vellum::GenerateResultError]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      message = parsed_json["message"]
      new(message: message, additional_properties: struct)
    end
# Serialize an instance of GenerateResultError to a JSON object
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
    end
  end
end