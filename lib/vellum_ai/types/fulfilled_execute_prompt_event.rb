# frozen_string_literal: true

require_relative "prompt_output"
require_relative "fulfilled_prompt_execution_meta"
require "json"

module Vellum
  # The final data event returned indicating that the stream has ended and all final resolved values from the model can be found.
  class FulfilledExecutePromptEvent
    attr_reader :outputs, :execution_id, :meta, :additional_properties

    # @param outputs [Array<PromptOutput>]
    # @param execution_id [String]
    # @param meta [FulfilledPromptExecutionMeta]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [FulfilledExecutePromptEvent]
    def initialize(outputs:, execution_id:, meta: nil, additional_properties: nil)
      # @type [Array<PromptOutput>]
      @outputs = outputs
      # @type [String]
      @execution_id = execution_id
      # @type [FulfilledPromptExecutionMeta]
      @meta = meta
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of FulfilledExecutePromptEvent
    #
    # @param json_object [JSON]
    # @return [FulfilledExecutePromptEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      outputs = parsed_json["outputs"].map do |v|
        v = v.to_json
        PromptOutput.from_json(json_object: v)
      end
      execution_id = struct.execution_id
      if parsed_json["meta"].nil?
        meta = nil
      else
        meta = parsed_json["meta"].to_json
        meta = FulfilledPromptExecutionMeta.from_json(json_object: meta)
      end
      new(outputs: outputs, execution_id: execution_id, meta: meta, additional_properties: struct)
    end

    # Serialize an instance of FulfilledExecutePromptEvent to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "outputs": @outputs, "execution_id": @execution_id, "meta": @meta }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.outputs.is_a?(Array) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
      obj.execution_id.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
      obj.meta.nil? || FulfilledPromptExecutionMeta.validate_raw(obj: obj.meta)
    end
  end
end
