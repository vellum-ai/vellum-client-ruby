# frozen_string_literal: true
require "json"
require_relative "node_execution_initiated_event"
require_relative "node_execution_streaming_event"
require_relative "node_execution_fulfilled_event"
require_relative "node_execution_rejected_event"
require_relative "node_execution_paused_event"
require_relative "node_execution_resumed_event"
require_relative "node_execution_log_event"

module Vellum
  class VellumNodeExecutionEvent
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::VellumNodeExecutionEvent]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of VellumNodeExecutionEvent
    #
    # @param json_object [String] 
    # @return [Vellum::VellumNodeExecutionEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.name
      when "node.execution.initiated"
        member = Vellum::NodeExecutionInitiatedEvent.from_json(json_object: json_object)
      when "node.execution.streaming"
        member = Vellum::NodeExecutionStreamingEvent.from_json(json_object: json_object)
      when "node.execution.fulfilled"
        member = Vellum::NodeExecutionFulfilledEvent.from_json(json_object: json_object)
      when "node.execution.rejected"
        member = Vellum::NodeExecutionRejectedEvent.from_json(json_object: json_object)
      when "node.execution.paused"
        member = Vellum::NodeExecutionPausedEvent.from_json(json_object: json_object)
      when "node.execution.resumed"
        member = Vellum::NodeExecutionResumedEvent.from_json(json_object: json_object)
      when "node.execution.log"
        member = Vellum::NodeExecutionLogEvent.from_json(json_object: json_object)
      else
        member = Vellum::NodeExecutionInitiatedEvent.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.name)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "node.execution.initiated"
        { **@member.to_json, name: @discriminant }.to_json
      when "node.execution.streaming"
        { **@member.to_json, name: @discriminant }.to_json
      when "node.execution.fulfilled"
        { **@member.to_json, name: @discriminant }.to_json
      when "node.execution.rejected"
        { **@member.to_json, name: @discriminant }.to_json
      when "node.execution.paused"
        { **@member.to_json, name: @discriminant }.to_json
      when "node.execution.resumed"
        { **@member.to_json, name: @discriminant }.to_json
      when "node.execution.log"
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
      when "node.execution.initiated"
        Vellum::NodeExecutionInitiatedEvent.validate_raw(obj: obj)
      when "node.execution.streaming"
        Vellum::NodeExecutionStreamingEvent.validate_raw(obj: obj)
      when "node.execution.fulfilled"
        Vellum::NodeExecutionFulfilledEvent.validate_raw(obj: obj)
      when "node.execution.rejected"
        Vellum::NodeExecutionRejectedEvent.validate_raw(obj: obj)
      when "node.execution.paused"
        Vellum::NodeExecutionPausedEvent.validate_raw(obj: obj)
      when "node.execution.resumed"
        Vellum::NodeExecutionResumedEvent.validate_raw(obj: obj)
      when "node.execution.log"
        Vellum::NodeExecutionLogEvent.validate_raw(obj: obj)
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
    # @param member [Vellum::NodeExecutionInitiatedEvent] 
    # @return [Vellum::VellumNodeExecutionEvent]
    def self.node_execution_initiated(member:)
      new(member: member, discriminant: "node.execution.initiated")
    end
    # @param member [Vellum::NodeExecutionStreamingEvent] 
    # @return [Vellum::VellumNodeExecutionEvent]
    def self.node_execution_streaming(member:)
      new(member: member, discriminant: "node.execution.streaming")
    end
    # @param member [Vellum::NodeExecutionFulfilledEvent] 
    # @return [Vellum::VellumNodeExecutionEvent]
    def self.node_execution_fulfilled(member:)
      new(member: member, discriminant: "node.execution.fulfilled")
    end
    # @param member [Vellum::NodeExecutionRejectedEvent] 
    # @return [Vellum::VellumNodeExecutionEvent]
    def self.node_execution_rejected(member:)
      new(member: member, discriminant: "node.execution.rejected")
    end
    # @param member [Vellum::NodeExecutionPausedEvent] 
    # @return [Vellum::VellumNodeExecutionEvent]
    def self.node_execution_paused(member:)
      new(member: member, discriminant: "node.execution.paused")
    end
    # @param member [Vellum::NodeExecutionResumedEvent] 
    # @return [Vellum::VellumNodeExecutionEvent]
    def self.node_execution_resumed(member:)
      new(member: member, discriminant: "node.execution.resumed")
    end
    # @param member [Vellum::NodeExecutionLogEvent] 
    # @return [Vellum::VellumNodeExecutionEvent]
    def self.node_execution_log(member:)
      new(member: member, discriminant: "node.execution.log")
    end
  end
end