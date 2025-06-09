# frozen_string_literal: true
require_relative "execution_vellum_value"
require "date"
require "ostruct"
require "json"

module Vellum
  class WorkflowExecutionActual
  # @return [Vellum::ExecutionVellumValue] 
    attr_reader :output
  # @return [DateTime] 
    attr_reader :timestamp
  # @return [Float] 
    attr_reader :quality
  # @return [Hash{String => Object}] 
    attr_reader :metadata
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param output [Vellum::ExecutionVellumValue] 
    # @param timestamp [DateTime] 
    # @param quality [Float] 
    # @param metadata [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowExecutionActual]
    def initialize(output:, timestamp:, quality:, metadata: OMIT, additional_properties: nil)
      @output = output
      @timestamp = timestamp
      @quality = quality
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "output": output, "timestamp": timestamp, "quality": quality, "metadata": metadata }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowExecutionActual
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowExecutionActual]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["output"].nil?
        output = parsed_json["output"].to_json
        output = Vellum::ExecutionVellumValue.from_json(json_object: output)
      else
        output = nil
      end
      timestamp = unless parsed_json["timestamp"].nil?
  DateTime.parse(parsed_json["timestamp"])
else
  nil
end
      quality = parsed_json["quality"]
      metadata = parsed_json["metadata"]
      new(
        output: output,
        timestamp: timestamp,
        quality: quality,
        metadata: metadata,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowExecutionActual to a JSON object
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
      Vellum::ExecutionVellumValue.validate_raw(obj: obj.output)
      obj.timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.quality.is_a?(Float) != false || raise("Passed value for field obj.quality is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end