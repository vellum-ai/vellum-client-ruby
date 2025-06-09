# frozen_string_literal: true
require_relative "code_execution_node_result_output"
require "ostruct"
require "json"

module Vellum
  class CodeExecutionNodeResultData
  # @return [Vellum::CodeExecutionNodeResultOutput] 
    attr_reader :output
  # @return [String] 
    attr_reader :log_output_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param output [Vellum::CodeExecutionNodeResultOutput] 
    # @param log_output_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::CodeExecutionNodeResultData]
    def initialize(output:, log_output_id: OMIT, additional_properties: nil)
      @output = output
      @log_output_id = log_output_id if log_output_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "output": output, "log_output_id": log_output_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CodeExecutionNodeResultData
    #
    # @param json_object [String] 
    # @return [Vellum::CodeExecutionNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["output"].nil?
        output = parsed_json["output"].to_json
        output = Vellum::CodeExecutionNodeResultOutput.from_json(json_object: output)
      else
        output = nil
      end
      log_output_id = parsed_json["log_output_id"]
      new(
        output: output,
        log_output_id: log_output_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CodeExecutionNodeResultData to a JSON object
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
      Vellum::CodeExecutionNodeResultOutput.validate_raw(obj: obj.output)
      obj.log_output_id&.is_a?(String) != false || raise("Passed value for field obj.log_output_id is not the expected type, validation failed.")
    end
  end
end