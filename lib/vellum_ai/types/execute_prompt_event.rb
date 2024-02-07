# frozen_string_literal: true

require "json"
require_relative "initiated_execute_prompt_event"
require_relative "streaming_execute_prompt_event"
require_relative "fulfilled_execute_prompt_event"
require_relative "rejected_execute_prompt_event"

module Vellum
  class ExecutePromptEvent
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [ExecutePromptEvent]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of ExecutePromptEvent
    #
    # @param json_object [JSON]
    # @return [ExecutePromptEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.state
               when "INITIATED"
                 InitiatedExecutePromptEvent.from_json(json_object: json_object)
               when "STREAMING"
                 StreamingExecutePromptEvent.from_json(json_object: json_object)
               when "FULFILLED"
                 FulfilledExecutePromptEvent.from_json(json_object: json_object)
               when "REJECTED"
                 RejectedExecutePromptEvent.from_json(json_object: json_object)
               else
                 InitiatedExecutePromptEvent.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.state)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [JSON]
    def to_json(*_args)
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

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.state
      when "INITIATED"
        InitiatedExecutePromptEvent.validate_raw(obj: obj)
      when "STREAMING"
        StreamingExecutePromptEvent.validate_raw(obj: obj)
      when "FULFILLED"
        FulfilledExecutePromptEvent.validate_raw(obj: obj)
      when "REJECTED"
        RejectedExecutePromptEvent.validate_raw(obj: obj)
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

    # @param member [InitiatedExecutePromptEvent]
    # @return [ExecutePromptEvent]
    def self.initiated(member:)
      new(member: member, discriminant: "INITIATED")
    end

    # @param member [StreamingExecutePromptEvent]
    # @return [ExecutePromptEvent]
    def self.streaming(member:)
      new(member: member, discriminant: "STREAMING")
    end

    # @param member [FulfilledExecutePromptEvent]
    # @return [ExecutePromptEvent]
    def self.fulfilled(member:)
      new(member: member, discriminant: "FULFILLED")
    end

    # @param member [RejectedExecutePromptEvent]
    # @return [ExecutePromptEvent]
    def self.rejected(member:)
      new(member: member, discriminant: "REJECTED")
    end
  end
end
