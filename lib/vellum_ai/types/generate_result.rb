# frozen_string_literal: true
require_relative "generate_result_data"
require_relative "generate_result_error"
require "ostruct"
require "json"

module Vellum
  class GenerateResult
  # @return [Vellum::GenerateResultData] An object containing the resulting generation. This key will be absent if the
#  LLM provider experienced an error.
    attr_reader :data
  # @return [Vellum::GenerateResultError] An object containing details about the error that occurred. This key will be
#  absent if the LLM provider did not experience an error.
    attr_reader :error
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param data [Vellum::GenerateResultData] An object containing the resulting generation. This key will be absent if the
#  LLM provider experienced an error.
    # @param error [Vellum::GenerateResultError] An object containing details about the error that occurred. This key will be
#  absent if the LLM provider did not experience an error.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::GenerateResult]
    def initialize(data: OMIT, error: OMIT, additional_properties: nil)
      @data = data if data != OMIT
      @error = error if error != OMIT
      @additional_properties = additional_properties
      @_field_set = { "data": data, "error": error }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GenerateResult
    #
    # @param json_object [String] 
    # @return [Vellum::GenerateResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["data"].nil?
        data = parsed_json["data"].to_json
        data = Vellum::GenerateResultData.from_json(json_object: data)
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
        data: data,
        error: error,
        additional_properties: struct
      )
    end
# Serialize an instance of GenerateResult to a JSON object
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
      obj.data.nil? || Vellum::GenerateResultData.validate_raw(obj: obj.data)
      obj.error.nil? || Vellum::GenerateResultError.validate_raw(obj: obj.error)
    end
  end
end