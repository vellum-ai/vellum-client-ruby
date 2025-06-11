# frozen_string_literal: true
require_relative "prompt_output"
require_relative "fulfilled_prompt_execution_meta"
require "ostruct"
require "json"

module Vellum
# The final data event returned indicating that the stream has ended and all final
#  resolved values from the model can be found.
  class FulfilledExecutePromptEvent
  # @return [String] 
    attr_reader :state
  # @return [Array<Vellum::PromptOutput>] 
    attr_reader :outputs
  # @return [String] 
    attr_reader :execution_id
  # @return [Vellum::FulfilledPromptExecutionMeta] 
    attr_reader :meta
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param state [String] 
    # @param outputs [Array<Vellum::PromptOutput>] 
    # @param execution_id [String] 
    # @param meta [Vellum::FulfilledPromptExecutionMeta] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::FulfilledExecutePromptEvent]
    def initialize(state:, outputs:, execution_id:, meta: OMIT, additional_properties: nil)
      @state = state
      @outputs = outputs
      @execution_id = execution_id
      @meta = meta if meta != OMIT
      @additional_properties = additional_properties
      @_field_set = { "state": state, "outputs": outputs, "execution_id": execution_id, "meta": meta }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of FulfilledExecutePromptEvent
    #
    # @param json_object [String] 
    # @return [Vellum::FulfilledExecutePromptEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      state = parsed_json["state"]
      outputs = parsed_json["outputs"]&.map do | item |
  item = item.to_json
  Vellum::PromptOutput.from_json(json_object: item)
end
      execution_id = parsed_json["execution_id"]
      unless parsed_json["meta"].nil?
        meta = parsed_json["meta"].to_json
        meta = Vellum::FulfilledPromptExecutionMeta.from_json(json_object: meta)
      else
        meta = nil
      end
      new(
        state: state,
        outputs: outputs,
        execution_id: execution_id,
        meta: meta,
        additional_properties: struct
      )
    end
# Serialize an instance of FulfilledExecutePromptEvent to a JSON object
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
      obj.outputs.is_a?(Array) != false || raise("Passed value for field obj.outputs is not the expected type, validation failed.")
      obj.execution_id.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
      obj.meta.nil? || Vellum::FulfilledPromptExecutionMeta.validate_raw(obj: obj.meta)
    end
  end
end