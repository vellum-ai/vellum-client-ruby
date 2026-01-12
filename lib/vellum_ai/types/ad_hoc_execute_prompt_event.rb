# frozen_string_literal: true
require "json"
require_relative "initiated_ad_hoc_execute_prompt_event"
require_relative "streaming_ad_hoc_execute_prompt_event"
require_relative "fulfilled_ad_hoc_execute_prompt_event"
require_relative "rejected_ad_hoc_execute_prompt_event"

module Vellum
  class AdHocExecutePromptEvent
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::AdHocExecutePromptEvent]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of AdHocExecutePromptEvent
    #
    # @param json_object [String] 
    # @return [Vellum::AdHocExecutePromptEvent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.state
      when "INITIATED"
        member = Vellum::InitiatedAdHocExecutePromptEvent.from_json(json_object: json_object)
      when "STREAMING"
        member = Vellum::StreamingAdHocExecutePromptEvent.from_json(json_object: json_object)
      when "FULFILLED"
        member = Vellum::FulfilledAdHocExecutePromptEvent.from_json(json_object: json_object)
      when "REJECTED"
        member = Vellum::RejectedAdHocExecutePromptEvent.from_json(json_object: json_object)
      else
        member = Vellum::InitiatedAdHocExecutePromptEvent.from_json(json_object: json_object)
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
        Vellum::InitiatedAdHocExecutePromptEvent.validate_raw(obj: obj)
      when "STREAMING"
        Vellum::StreamingAdHocExecutePromptEvent.validate_raw(obj: obj)
      when "FULFILLED"
        Vellum::FulfilledAdHocExecutePromptEvent.validate_raw(obj: obj)
      when "REJECTED"
        Vellum::RejectedAdHocExecutePromptEvent.validate_raw(obj: obj)
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
    # @param member [Vellum::InitiatedAdHocExecutePromptEvent] 
    # @return [Vellum::AdHocExecutePromptEvent]
    def self.initiated(member:)
      new(member: member, discriminant: "INITIATED")
    end
    # @param member [Vellum::StreamingAdHocExecutePromptEvent] 
    # @return [Vellum::AdHocExecutePromptEvent]
    def self.streaming(member:)
      new(member: member, discriminant: "STREAMING")
    end
    # @param member [Vellum::FulfilledAdHocExecutePromptEvent] 
    # @return [Vellum::AdHocExecutePromptEvent]
    def self.fulfilled(member:)
      new(member: member, discriminant: "FULFILLED")
    end
    # @param member [Vellum::RejectedAdHocExecutePromptEvent] 
    # @return [Vellum::AdHocExecutePromptEvent]
    def self.rejected(member:)
      new(member: member, discriminant: "REJECTED")
    end
  end
end