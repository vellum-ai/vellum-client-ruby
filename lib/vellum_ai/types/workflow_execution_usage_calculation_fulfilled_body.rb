# frozen_string_literal: true
require_relative "ml_model_usage_wrapper"
require_relative "price"
require "ostruct"
require "json"

module Vellum
  class WorkflowExecutionUsageCalculationFulfilledBody
  # @return [Array<Vellum::MlModelUsageWrapper>] 
    attr_reader :usage
  # @return [Array<Vellum::Price>] 
    attr_reader :cost
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param usage [Array<Vellum::MlModelUsageWrapper>] 
    # @param cost [Array<Vellum::Price>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowExecutionUsageCalculationFulfilledBody]
    def initialize(usage:, cost:, additional_properties: nil)
      @usage = usage
      @cost = cost
      @additional_properties = additional_properties
      @_field_set = { "usage": usage, "cost": cost }
    end
# Deserialize a JSON object to an instance of
#  WorkflowExecutionUsageCalculationFulfilledBody
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowExecutionUsageCalculationFulfilledBody]
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
      new(
        usage: usage,
        cost: cost,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowExecutionUsageCalculationFulfilledBody to a
#  JSON object
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
      obj.usage.is_a?(Array) != false || raise("Passed value for field obj.usage is not the expected type, validation failed.")
      obj.cost.is_a?(Array) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
    end
  end
end