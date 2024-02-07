# frozen_string_literal: true

require_relative "code_execution_node_result_data"
require "json"

module Vellum
  # A Node Result Event emitted from a Code Execution Node.
  class CodeExecutionNodeResult
    attr_reader :data, :additional_properties

    # @param data [CodeExecutionNodeResultData]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [CodeExecutionNodeResult]
    def initialize(data:, additional_properties: nil)
      # @type [CodeExecutionNodeResultData]
      @data = data
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of CodeExecutionNodeResult
    #
    # @param json_object [JSON]
    # @return [CodeExecutionNodeResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["data"].nil?
        data = nil
      else
        data = parsed_json["data"].to_json
        data = CodeExecutionNodeResultData.from_json(json_object: data)
      end
      new(data: data, additional_properties: struct)
    end

    # Serialize an instance of CodeExecutionNodeResult to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "data": @data }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      CodeExecutionNodeResultData.validate_raw(obj: obj.data)
    end
  end
end
