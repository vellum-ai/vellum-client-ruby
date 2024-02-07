# frozen_string_literal: true

require "json"

module Vellum
  class WorkflowExecutionActualStringRequest
    attr_reader :output_id, :output_key, :quality, :timestamp, :desired_output_value, :additional_properties

    # @param output_id [String] The Vellum-generated ID of a workflow output. Must provide either this or output_key. output_key is typically preferred.
    # @param output_key [String] The user-defined name of a workflow output. Must provide either this or output_id. Should correspond to the `Name` specified in a Final Output Node. Generally preferred over output_id.
    # @param quality [Float] Optionally provide a decimal number between 0.0 and 1.0 (inclusive) representing the quality of the output. 0 is the worst, 1 is the best.
    # @param timestamp [Float] Optionally provide the timestamp representing when this feedback was collected. Used for reporting purposes.
    # @param desired_output_value [String] Optionally provide the value that the output ideally should have been.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [WorkflowExecutionActualStringRequest]
    def initialize(output_id: nil, output_key: nil, quality: nil, timestamp: nil, desired_output_value: nil,
                   additional_properties: nil)
      # @type [String] The Vellum-generated ID of a workflow output. Must provide either this or output_key. output_key is typically preferred.
      @output_id = output_id
      # @type [String] The user-defined name of a workflow output. Must provide either this or output_id. Should correspond to the `Name` specified in a Final Output Node. Generally preferred over output_id.
      @output_key = output_key
      # @type [Float] Optionally provide a decimal number between 0.0 and 1.0 (inclusive) representing the quality of the output. 0 is the worst, 1 is the best.
      @quality = quality
      # @type [Float] Optionally provide the timestamp representing when this feedback was collected. Used for reporting purposes.
      @timestamp = timestamp
      # @type [String] Optionally provide the value that the output ideally should have been.
      @desired_output_value = desired_output_value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of WorkflowExecutionActualStringRequest
    #
    # @param json_object [JSON]
    # @return [WorkflowExecutionActualStringRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      output_id = struct.output_id
      output_key = struct.output_key
      quality = struct.quality
      timestamp = struct.timestamp
      desired_output_value = struct.desired_output_value
      new(output_id: output_id, output_key: output_key, quality: quality, timestamp: timestamp,
          desired_output_value: desired_output_value, additional_properties: struct)
    end

    # Serialize an instance of WorkflowExecutionActualStringRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "output_id": @output_id,
        "output_key": @output_key,
        "quality": @quality,
        "timestamp": @timestamp,
        "desired_output_value": @desired_output_value
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.output_id&.is_a?(String) != false || raise("Passed value for field obj.output_id is not the expected type, validation failed.")
      obj.output_key&.is_a?(String) != false || raise("Passed value for field obj.output_key is not the expected type, validation failed.")
      obj.quality&.is_a?(Float) != false || raise("Passed value for field obj.quality is not the expected type, validation failed.")
      obj.timestamp&.is_a?(Float) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.desired_output_value&.is_a?(String) != false || raise("Passed value for field obj.desired_output_value is not the expected type, validation failed.")
    end
  end
end
