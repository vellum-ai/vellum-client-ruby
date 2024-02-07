# frozen_string_literal: true

require_relative "generate_stream_result"
require "json"

module Vellum
  class GenerateStreamResponse
    attr_reader :delta, :additional_properties

    # @param delta [GenerateStreamResult]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [GenerateStreamResponse]
    def initialize(delta:, additional_properties: nil)
      # @type [GenerateStreamResult]
      @delta = delta
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of GenerateStreamResponse
    #
    # @param json_object [JSON]
    # @return [GenerateStreamResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["delta"].nil?
        delta = nil
      else
        delta = parsed_json["delta"].to_json
        delta = GenerateStreamResult.from_json(json_object: delta)
      end
      new(delta: delta, additional_properties: struct)
    end

    # Serialize an instance of GenerateStreamResponse to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "delta": @delta }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      GenerateStreamResult.validate_raw(obj: obj.delta)
    end
  end
end
