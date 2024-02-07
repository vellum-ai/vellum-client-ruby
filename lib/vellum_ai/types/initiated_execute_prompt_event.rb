# frozen_string_literal: true

require_relative "initiated_prompt_execution_meta"
require "json"

module Vellum
  # The initial data returned indicating that the response from the model has returned and begun streaming.
  class InitiatedExecutePromptEvent
    attr_reader :meta, :execution_id, :additional_properties

    # @param meta [InitiatedPromptExecutionMeta]
    # @param execution_id [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [InitiatedExecutePromptEvent]
    def initialize(execution_id:, meta: nil, additional_properties: nil)
      # @type [InitiatedPromptExecutionMeta]
      @meta = meta
      # @type [String]
      @execution_id = execution_id
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of InitiatedExecutePromptEvent
    #
    # @param json_object [JSON]
    # @return [InitiatedExecutePromptEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["meta"].nil?
        meta = nil
      else
        meta = parsed_json["meta"].to_json
        meta = InitiatedPromptExecutionMeta.from_json(json_object: meta)
      end
      execution_id = struct.execution_id
      new(meta: meta, execution_id: execution_id, additional_properties: struct)
    end

    # Serialize an instance of InitiatedExecutePromptEvent to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "meta": @meta, "execution_id": @execution_id }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.meta.nil? || InitiatedPromptExecutionMeta.validate_raw(obj: obj.meta)
      obj.execution_id.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
    end
  end
end
