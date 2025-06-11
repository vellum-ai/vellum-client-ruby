# frozen_string_literal: true
require_relative "templating_node_result_output"
require "ostruct"
require "json"

module Vellum
  class TemplatingNodeResultData
  # @return [Vellum::TemplatingNodeResultOutput] 
    attr_reader :output
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param output [Vellum::TemplatingNodeResultOutput] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TemplatingNodeResultData]
    def initialize(output:, additional_properties: nil)
      @output = output
      @additional_properties = additional_properties
      @_field_set = { "output": output }
    end
# Deserialize a JSON object to an instance of TemplatingNodeResultData
    #
    # @param json_object [String] 
    # @return [Vellum::TemplatingNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["output"].nil?
        output = parsed_json["output"].to_json
        output = Vellum::TemplatingNodeResultOutput.from_json(json_object: output)
      else
        output = nil
      end
      new(output: output, additional_properties: struct)
    end
# Serialize an instance of TemplatingNodeResultData to a JSON object
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
      Vellum::TemplatingNodeResultOutput.validate_raw(obj: obj.output)
    end
  end
end