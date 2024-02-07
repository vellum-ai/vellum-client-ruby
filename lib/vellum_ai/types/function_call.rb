# frozen_string_literal: true

require "json"
require_relative "fulfilled_function_call"
require_relative "rejected_function_call"

module Vellum
  class FunctionCall
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [FunctionCall]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of FunctionCall
    #
    # @param json_object [JSON]
    # @return [FunctionCall]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.state
               when "FULFILLED"
                 FulfilledFunctionCall.from_json(json_object: json_object)
               when "REJECTED"
                 RejectedFunctionCall.from_json(json_object: json_object)
               else
                 FulfilledFunctionCall.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.state)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [JSON]
    def to_json(*_args)
      case @discriminant
      when "FULFILLED"
        { **@member.to_json, state: @discriminant }.to_json
      when "REJECTED"
        { **@member.to_json, state: @discriminant }.to_json
      else
        { "state": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.state
      when "FULFILLED"
        FulfilledFunctionCall.validate_raw(obj: obj)
      when "REJECTED"
        RejectedFunctionCall.validate_raw(obj: obj)
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

    # @param member [FulfilledFunctionCall]
    # @return [FunctionCall]
    def self.fulfilled(member:)
      new(member: member, discriminant: "FULFILLED")
    end

    # @param member [RejectedFunctionCall]
    # @return [FunctionCall]
    def self.rejected(member:)
      new(member: member, discriminant: "REJECTED")
    end
  end
end
