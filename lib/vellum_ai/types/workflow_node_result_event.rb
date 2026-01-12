# frozen_string_literal: true
require "json"
require_relative "initiated_workflow_node_result_event"
require_relative "streaming_workflow_node_result_event"
require_relative "fulfilled_workflow_node_result_event"
require_relative "rejected_workflow_node_result_event"

module Vellum
  class WorkflowNodeResultEvent
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::WorkflowNodeResultEvent]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of WorkflowNodeResultEvent
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowNodeResultEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.state
      when "INITIATED"
        member = Vellum::InitiatedWorkflowNodeResultEvent.from_json(json_object: json_object)
      when "STREAMING"
        member = Vellum::StreamingWorkflowNodeResultEvent.from_json(json_object: json_object)
      when "FULFILLED"
        member = Vellum::FulfilledWorkflowNodeResultEvent.from_json(json_object: json_object)
      when "REJECTED"
        member = Vellum::RejectedWorkflowNodeResultEvent.from_json(json_object: json_object)
      else
        member = Vellum::InitiatedWorkflowNodeResultEvent.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.state)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "INITIATED"
        { **@member.to_json, state: @discriminant }.to_json
      when "STREAMING"
        { **@member.to_json, state: @discriminant }.to_json
      when "FULFILLED"
        { **@member.to_json, state: @discriminant }.to_json
      when "REJECTED"
        { **@member.to_json, state: @discriminant }.to_json
      else
        { "state": @discriminant, value: @member }.to_json
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
      case obj.state
      when "INITIATED"
        Vellum::InitiatedWorkflowNodeResultEvent.validate_raw(obj: obj)
      when "STREAMING"
        Vellum::StreamingWorkflowNodeResultEvent.validate_raw(obj: obj)
      when "FULFILLED"
        Vellum::FulfilledWorkflowNodeResultEvent.validate_raw(obj: obj)
      when "REJECTED"
        Vellum::RejectedWorkflowNodeResultEvent.validate_raw(obj: obj)
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
    # @param member [Vellum::InitiatedWorkflowNodeResultEvent] 
    # @return [Vellum::WorkflowNodeResultEvent]
    def self.initiated(member:)
      new(member: member, discriminant: "INITIATED")
    end
    # @param member [Vellum::StreamingWorkflowNodeResultEvent] 
    # @return [Vellum::WorkflowNodeResultEvent]
    def self.streaming(member:)
      new(member: member, discriminant: "STREAMING")
    end
    # @param member [Vellum::FulfilledWorkflowNodeResultEvent] 
    # @return [Vellum::WorkflowNodeResultEvent]
    def self.fulfilled(member:)
      new(member: member, discriminant: "FULFILLED")
    end
    # @param member [Vellum::RejectedWorkflowNodeResultEvent] 
    # @return [Vellum::WorkflowNodeResultEvent]
    def self.rejected(member:)
      new(member: member, discriminant: "REJECTED")
    end
  end
end