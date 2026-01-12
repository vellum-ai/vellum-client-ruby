# frozen_string_literal: true
require_relative "vellum_value_logical_expression_request"
require_relative "condition_combinator"
require "ostruct"
require "json"

module Vellum
# A higher-order condition that combines one or more basic conditions or other
#  higher-order conditions.
  class VellumValueLogicalConditionGroupRequest
  # @return [Array<Vellum::VellumValueLogicalExpressionRequest>] 
    attr_reader :conditions
  # @return [Vellum::ConditionCombinator] 
    attr_reader :combinator
  # @return [Boolean] 
    attr_reader :negated
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param conditions [Array<Vellum::VellumValueLogicalExpressionRequest>] 
    # @param combinator [Vellum::ConditionCombinator] 
    # @param negated [Boolean] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::VellumValueLogicalConditionGroupRequest]
    def initialize(conditions:, combinator:, negated:, additional_properties: nil)
      @conditions = conditions
      @combinator = combinator
      @negated = negated
      @additional_properties = additional_properties
      @_field_set = { "conditions": conditions, "combinator": combinator, "negated": negated }
    end
# Deserialize a JSON object to an instance of
#  VellumValueLogicalConditionGroupRequest
    #
    # @param json_object [String] 
    # @return [Vellum::VellumValueLogicalConditionGroupRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      conditions = parsed_json["conditions"]&.map do | item |
  item = item.to_json
  Vellum::VellumValueLogicalExpressionRequest.from_json(json_object: item)
end
      combinator = parsed_json["combinator"]
      negated = parsed_json["negated"]
      new(
        conditions: conditions,
        combinator: combinator,
        negated: negated,
        additional_properties: struct
      )
    end
# Serialize an instance of VellumValueLogicalConditionGroupRequest to a JSON
#  object
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
      obj.conditions.is_a?(Array) != false || raise("Passed value for field obj.conditions is not the expected type, validation failed.")
      obj.combinator.is_a?(Vellum::ConditionCombinator) != false || raise("Passed value for field obj.combinator is not the expected type, validation failed.")
      obj.negated.is_a?(Boolean) != false || raise("Passed value for field obj.negated is not the expected type, validation failed.")
    end
  end
end