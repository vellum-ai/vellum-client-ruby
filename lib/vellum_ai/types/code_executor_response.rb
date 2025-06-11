# frozen_string_literal: true
require_relative "vellum_value"
require "ostruct"
require "json"

module Vellum
  class CodeExecutorResponse
  # @return [String] 
    attr_reader :log
  # @return [Vellum::VellumValue] 
    attr_reader :output
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param log [String] 
    # @param output [Vellum::VellumValue] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::CodeExecutorResponse]
    def initialize(log:, output:, additional_properties: nil)
      @log = log
      @output = output
      @additional_properties = additional_properties
      @_field_set = { "log": log, "output": output }
    end
# Deserialize a JSON object to an instance of CodeExecutorResponse
    #
    # @param json_object [String] 
    # @return [Vellum::CodeExecutorResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      log = parsed_json["log"]
      unless parsed_json["output"].nil?
        output = parsed_json["output"].to_json
        output = Vellum::VellumValue.from_json(json_object: output)
      else
        output = nil
      end
      new(
        log: log,
        output: output,
        additional_properties: struct
      )
    end
# Serialize an instance of CodeExecutorResponse to a JSON object
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
      obj.log.is_a?(String) != false || raise("Passed value for field obj.log is not the expected type, validation failed.")
      Vellum::VellumValue.validate_raw(obj: obj.output)
    end
  end
end