# frozen_string_literal: true
require_relative "vellum_error"
require_relative "rejected_prompt_execution_meta"
require "ostruct"
require "json"

module Vellum
# The final data returned indicating an error occurred during the stream.
  class RejectedExecutePromptEvent
  # @return [String] 
    attr_reader :state
  # @return [Vellum::VellumError] 
    attr_reader :error
  # @return [String] 
    attr_reader :execution_id
  # @return [Vellum::RejectedPromptExecutionMeta] 
    attr_reader :meta
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param state [String] 
    # @param error [Vellum::VellumError] 
    # @param execution_id [String] 
    # @param meta [Vellum::RejectedPromptExecutionMeta] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::RejectedExecutePromptEvent]
    def initialize(state:, error:, execution_id:, meta: OMIT, additional_properties: nil)
      @state = state
      @error = error
      @execution_id = execution_id
      @meta = meta if meta != OMIT
      @additional_properties = additional_properties
      @_field_set = { "state": state, "error": error, "execution_id": execution_id, "meta": meta }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RejectedExecutePromptEvent
    #
    # @param json_object [String] 
    # @return [Vellum::RejectedExecutePromptEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      state = parsed_json["state"]
      unless parsed_json["error"].nil?
        error = parsed_json["error"].to_json
        error = Vellum::VellumError.from_json(json_object: error)
      else
        error = nil
      end
      execution_id = parsed_json["execution_id"]
      unless parsed_json["meta"].nil?
        meta = parsed_json["meta"].to_json
        meta = Vellum::RejectedPromptExecutionMeta.from_json(json_object: meta)
      else
        meta = nil
      end
      new(
        state: state,
        error: error,
        execution_id: execution_id,
        meta: meta,
        additional_properties: struct
      )
    end
# Serialize an instance of RejectedExecutePromptEvent to a JSON object
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
      obj.state.is_a?(String) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
      Vellum::VellumError.validate_raw(obj: obj.error)
      obj.execution_id.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
      obj.meta.nil? || Vellum::RejectedPromptExecutionMeta.validate_raw(obj: obj.meta)
    end
  end
end