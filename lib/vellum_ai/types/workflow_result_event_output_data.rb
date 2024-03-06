# frozen_string_literal: true

require "json"
require_relative "workflow_result_event_output_data_string"
require_relative "workflow_result_event_output_data_number"
require_relative "workflow_result_event_output_data_json"
require_relative "workflow_result_event_output_data_chat_history"
require_relative "workflow_result_event_output_data_search_results"
require_relative "workflow_result_event_output_data_array"
require_relative "workflow_result_event_output_data_function_call"
require_relative "workflow_result_event_output_data_error"

module Vellum
  class WorkflowResultEventOutputData
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [WorkflowResultEventOutputData]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of WorkflowResultEventOutputData
    #
    # @param json_object [JSON]
    # @return [WorkflowResultEventOutputData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "STRING"
                 WorkflowResultEventOutputDataString.from_json(json_object: json_object)
               when "NUMBER"
                 WorkflowResultEventOutputDataNumber.from_json(json_object: json_object)
               when "JSON"
                 WorkflowResultEventOutputDataJson.from_json(json_object: json_object)
               when "CHAT_HISTORY"
                 WorkflowResultEventOutputDataChatHistory.from_json(json_object: json_object)
               when "SEARCH_RESULTS"
                 WorkflowResultEventOutputDataSearchResults.from_json(json_object: json_object)
               when "ARRAY"
                 WorkflowResultEventOutputDataArray.from_json(json_object: json_object)
               when "FUNCTION_CALL"
                 WorkflowResultEventOutputDataFunctionCall.from_json(json_object: json_object)
               when "ERROR"
                 WorkflowResultEventOutputDataError.from_json(json_object: json_object)
               else
                 WorkflowResultEventOutputDataString.from_json(json_object: json_object)
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
      when "NUMBER"
        { **@member.to_json, type: @discriminant }.to_json
      when "JSON"
        { **@member.to_json, type: @discriminant }.to_json
      when "CHAT_HISTORY"
        { **@member.to_json, type: @discriminant }.to_json
      when "SEARCH_RESULTS"
        { **@member.to_json, type: @discriminant }.to_json
      when "ARRAY"
        { **@member.to_json, type: @discriminant }.to_json
      when "FUNCTION_CALL"
        { **@member.to_json, type: @discriminant }.to_json
      when "ERROR"
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
        WorkflowResultEventOutputDataString.validate_raw(obj: obj)
      when "NUMBER"
        WorkflowResultEventOutputDataNumber.validate_raw(obj: obj)
      when "JSON"
        WorkflowResultEventOutputDataJson.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        WorkflowResultEventOutputDataChatHistory.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        WorkflowResultEventOutputDataSearchResults.validate_raw(obj: obj)
      when "ARRAY"
        WorkflowResultEventOutputDataArray.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        WorkflowResultEventOutputDataFunctionCall.validate_raw(obj: obj)
      when "ERROR"
        WorkflowResultEventOutputDataError.validate_raw(obj: obj)
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

    # @param member [WorkflowResultEventOutputDataString]
    # @return [WorkflowResultEventOutputData]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end

    # @param member [WorkflowResultEventOutputDataNumber]
    # @return [WorkflowResultEventOutputData]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end

    # @param member [WorkflowResultEventOutputDataJson]
    # @return [WorkflowResultEventOutputData]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end

    # @param member [WorkflowResultEventOutputDataChatHistory]
    # @return [WorkflowResultEventOutputData]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end

    # @param member [WorkflowResultEventOutputDataSearchResults]
    # @return [WorkflowResultEventOutputData]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end

    # @param member [WorkflowResultEventOutputDataArray]
    # @return [WorkflowResultEventOutputData]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end

    # @param member [WorkflowResultEventOutputDataFunctionCall]
    # @return [WorkflowResultEventOutputData]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end

    # @param member [WorkflowResultEventOutputDataError]
    # @return [WorkflowResultEventOutputData]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
  end
end
