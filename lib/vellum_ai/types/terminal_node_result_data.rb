# frozen_string_literal: true

require_relative "terminal_node_result_output"
require "json"

module Vellum
  class TerminalNodeResultData
    attr_reader :output, :additional_properties

    # @param output [TerminalNodeResultOutput]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TerminalNodeResultData]
    def initialize(output:, additional_properties: nil)
      # @type [TerminalNodeResultOutput]
      @output = output
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TerminalNodeResultData
    #
    # @param json_object [JSON]
    # @return [TerminalNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["output"].nil?
        output = nil
      else
        output = parsed_json["output"].to_json
        output = TerminalNodeResultOutput.from_json(json_object: output)
      end
      new(output: output, additional_properties: struct)
    end

    # Serialize an instance of TerminalNodeResultData to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "output": @output }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      TerminalNodeResultOutput.validate_raw(obj: obj.output)
    end
  end
end
