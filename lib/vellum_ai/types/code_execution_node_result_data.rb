# frozen_string_literal: true

require_relative "code_execution_node_result_output"
require "json"

module Vellum
  class CodeExecutionNodeResultData
    attr_reader :output, :log_output_id, :additional_properties

    # @param output [CodeExecutionNodeResultOutput]
    # @param log_output_id [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [CodeExecutionNodeResultData]
    def initialize(output:, log_output_id: nil, additional_properties: nil)
      # @type [CodeExecutionNodeResultOutput]
      @output = output
      # @type [String]
      @log_output_id = log_output_id
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of CodeExecutionNodeResultData
    #
    # @param json_object [JSON]
    # @return [CodeExecutionNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["output"].nil?
        output = nil
      else
        output = parsed_json["output"].to_json
        output = CodeExecutionNodeResultOutput.from_json(json_object: output)
      end
      log_output_id = struct.log_output_id
      new(output: output, log_output_id: log_output_id, additional_properties: struct)
    end

    # Serialize an instance of CodeExecutionNodeResultData to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "output": @output, "log_output_id": @log_output_id }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      CodeExecutionNodeResultOutput.validate_raw(obj: obj.output)
      obj.log_output_id&.is_a?(String) != false || raise("Passed value for field obj.log_output_id is not the expected type, validation failed.")
    end
  end
end
