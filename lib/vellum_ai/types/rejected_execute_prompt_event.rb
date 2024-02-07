# frozen_string_literal: true

require_relative "vellum_error"
require_relative "rejected_prompt_execution_meta"
require "json"

module Vellum
  # The final data returned indicating an error occurred during the stream.
  class RejectedExecutePromptEvent
    attr_reader :error, :execution_id, :meta, :additional_properties

    # @param error [VellumError]
    # @param execution_id [String]
    # @param meta [RejectedPromptExecutionMeta]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RejectedExecutePromptEvent]
    def initialize(error:, execution_id:, meta: nil, additional_properties: nil)
      # @type [VellumError]
      @error = error
      # @type [String]
      @execution_id = execution_id
      # @type [RejectedPromptExecutionMeta]
      @meta = meta
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of RejectedExecutePromptEvent
    #
    # @param json_object [JSON]
    # @return [RejectedExecutePromptEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["error"].nil?
        error = nil
      else
        error = parsed_json["error"].to_json
        error = VellumError.from_json(json_object: error)
      end
      execution_id = struct.execution_id
      if parsed_json["meta"].nil?
        meta = nil
      else
        meta = parsed_json["meta"].to_json
        meta = RejectedPromptExecutionMeta.from_json(json_object: meta)
      end
      new(error: error, execution_id: execution_id, meta: meta, additional_properties: struct)
    end

    # Serialize an instance of RejectedExecutePromptEvent to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "error": @error, "execution_id": @execution_id, "meta": @meta }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      VellumError.validate_raw(obj: obj.error)
      obj.execution_id.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
      obj.meta.nil? || RejectedPromptExecutionMeta.validate_raw(obj: obj.meta)
    end
  end
end
