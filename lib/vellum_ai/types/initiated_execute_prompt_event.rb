# frozen_string_literal: true
require_relative "initiated_prompt_execution_meta"
require "ostruct"
require "json"

module Vellum
# The initial data returned indicating that the response from the model has
#  returned and begun streaming.
  class InitiatedExecutePromptEvent
  # @return [String] 
    attr_reader :state
  # @return [Vellum::InitiatedPromptExecutionMeta] 
    attr_reader :meta
  # @return [String] 
    attr_reader :execution_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param state [String] 
    # @param meta [Vellum::InitiatedPromptExecutionMeta] 
    # @param execution_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::InitiatedExecutePromptEvent]
    def initialize(state:, meta: OMIT, execution_id:, additional_properties: nil)
      @state = state
      @meta = meta if meta != OMIT
      @execution_id = execution_id
      @additional_properties = additional_properties
      @_field_set = { "state": state, "meta": meta, "execution_id": execution_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of InitiatedExecutePromptEvent
    #
    # @param json_object [String] 
    # @return [Vellum::InitiatedExecutePromptEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      state = parsed_json["state"]
      unless parsed_json["meta"].nil?
        meta = parsed_json["meta"].to_json
        meta = Vellum::InitiatedPromptExecutionMeta.from_json(json_object: meta)
      else
        meta = nil
      end
      execution_id = parsed_json["execution_id"]
      new(
        state: state,
        meta: meta,
        execution_id: execution_id,
        additional_properties: struct
      )
    end
# Serialize an instance of InitiatedExecutePromptEvent to a JSON object
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
      obj.meta.nil? || Vellum::InitiatedPromptExecutionMeta.validate_raw(obj: obj.meta)
      obj.execution_id.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
    end
  end
end