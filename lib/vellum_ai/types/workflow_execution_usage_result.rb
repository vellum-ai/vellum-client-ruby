# frozen_string_literal: true
require_relative "ml_model_usage_wrapper"
require_relative "price"
require_relative "workflow_execution_usage_calculation_error"
require "ostruct"
require "json"

module Vellum
  class WorkflowExecutionUsageResult
  # @return [Array<Vellum::MlModelUsageWrapper>] 
    attr_reader :usage
  # @return [Array<Vellum::Price>] 
    attr_reader :cost
  # @return [Vellum::WorkflowExecutionUsageCalculationError] 
    attr_reader :error
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param usage [Array<Vellum::MlModelUsageWrapper>] 
    # @param cost [Array<Vellum::Price>] 
    # @param error [Vellum::WorkflowExecutionUsageCalculationError] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowExecutionUsageResult]
    def initialize(usage: OMIT, cost: OMIT, error: OMIT, additional_properties: nil)
      @usage = usage if usage != OMIT
      @cost = cost if cost != OMIT
      @error = error if error != OMIT
      @additional_properties = additional_properties
      @_field_set = { "usage": usage, "cost": cost, "error": error }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowExecutionUsageResult
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowExecutionUsageResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      usage = parsed_json["usage"]&.map do | item |
  item = item.to_json
  Vellum::MlModelUsageWrapper.from_json(json_object: item)
end
      cost = parsed_json["cost"]&.map do | item |
  item = item.to_json
  Vellum::Price.from_json(json_object: item)
end
      unless parsed_json["error"].nil?
        error = parsed_json["error"].to_json
        error = Vellum::WorkflowExecutionUsageCalculationError.from_json(json_object: error)
      else
        error = nil
      end
      new(
        usage: usage,
        cost: cost,
        error: error,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowExecutionUsageResult to a JSON object
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
      obj.usage&.is_a?(Array) != false || raise("Passed value for field obj.usage is not the expected type, validation failed.")
      obj.cost&.is_a?(Array) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
      obj.error.nil? || Vellum::WorkflowExecutionUsageCalculationError.validate_raw(obj: obj.error)
    end
  end
end