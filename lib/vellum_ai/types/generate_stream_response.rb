# frozen_string_literal: true
require_relative "generate_stream_result"
require "ostruct"
require "json"

module Vellum
  class GenerateStreamResponse
  # @return [Vellum::GenerateStreamResult] 
    attr_reader :delta
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param delta [Vellum::GenerateStreamResult] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::GenerateStreamResponse]
    def initialize(delta:, additional_properties: nil)
      @delta = delta
      @additional_properties = additional_properties
      @_field_set = { "delta": delta }
    end
# Deserialize a JSON object to an instance of GenerateStreamResponse
    #
    # @param json_object [String] 
    # @return [Vellum::GenerateStreamResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["delta"].nil?
        delta = parsed_json["delta"].to_json
        delta = Vellum::GenerateStreamResult.from_json(json_object: delta)
      else
        delta = nil
      end
      new(delta: delta, additional_properties: struct)
    end
# Serialize an instance of GenerateStreamResponse to a JSON object
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
      Vellum::GenerateStreamResult.validate_raw(obj: obj.delta)
    end
  end
end