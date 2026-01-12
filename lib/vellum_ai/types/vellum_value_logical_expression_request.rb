# frozen_string_literal: true
require "json"
require_relative "vellum_value_logical_condition_request"
require_relative "vellum_value_logical_condition_group_request"

module Vellum
  class VellumValueLogicalExpressionRequest
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::VellumValueLogicalExpressionRequest]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of VellumValueLogicalExpressionRequest
    #
    # @param json_object [String] 
    # @return [Vellum::VellumValueLogicalExpressionRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "LOGICAL_CONDITION"
        member = Vellum::VellumValueLogicalConditionRequest.from_json(json_object: json_object)
      when "LOGICAL_CONDITION_GROUP"
        member = Vellum::VellumValueLogicalConditionGroupRequest.from_json(json_object: json_object)
      else
        member = Vellum::VellumValueLogicalConditionRequest.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "LOGICAL_CONDITION"
        { **@member.to_json, type: @discriminant }.to_json
      when "LOGICAL_CONDITION_GROUP"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "LOGICAL_CONDITION"
        Vellum::VellumValueLogicalConditionRequest.validate_raw(obj: obj)
      when "LOGICAL_CONDITION_GROUP"
        Vellum::VellumValueLogicalConditionGroupRequest.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
# For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object] 
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end
    # @param member [Vellum::VellumValueLogicalConditionRequest] 
    # @return [Vellum::VellumValueLogicalExpressionRequest]
    def self.logical_condition(member:)
      new(member: member, discriminant: "LOGICAL_CONDITION")
    end
    # @param member [Vellum::VellumValueLogicalConditionGroupRequest] 
    # @return [Vellum::VellumValueLogicalExpressionRequest]
    def self.logical_condition_group(member:)
      new(member: member, discriminant: "LOGICAL_CONDITION_GROUP")
    end
  end
end