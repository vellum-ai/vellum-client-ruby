# frozen_string_literal: true

require "json"
require_relative "workflow_execution_workflow_result_event"
require_relative "workflow_execution_node_result_event"

module Vellum
  class WorkflowStreamEvent
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [WorkflowStreamEvent]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of WorkflowStreamEvent
    #
    # @param json_object [JSON]
    # @return [WorkflowStreamEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "WORKFLOW"
                 WorkflowExecutionWorkflowResultEvent.from_json(json_object: json_object)
               when "NODE"
                 WorkflowExecutionNodeResultEvent.from_json(json_object: json_object)
               else
                 WorkflowExecutionWorkflowResultEvent.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [JSON]
    def to_json(*_args)
      case @discriminant
      when "WORKFLOW"
        { **@member.to_json, type: @discriminant }.to_json
      when "NODE"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "WORKFLOW"
        WorkflowExecutionWorkflowResultEvent.validate_raw(obj: obj)
      when "NODE"
        WorkflowExecutionNodeResultEvent.validate_raw(obj: obj)
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

    # @param member [WorkflowExecutionWorkflowResultEvent]
    # @return [WorkflowStreamEvent]
    def self.workflow(member:)
      new(member: member, discriminant: "WORKFLOW")
    end

    # @param member [WorkflowExecutionNodeResultEvent]
    # @return [WorkflowStreamEvent]
    def self.node(member:)
      new(member: member, discriminant: "NODE")
    end
  end
end
