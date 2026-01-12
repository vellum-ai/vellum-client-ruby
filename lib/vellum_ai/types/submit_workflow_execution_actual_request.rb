# frozen_string_literal: true
require "json"
require_relative "workflow_execution_actual_string_request"
require_relative "workflow_execution_actual_json_request"
require_relative "workflow_execution_actual_chat_history_request"

module Vellum
  class SubmitWorkflowExecutionActualRequest
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::SubmitWorkflowExecutionActualRequest]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of SubmitWorkflowExecutionActualRequest
    #
    # @param json_object [String] 
    # @return [Vellum::SubmitWorkflowExecutionActualRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.output_type
      when "STRING"
        member = Vellum::WorkflowExecutionActualStringRequest.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::WorkflowExecutionActualJSONRequest.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::WorkflowExecutionActualChatHistoryRequest.from_json(json_object: json_object)
      else
        member = Vellum::WorkflowExecutionActualStringRequest.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.output_type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "STRING"
        { **@member.to_json, output_type: @discriminant }.to_json
      when "JSON"
        { **@member.to_json, output_type: @discriminant }.to_json
      when "CHAT_HISTORY"
        { **@member.to_json, output_type: @discriminant }.to_json
      else
        { "output_type": @discriminant, value: @member }.to_json
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
      case obj.output_type
      when "STRING"
        Vellum::WorkflowExecutionActualStringRequest.validate_raw(obj: obj)
      when "JSON"
        Vellum::WorkflowExecutionActualJSONRequest.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::WorkflowExecutionActualChatHistoryRequest.validate_raw(obj: obj)
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
    # @param member [Vellum::WorkflowExecutionActualStringRequest] 
    # @return [Vellum::SubmitWorkflowExecutionActualRequest]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::WorkflowExecutionActualJSONRequest] 
    # @return [Vellum::SubmitWorkflowExecutionActualRequest]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::WorkflowExecutionActualChatHistoryRequest] 
    # @return [Vellum::SubmitWorkflowExecutionActualRequest]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
  end
end