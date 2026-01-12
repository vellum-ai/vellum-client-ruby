# frozen_string_literal: true
require_relative "vellum_value_request"
require_relative "logical_operator"
require "ostruct"
require "json"

module Vellum
# A basic condition comparing two Vellum values.
  class VellumValueLogicalConditionRequest
  # @return [Vellum::VellumValueRequest] 
    attr_reader :lhs_variable
  # @return [Vellum::LogicalOperator] 
    attr_reader :operator
  # @return [Vellum::VellumValueRequest] 
    attr_reader :rhs_variable
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param lhs_variable [Vellum::VellumValueRequest] 
    # @param operator [Vellum::LogicalOperator] 
    # @param rhs_variable [Vellum::VellumValueRequest] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::VellumValueLogicalConditionRequest]
    def initialize(lhs_variable:, operator:, rhs_variable:, additional_properties: nil)
      @lhs_variable = lhs_variable
      @operator = operator
      @rhs_variable = rhs_variable
      @additional_properties = additional_properties
      @_field_set = { "lhs_variable": lhs_variable, "operator": operator, "rhs_variable": rhs_variable }
    end
# Deserialize a JSON object to an instance of VellumValueLogicalConditionRequest
    #
    # @param json_object [String] 
    # @return [Vellum::VellumValueLogicalConditionRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["lhs_variable"].nil?
        lhs_variable = parsed_json["lhs_variable"].to_json
        lhs_variable = Vellum::VellumValueRequest.from_json(json_object: lhs_variable)
      else
        lhs_variable = nil
      end
      operator = parsed_json["operator"]
      unless parsed_json["rhs_variable"].nil?
        rhs_variable = parsed_json["rhs_variable"].to_json
        rhs_variable = Vellum::VellumValueRequest.from_json(json_object: rhs_variable)
      else
        rhs_variable = nil
      end
      new(
        lhs_variable: lhs_variable,
        operator: operator,
        rhs_variable: rhs_variable,
        additional_properties: struct
      )
    end
# Serialize an instance of VellumValueLogicalConditionRequest to a JSON object
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
      Vellum::VellumValueRequest.validate_raw(obj: obj.lhs_variable)
      obj.operator.is_a?(Vellum::LogicalOperator) != false || raise("Passed value for field obj.operator is not the expected type, validation failed.")
      Vellum::VellumValueRequest.validate_raw(obj: obj.rhs_variable)
    end
  end
end