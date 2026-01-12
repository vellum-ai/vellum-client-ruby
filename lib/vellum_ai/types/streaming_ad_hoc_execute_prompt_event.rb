# frozen_string_literal: true
require_relative "prompt_output"
require_relative "ad_hoc_streaming_prompt_execution_meta"
require "ostruct"
require "json"

module Vellum
# The data returned for each delta during the prompt execution stream.
  class StreamingAdHocExecutePromptEvent
  # @return [Vellum::PromptOutput] 
    attr_reader :output
  # @return [Integer] 
    attr_reader :output_index
  # @return [String] 
    attr_reader :execution_id
  # @return [Vellum::AdHocStreamingPromptExecutionMeta] 
    attr_reader :meta
  # @return [Hash{String => Object}] The subset of the raw response from the model that the request opted into with
#  `expand_raw`.
    attr_reader :raw
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param output [Vellum::PromptOutput] 
    # @param output_index [Integer] 
    # @param execution_id [String] 
    # @param meta [Vellum::AdHocStreamingPromptExecutionMeta] 
    # @param raw [Hash{String => Object}] The subset of the raw response from the model that the request opted into with
#  `expand_raw`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::StreamingAdHocExecutePromptEvent]
    def initialize(output:, output_index:, execution_id:, meta: OMIT, raw: OMIT, additional_properties: nil)
      @output = output
      @output_index = output_index
      @execution_id = execution_id
      @meta = meta if meta != OMIT
      @raw = raw if raw != OMIT
      @additional_properties = additional_properties
      @_field_set = { "output": output, "output_index": output_index, "execution_id": execution_id, "meta": meta, "raw": raw }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of StreamingAdHocExecutePromptEvent
    #
    # @param json_object [String] 
    # @return [Vellum::StreamingAdHocExecutePromptEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["output"].nil?
        output = parsed_json["output"].to_json
        output = Vellum::PromptOutput.from_json(json_object: output)
      else
        output = nil
      end
      output_index = parsed_json["output_index"]
      execution_id = parsed_json["execution_id"]
      unless parsed_json["meta"].nil?
        meta = parsed_json["meta"].to_json
        meta = Vellum::AdHocStreamingPromptExecutionMeta.from_json(json_object: meta)
      else
        meta = nil
      end
      raw = parsed_json["raw"]
      new(
        output: output,
        output_index: output_index,
        execution_id: execution_id,
        meta: meta,
        raw: raw,
        additional_properties: struct
      )
    end
# Serialize an instance of StreamingAdHocExecutePromptEvent to a JSON object
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
      Vellum::PromptOutput.validate_raw(obj: obj.output)
      obj.output_index.is_a?(Integer) != false || raise("Passed value for field obj.output_index is not the expected type, validation failed.")
      obj.execution_id.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
      obj.meta.nil? || Vellum::AdHocStreamingPromptExecutionMeta.validate_raw(obj: obj.meta)
      obj.raw&.is_a?(Hash) != false || raise("Passed value for field obj.raw is not the expected type, validation failed.")
    end
  end
end