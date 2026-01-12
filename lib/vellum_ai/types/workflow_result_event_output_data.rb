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
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::WorkflowResultEventOutputData]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of WorkflowResultEventOutputData
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowResultEventOutputData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::WorkflowResultEventOutputDataString.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::WorkflowResultEventOutputDataNumber.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::WorkflowResultEventOutputDataJSON.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::WorkflowResultEventOutputDataChatHistory.from_json(json_object: json_object)
      when "SEARCH_RESULTS"
        member = Vellum::WorkflowResultEventOutputDataSearchResults.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::WorkflowResultEventOutputDataArray.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::WorkflowResultEventOutputDataFunctionCall.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::WorkflowResultEventOutputDataError.from_json(json_object: json_object)
      else
        member = Vellum::WorkflowResultEventOutputDataString.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
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
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "STRING"
        Vellum::WorkflowResultEventOutputDataString.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::WorkflowResultEventOutputDataNumber.validate_raw(obj: obj)
      when "JSON"
        Vellum::WorkflowResultEventOutputDataJSON.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::WorkflowResultEventOutputDataChatHistory.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        Vellum::WorkflowResultEventOutputDataSearchResults.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::WorkflowResultEventOutputDataArray.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::WorkflowResultEventOutputDataFunctionCall.validate_raw(obj: obj)
      when "ERROR"
        Vellum::WorkflowResultEventOutputDataError.validate_raw(obj: obj)
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
    # @param member [Vellum::WorkflowResultEventOutputDataString] 
    # @return [Vellum::WorkflowResultEventOutputData]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::WorkflowResultEventOutputDataNumber] 
    # @return [Vellum::WorkflowResultEventOutputData]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::WorkflowResultEventOutputDataJSON] 
    # @return [Vellum::WorkflowResultEventOutputData]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::WorkflowResultEventOutputDataChatHistory] 
    # @return [Vellum::WorkflowResultEventOutputData]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::WorkflowResultEventOutputDataSearchResults] 
    # @return [Vellum::WorkflowResultEventOutputData]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end
    # @param member [Vellum::WorkflowResultEventOutputDataArray] 
    # @return [Vellum::WorkflowResultEventOutputData]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
    # @param member [Vellum::WorkflowResultEventOutputDataFunctionCall] 
    # @return [Vellum::WorkflowResultEventOutputData]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::WorkflowResultEventOutputDataError] 
    # @return [Vellum::WorkflowResultEventOutputData]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
  end
end