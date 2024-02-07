# frozen_string_literal: true

require_relative "generate_stream_result_data"
require_relative "generate_result_error"
require "json"

module Vellum
  class GenerateStreamResult
    attr_reader :request_index, :data, :error, :additional_properties

    # @param request_index [Integer]
    # @param data [GenerateStreamResultData]
    # @param error [GenerateResultError]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [GenerateStreamResult]
    def initialize(request_index:, data: nil, error: nil, additional_properties: nil)
      # @type [Integer]
      @request_index = request_index
      # @type [GenerateStreamResultData]
      @data = data
      # @type [GenerateResultError]
      @error = error
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of GenerateStreamResult
    #
    # @param json_object [JSON]
    # @return [GenerateStreamResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      request_index = struct.request_index
      if parsed_json["data"].nil?
        data = nil
      else
        data = parsed_json["data"].to_json
        data = GenerateStreamResultData.from_json(json_object: data)
      end
      if parsed_json["error"].nil?
        error = nil
      else
        error = parsed_json["error"].to_json
        error = GenerateResultError.from_json(json_object: error)
      end
      new(request_index: request_index, data: data, error: error, additional_properties: struct)
    end

    # Serialize an instance of GenerateStreamResult to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "request_index": @request_index, "data": @data, "error": @error }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.request_index.is_a?(Integer) != false || raise("Passed value for field obj.request_index is not the expected type, validation failed.")
      obj.data.nil? || GenerateStreamResultData.validate_raw(obj: obj.data)
      obj.error.nil? || GenerateResultError.validate_raw(obj: obj.error)
    end
  end
end
