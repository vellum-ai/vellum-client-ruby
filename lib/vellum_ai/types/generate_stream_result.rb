# frozen_string_literal: true
require_relative "generate_stream_result_data"
require_relative "generate_result_error"
require "ostruct"
require "json"

module Vellum
  class GenerateStreamResult
  # @return [Integer] 
    attr_reader :request_index
  # @return [Vellum::GenerateStreamResultData] 
    attr_reader :data
  # @return [Vellum::GenerateResultError] 
    attr_reader :error
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param request_index [Integer] 
    # @param data [Vellum::GenerateStreamResultData] 
    # @param error [Vellum::GenerateResultError] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::GenerateStreamResult]
    def initialize(request_index:, data: OMIT, error: OMIT, additional_properties: nil)
      @request_index = request_index
      @data = data if data != OMIT
      @error = error if error != OMIT
      @additional_properties = additional_properties
      @_field_set = { "request_index": request_index, "data": data, "error": error }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GenerateStreamResult
    #
    # @param json_object [String] 
    # @return [Vellum::GenerateStreamResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      request_index = parsed_json["request_index"]
      unless parsed_json["data"].nil?
        data = parsed_json["data"].to_json
        data = Vellum::GenerateStreamResultData.from_json(json_object: data)
      else
        data = nil
      end
      unless parsed_json["error"].nil?
        error = parsed_json["error"].to_json
        error = Vellum::GenerateResultError.from_json(json_object: error)
      else
        error = nil
      end
      new(
        request_index: request_index,
        data: data,
        error: error,
        additional_properties: struct
      )
    end
# Serialize an instance of GenerateStreamResult to a JSON object
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
      obj.request_index.is_a?(Integer) != false || raise("Passed value for field obj.request_index is not the expected type, validation failed.")
      obj.data.nil? || Vellum::GenerateStreamResultData.validate_raw(obj: obj.data)
      obj.error.nil? || Vellum::GenerateResultError.validate_raw(obj: obj.error)
    end
  end
end