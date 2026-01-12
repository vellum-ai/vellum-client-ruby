# frozen_string_literal: true
require "json"
require_relative "workflow_execution_span"
require_relative "node_execution_span"

module Vellum
  class VellumSpan
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::VellumSpan]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of VellumSpan
    #
    # @param json_object [String] 
    # @return [Vellum::VellumSpan]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.name
      when "workflow.execution"
        member = Vellum::WorkflowExecutionSpan.from_json(json_object: json_object)
      when "node.execution"
        member = Vellum::NodeExecutionSpan.from_json(json_object: json_object)
      else
        member = Vellum::WorkflowExecutionSpan.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.name)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "workflow.execution"
        { **@member.to_json, name: @discriminant }.to_json
      when "node.execution"
        { **@member.to_json, name: @discriminant }.to_json
      else
        { "name": @discriminant, value: @member }.to_json
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
      case obj.name
      when "workflow.execution"
        Vellum::WorkflowExecutionSpan.validate_raw(obj: obj)
      when "node.execution"
        Vellum::NodeExecutionSpan.validate_raw(obj: obj)
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
    # @param member [Vellum::WorkflowExecutionSpan] 
    # @return [Vellum::VellumSpan]
    def self.workflow_execution(member:)
      new(member: member, discriminant: "workflow.execution")
    end
    # @param member [Vellum::NodeExecutionSpan] 
    # @return [Vellum::VellumSpan]
    def self.node_execution(member:)
      new(member: member, discriminant: "node.execution")
    end
  end
end