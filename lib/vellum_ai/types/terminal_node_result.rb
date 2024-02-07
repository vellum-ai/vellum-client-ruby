# frozen_string_literal: true

require_relative "terminal_node_result_data"
require "json"

module Vellum
  # A Node Result Event emitted from a Terminal Node.
  class TerminalNodeResult
    attr_reader :data, :additional_properties

    # @param data [TerminalNodeResultData]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TerminalNodeResult]
    def initialize(data:, additional_properties: nil)
      # @type [TerminalNodeResultData]
      @data = data
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TerminalNodeResult
    #
    # @param json_object [JSON]
    # @return [TerminalNodeResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["data"].nil?
        data = nil
      else
        data = parsed_json["data"].to_json
        data = TerminalNodeResultData.from_json(json_object: data)
      end
      new(data: data, additional_properties: struct)
    end

    # Serialize an instance of TerminalNodeResult to a JSON object
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
      TerminalNodeResultData.validate_raw(obj: obj.data)
    end
  end
end
