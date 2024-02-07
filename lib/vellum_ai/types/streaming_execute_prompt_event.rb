# frozen_string_literal: true

require_relative "prompt_output"
require_relative "streaming_prompt_execution_meta"
require "json"

module Vellum
  # The data returned for each delta during the prompt execution stream.
  class StreamingExecutePromptEvent
    attr_reader :output, :output_index, :execution_id, :meta, :raw, :additional_properties

    # @param output [PromptOutput]
    # @param output_index [Integer]
    # @param execution_id [String]
    # @param meta [StreamingPromptExecutionMeta]
    # @param raw [Hash{String => String}] The subset of the raw response from the model that the request opted into with `expand_raw`.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [StreamingExecutePromptEvent]
    def initialize(output:, output_index:, execution_id:, meta: nil, raw: nil, additional_properties: nil)
      # @type [PromptOutput]
      @output = output
      # @type [Integer]
      @output_index = output_index
      # @type [String]
      @execution_id = execution_id
      # @type [StreamingPromptExecutionMeta]
      @meta = meta
      # @type [Hash{String => String}] The subset of the raw response from the model that the request opted into with `expand_raw`.
      @raw = raw
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of StreamingExecutePromptEvent
    #
    # @param json_object [JSON]
    # @return [StreamingExecutePromptEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["output"].nil?
        output = nil
      else
        output = parsed_json["output"].to_json
        output = PromptOutput.from_json(json_object: output)
      end
      output_index = struct.output_index
      execution_id = struct.execution_id
      if parsed_json["meta"].nil?
        meta = nil
      else
        meta = parsed_json["meta"].to_json
        meta = StreamingPromptExecutionMeta.from_json(json_object: meta)
      end
      raw = struct.raw
      new(output: output, output_index: output_index, execution_id: execution_id, meta: meta, raw: raw,
          additional_properties: struct)
    end

    # Serialize an instance of StreamingExecutePromptEvent to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "output": @output,
        "output_index": @output_index,
        "execution_id": @execution_id,
        "meta": @meta,
        "raw": @raw
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      PromptOutput.validate_raw(obj: obj.output)
      obj.output_index.is_a?(Integer) != false || raise("Passed value for field obj.output_index is not the expected type, validation failed.")
      obj.execution_id.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
      obj.meta.nil? || StreamingPromptExecutionMeta.validate_raw(obj: obj.meta)
      obj.raw&.is_a?(Hash) != false || raise("Passed value for field obj.raw is not the expected type, validation failed.")
    end
  end
end
