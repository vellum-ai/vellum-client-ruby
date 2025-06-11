# frozen_string_literal: true
require "json"
require_relative "vellum_value_logical_condition_request"
require_relative "vellum_value_logical_condition_group_request"

module Vellum
  class VellumValueLogicalExpressionRequest


# Deserialize a JSON object to an instance of VellumValueLogicalExpressionRequest
    #
    # @param json_object [String] 
    # @return [Vellum::VellumValueLogicalExpressionRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::VellumValueLogicalConditionRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::VellumValueLogicalConditionRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::VellumValueLogicalConditionGroupRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::VellumValueLogicalConditionGroupRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Vellum::VellumValueLogicalConditionRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::VellumValueLogicalConditionGroupRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end