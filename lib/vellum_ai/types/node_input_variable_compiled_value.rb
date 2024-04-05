# frozen_string_literal: true

require "json"
require_relative "node_input_compiled_string_value"
require_relative "node_input_compiled_number_value"
require_relative "node_input_compiled_json_value"
require_relative "node_input_compiled_chat_history_value"
require_relative "node_input_compiled_search_results_value"
require_relative "node_input_compiled_error_value"
require_relative "node_input_compiled_array_value"
require_relative "node_input_compiled_function_call"

module Vellum
  class NodeInputVariableCompiledValue
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [NodeInputVariableCompiledValue]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of NodeInputVariableCompiledValue
    #
    # @param json_object [JSON]
    # @return [NodeInputVariableCompiledValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "STRING"
                 NodeInputCompiledStringValue.from_json(json_object: json_object)
               when "NUMBER"
                 NodeInputCompiledNumberValue.from_json(json_object: json_object)
               when "JSON"
                 NodeInputCompiledJsonValue.from_json(json_object: json_object)
               when "CHAT_HISTORY"
                 NodeInputCompiledChatHistoryValue.from_json(json_object: json_object)
               when "SEARCH_RESULTS"
                 NodeInputCompiledSearchResultsValue.from_json(json_object: json_object)
               when "ERROR"
                 NodeInputCompiledErrorValue.from_json(json_object: json_object)
               when "ARRAY"
                 NodeInputCompiledArrayValue.from_json(json_object: json_object)
               when "FUNCTION_CALL"
                 NodeInputCompiledFunctionCall.from_json(json_object: json_object)
               else
                 NodeInputCompiledStringValue.from_json(json_object: json_object)
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
      when "ARRAY"
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
        NodeInputCompiledStringValue.validate_raw(obj: obj)
      when "NUMBER"
        NodeInputCompiledNumberValue.validate_raw(obj: obj)
      when "JSON"
        NodeInputCompiledJsonValue.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        NodeInputCompiledChatHistoryValue.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        NodeInputCompiledSearchResultsValue.validate_raw(obj: obj)
      when "ERROR"
        NodeInputCompiledErrorValue.validate_raw(obj: obj)
      when "ARRAY"
        NodeInputCompiledArrayValue.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        NodeInputCompiledFunctionCall.validate_raw(obj: obj)
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

    # @param member [NodeInputCompiledStringValue]
    # @return [NodeInputVariableCompiledValue]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end

    # @param member [NodeInputCompiledNumberValue]
    # @return [NodeInputVariableCompiledValue]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end

    # @param member [NodeInputCompiledJsonValue]
    # @return [NodeInputVariableCompiledValue]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end

    # @param member [NodeInputCompiledChatHistoryValue]
    # @return [NodeInputVariableCompiledValue]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end

    # @param member [NodeInputCompiledSearchResultsValue]
    # @return [NodeInputVariableCompiledValue]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end

    # @param member [NodeInputCompiledErrorValue]
    # @return [NodeInputVariableCompiledValue]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end

    # @param member [NodeInputCompiledArrayValue]
    # @return [NodeInputVariableCompiledValue]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end

    # @param member [NodeInputCompiledFunctionCall]
    # @return [NodeInputVariableCompiledValue]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
  end
end
