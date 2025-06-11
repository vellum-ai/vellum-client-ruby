# frozen_string_literal: true
require_relative "prompt_node_execution_meta"
require "ostruct"
require "json"

module Vellum
  class PromptNodeResultData
  # @return [Vellum::PromptNodeExecutionMeta] 
    attr_reader :execution_meta
  # @return [String] 
    attr_reader :output_id
  # @return [String] 
    attr_reader :array_output_id
  # @return [String] 
    attr_reader :execution_id
  # @return [String] 
    attr_reader :text
  # @return [String] 
    attr_reader :delta
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param execution_meta [Vellum::PromptNodeExecutionMeta] 
    # @param output_id [String] 
    # @param array_output_id [String] 
    # @param execution_id [String] 
    # @param text [String] 
    # @param delta [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PromptNodeResultData]
    def initialize(execution_meta: OMIT, output_id:, array_output_id: OMIT, execution_id: OMIT, text: OMIT, delta: OMIT, additional_properties: nil)
      @execution_meta = execution_meta if execution_meta != OMIT
      @output_id = output_id
      @array_output_id = array_output_id if array_output_id != OMIT
      @execution_id = execution_id if execution_id != OMIT
      @text = text if text != OMIT
      @delta = delta if delta != OMIT
      @additional_properties = additional_properties
      @_field_set = { "execution_meta": execution_meta, "output_id": output_id, "array_output_id": array_output_id, "execution_id": execution_id, "text": text, "delta": delta }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PromptNodeResultData
    #
    # @param json_object [String] 
    # @return [Vellum::PromptNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["execution_meta"].nil?
        execution_meta = parsed_json["execution_meta"].to_json
        execution_meta = Vellum::PromptNodeExecutionMeta.from_json(json_object: execution_meta)
      else
        execution_meta = nil
      end
      output_id = parsed_json["output_id"]
      array_output_id = parsed_json["array_output_id"]
      execution_id = parsed_json["execution_id"]
      text = parsed_json["text"]
      delta = parsed_json["delta"]
      new(
        execution_meta: execution_meta,
        output_id: output_id,
        array_output_id: array_output_id,
        execution_id: execution_id,
        text: text,
        delta: delta,
        additional_properties: struct
      )
    end
# Serialize an instance of PromptNodeResultData to a JSON object
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
      obj.execution_meta.nil? || Vellum::PromptNodeExecutionMeta.validate_raw(obj: obj.execution_meta)
      obj.output_id.is_a?(String) != false || raise("Passed value for field obj.output_id is not the expected type, validation failed.")
      obj.array_output_id&.is_a?(String) != false || raise("Passed value for field obj.array_output_id is not the expected type, validation failed.")
      obj.execution_id&.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.delta&.is_a?(String) != false || raise("Passed value for field obj.delta is not the expected type, validation failed.")
    end
  end
end