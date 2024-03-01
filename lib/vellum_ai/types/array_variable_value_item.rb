# frozen_string_literal: true

require "json"
require_relative "string_variable_value"
require_relative "number_variable_value"
require_relative "json_variable_value"
require_relative "chat_history_variable_value"
require_relative "search_results_variable_value"
require_relative "error_variable_value"
require_relative "function_call_variable_value"

module Vellum
  class ArrayVariableValueItem
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [ArrayVariableValueItem]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of ArrayVariableValueItem
    #
    # @param json_object [JSON]
    # @return [ArrayVariableValueItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "STRING"
                 StringVariableValue.from_json(json_object: json_object)
               when "NUMBER"
                 NumberVariableValue.from_json(json_object: json_object)
               when "JSON"
                 JsonVariableValue.from_json(json_object: json_object)
               when "CHAT_HISTORY"
                 ChatHistoryVariableValue.from_json(json_object: json_object)
               when "SEARCH_RESULTS"
                 SearchResultsVariableValue.from_json(json_object: json_object)
               when "ERROR"
                 ErrorVariableValue.from_json(json_object: json_object)
               when "FUNCTION_CALL"
                 FunctionCallVariableValue.from_json(json_object: json_object)
               else
                 StringVariableValue.from_json(json_object: json_object)
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
      when "ERROR"
        { **@member.to_json, type: @discriminant }.to_json
      when "FUNCTION_CALL"
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
        StringVariableValue.validate_raw(obj: obj)
      when "NUMBER"
        NumberVariableValue.validate_raw(obj: obj)
      when "JSON"
        JsonVariableValue.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        ChatHistoryVariableValue.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        SearchResultsVariableValue.validate_raw(obj: obj)
      when "ERROR"
        ErrorVariableValue.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        FunctionCallVariableValue.validate_raw(obj: obj)
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

    # @param member [StringVariableValue]
    # @return [ArrayVariableValueItem]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end

    # @param member [NumberVariableValue]
    # @return [ArrayVariableValueItem]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end

    # @param member [JsonVariableValue]
    # @return [ArrayVariableValueItem]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end

    # @param member [ChatHistoryVariableValue]
    # @return [ArrayVariableValueItem]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end

    # @param member [SearchResultsVariableValue]
    # @return [ArrayVariableValueItem]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end

    # @param member [ErrorVariableValue]
    # @return [ArrayVariableValueItem]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end

    # @param member [FunctionCallVariableValue]
    # @return [ArrayVariableValueItem]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
  end
end
