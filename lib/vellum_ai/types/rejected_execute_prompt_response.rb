# frozen_string_literal: true

require_relative "prompt_execution_meta"
require_relative "vellum_error"
require "json"

module Vellum
  # The unsuccessful response from the model containing an error of what went wrong.
  class RejectedExecutePromptResponse
    attr_reader :meta, :raw, :execution_id, :error, :additional_properties

    # @param meta [PromptExecutionMeta]
    # @param raw [Hash{String => String}] The subset of the raw response from the model that the request opted into with `expand_raw`.
    # @param execution_id [String] The ID of the execution.
    # @param error [VellumError]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RejectedExecutePromptResponse]
    def initialize(execution_id:, error:, meta: nil, raw: nil, additional_properties: nil)
      # @type [PromptExecutionMeta]
      @meta = meta
      # @type [Hash{String => String}] The subset of the raw response from the model that the request opted into with `expand_raw`.
      @raw = raw
      # @type [String] The ID of the execution.
      @execution_id = execution_id
      # @type [VellumError]
      @error = error
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of RejectedExecutePromptResponse
    #
    # @param json_object [JSON]
    # @return [RejectedExecutePromptResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["meta"].nil?
        meta = nil
      else
        meta = parsed_json["meta"].to_json
        meta = PromptExecutionMeta.from_json(json_object: meta)
      end
      raw = struct.raw
      execution_id = struct.execution_id
      if parsed_json["error"].nil?
        error = nil
      else
        error = parsed_json["error"].to_json
        error = VellumError.from_json(json_object: error)
      end
      new(meta: meta, raw: raw, execution_id: execution_id, error: error, additional_properties: struct)
    end

    # Serialize an instance of RejectedExecutePromptResponse to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "meta": @meta, "raw": @raw, "execution_id": @execution_id, "error": @error }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.meta.nil? || PromptExecutionMeta.validate_raw(obj: obj.meta)
      obj.raw&.is_a?(Hash) != false || raise("Passed value for field obj.raw is not the expected type, validation failed.")
      obj.execution_id.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
      VellumError.validate_raw(obj: obj.error)
    end
  end
end
