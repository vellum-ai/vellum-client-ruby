# frozen_string_literal: true
require_relative "iteration_state_enum"
require "ostruct"
require "json"

module Vellum
  class MapNodeResultData
  # @return [Array<String>] 
    attr_reader :execution_ids
  # @return [Vellum::IterationStateEnum] 
    attr_reader :iteration_state
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param execution_ids [Array<String>] 
    # @param iteration_state [Vellum::IterationStateEnum] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::MapNodeResultData]
    def initialize(execution_ids:, iteration_state: OMIT, additional_properties: nil)
      @execution_ids = execution_ids
      @iteration_state = iteration_state if iteration_state != OMIT
      @additional_properties = additional_properties
      @_field_set = { "execution_ids": execution_ids, "iteration_state": iteration_state }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of MapNodeResultData
    #
    # @param json_object [String] 
    # @return [Vellum::MapNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      execution_ids = parsed_json["execution_ids"]
      iteration_state = parsed_json["iteration_state"]
      new(
        execution_ids: execution_ids,
        iteration_state: iteration_state,
        additional_properties: struct
      )
    end
# Serialize an instance of MapNodeResultData to a JSON object
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
      obj.execution_ids.is_a?(Array) != false || raise("Passed value for field obj.execution_ids is not the expected type, validation failed.")
      obj.iteration_state&.is_a?(Vellum::IterationStateEnum) != false || raise("Passed value for field obj.iteration_state is not the expected type, validation failed.")
    end
  end
end