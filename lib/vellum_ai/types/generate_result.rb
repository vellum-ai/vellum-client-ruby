# frozen_string_literal: true

require_relative "generate_result_data"
require_relative "generate_result_error"
require "json"

module Vellum
  class GenerateResult
    attr_reader :data, :error, :additional_properties

    # @param data [GenerateResultData] An object containing the resulting generation. This key will be absent if the LLM provider experienced an error.
    # @param error [GenerateResultError] An object containing details about the error that occurred. This key will be absent if the LLM provider did not experience an error.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [GenerateResult]
    def initialize(data: nil, error: nil, additional_properties: nil)
      # @type [GenerateResultData] An object containing the resulting generation. This key will be absent if the LLM provider experienced an error.
      @data = data
      # @type [GenerateResultError] An object containing details about the error that occurred. This key will be absent if the LLM provider did not experience an error.
      @error = error
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of GenerateResult
    #
    # @param json_object [JSON]
    # @return [GenerateResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["data"].nil?
        data = nil
      else
        data = parsed_json["data"].to_json
        data = GenerateResultData.from_json(json_object: data)
      end
      if parsed_json["error"].nil?
        error = nil
      else
        error = parsed_json["error"].to_json
        error = GenerateResultError.from_json(json_object: error)
      end
      new(data: data, error: error, additional_properties: struct)
    end

    # Serialize an instance of GenerateResult to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "data": @data, "error": @error }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.data.nil? || GenerateResultData.validate_raw(obj: obj.data)
      obj.error.nil? || GenerateResultError.validate_raw(obj: obj.error)
    end
  end
end
