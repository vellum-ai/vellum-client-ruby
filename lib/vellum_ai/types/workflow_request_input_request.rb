# frozen_string_literal: true

require "json"
require_relative "workflow_request_string_input_request"
require_relative "workflow_request_json_input_request"
require_relative "workflow_request_chat_history_input_request"
require_relative "workflow_request_number_input_request"

module Vellum
  class WorkflowRequestInputRequest
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [WorkflowRequestInputRequest]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of WorkflowRequestInputRequest
    #
    # @param json_object [JSON]
    # @return [WorkflowRequestInputRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "STRING"
                 WorkflowRequestStringInputRequest.from_json(json_object: json_object)
               when "JSON"
                 WorkflowRequestJsonInputRequest.from_json(json_object: json_object)
               when "CHAT_HISTORY"
                 WorkflowRequestChatHistoryInputRequest.from_json(json_object: json_object)
               when "NUMBER"
                 WorkflowRequestNumberInputRequest.from_json(json_object: json_object)
               else
                 WorkflowRequestStringInputRequest.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [JSON]
    def to_json(*_args)
      case @discriminant
      when "STRING"
        { **@member.to_json, type: @discriminant }.to_json
      when "JSON"
        { **@member.to_json, type: @discriminant }.to_json
      when "CHAT_HISTORY"
        { **@member.to_json, type: @discriminant }.to_json
      when "NUMBER"
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
      when "STRING"
        WorkflowRequestStringInputRequest.validate_raw(obj: obj)
      when "JSON"
        WorkflowRequestJsonInputRequest.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        WorkflowRequestChatHistoryInputRequest.validate_raw(obj: obj)
      when "NUMBER"
        WorkflowRequestNumberInputRequest.validate_raw(obj: obj)
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

    # @param member [WorkflowRequestStringInputRequest]
    # @return [WorkflowRequestInputRequest]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end

    # @param member [WorkflowRequestJsonInputRequest]
    # @return [WorkflowRequestInputRequest]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end

    # @param member [WorkflowRequestChatHistoryInputRequest]
    # @return [WorkflowRequestInputRequest]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end

    # @param member [WorkflowRequestNumberInputRequest]
    # @return [WorkflowRequestInputRequest]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
  end
end
