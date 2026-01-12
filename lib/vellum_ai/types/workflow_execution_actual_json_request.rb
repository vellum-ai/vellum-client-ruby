# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class WorkflowExecutionActualJSONRequest
  # @return [String] The Vellum-generated ID of a workflow output. Must provide either this or
#  output_key. output_key is typically preferred.
    attr_reader :output_id
  # @return [String] The user-defined name of a workflow output. Must provide either this or
#  output_id. Should correspond to the `Name` specified in a Final Output Node.
#  Generally preferred over output_id.
    attr_reader :output_key
  # @return [Float] Optionally provide a decimal number between 0.0 and 1.0 (inclusive) representing
#  the quality of the output. 0 is the worst, 1 is the best.
    attr_reader :quality
  # @return [Hash{String => Object}] Optionally provide additional metadata about the feedback submission.
    attr_reader :metadata
  # @return [Float] Optionally provide the timestamp representing when this feedback was collected.
#  Used for reporting purposes.
    attr_reader :timestamp
  # @return [Hash{String => Object}] Optionally provide the value that the output ideally should have been.
    attr_reader :desired_output_value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param output_id [String] The Vellum-generated ID of a workflow output. Must provide either this or
#  output_key. output_key is typically preferred.
    # @param output_key [String] The user-defined name of a workflow output. Must provide either this or
#  output_id. Should correspond to the `Name` specified in a Final Output Node.
#  Generally preferred over output_id.
    # @param quality [Float] Optionally provide a decimal number between 0.0 and 1.0 (inclusive) representing
#  the quality of the output. 0 is the worst, 1 is the best.
    # @param metadata [Hash{String => Object}] Optionally provide additional metadata about the feedback submission.
    # @param timestamp [Float] Optionally provide the timestamp representing when this feedback was collected.
#  Used for reporting purposes.
    # @param desired_output_value [Hash{String => Object}] Optionally provide the value that the output ideally should have been.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowExecutionActualJSONRequest]
    def initialize(output_id: OMIT, output_key: OMIT, quality: OMIT, metadata: OMIT, timestamp: OMIT, desired_output_value: OMIT, additional_properties: nil)
      @output_id = output_id if output_id != OMIT
      @output_key = output_key if output_key != OMIT
      @quality = quality if quality != OMIT
      @metadata = metadata if metadata != OMIT
      @timestamp = timestamp if timestamp != OMIT
      @desired_output_value = desired_output_value if desired_output_value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "output_id": output_id, "output_key": output_key, "quality": quality, "metadata": metadata, "timestamp": timestamp, "desired_output_value": desired_output_value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowExecutionActualJSONRequest
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowExecutionActualJSONRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      output_id = parsed_json["output_id"]
      output_key = parsed_json["output_key"]
      quality = parsed_json["quality"]
      metadata = parsed_json["metadata"]
      timestamp = parsed_json["timestamp"]
      desired_output_value = parsed_json["desired_output_value"]
      new(
        output_id: output_id,
        output_key: output_key,
        quality: quality,
        metadata: metadata,
        timestamp: timestamp,
        desired_output_value: desired_output_value,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowExecutionActualJSONRequest to a JSON object
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
      obj.output_id&.is_a?(String) != false || raise("Passed value for field obj.output_id is not the expected type, validation failed.")
      obj.output_key&.is_a?(String) != false || raise("Passed value for field obj.output_key is not the expected type, validation failed.")
      obj.quality&.is_a?(Float) != false || raise("Passed value for field obj.quality is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.timestamp&.is_a?(Float) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.desired_output_value&.is_a?(Hash) != false || raise("Passed value for field obj.desired_output_value is not the expected type, validation failed.")
    end
  end
end