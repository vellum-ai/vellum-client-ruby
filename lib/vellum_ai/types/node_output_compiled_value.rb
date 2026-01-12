# frozen_string_literal: true
require "json"
require_relative "node_output_compiled_string_value"
require_relative "node_output_compiled_number_value"
require_relative "node_output_compiled_json_value"
require_relative "node_output_compiled_chat_history_value"
require_relative "node_output_compiled_search_results_value"
require_relative "node_output_compiled_error_value"
require_relative "node_output_compiled_array_value"
require_relative "node_output_compiled_function_call_value"
require_relative "node_output_compiled_thinking_value"

module Vellum
  class NodeOutputCompiledValue
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::NodeOutputCompiledValue]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of NodeOutputCompiledValue
    #
    # @param json_object [String] 
    # @return [Vellum::NodeOutputCompiledValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::NodeOutputCompiledStringValue.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::NodeOutputCompiledNumberValue.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::NodeOutputCompiledJSONValue.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::NodeOutputCompiledChatHistoryValue.from_json(json_object: json_object)
      when "SEARCH_RESULTS"
        member = Vellum::NodeOutputCompiledSearchResultsValue.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::NodeOutputCompiledErrorValue.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::NodeOutputCompiledArrayValue.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::NodeOutputCompiledFunctionCallValue.from_json(json_object: json_object)
      when "THINKING"
        member = Vellum::NodeOutputCompiledThinkingValue.from_json(json_object: json_object)
      else
        member = Vellum::NodeOutputCompiledStringValue.from_json(json_object: json_object)
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
      when "ERROR"
        { **@member.to_json, type: @discriminant }.to_json
      when "ARRAY"
        { **@member.to_json, type: @discriminant }.to_json
      when "FUNCTION_CALL"
        { **@member.to_json, type: @discriminant }.to_json
      when "THINKING"
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
        Vellum::NodeOutputCompiledStringValue.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::NodeOutputCompiledNumberValue.validate_raw(obj: obj)
      when "JSON"
        Vellum::NodeOutputCompiledJSONValue.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::NodeOutputCompiledChatHistoryValue.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        Vellum::NodeOutputCompiledSearchResultsValue.validate_raw(obj: obj)
      when "ERROR"
        Vellum::NodeOutputCompiledErrorValue.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::NodeOutputCompiledArrayValue.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::NodeOutputCompiledFunctionCallValue.validate_raw(obj: obj)
      when "THINKING"
        Vellum::NodeOutputCompiledThinkingValue.validate_raw(obj: obj)
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
    # @param member [Vellum::NodeOutputCompiledStringValue] 
    # @return [Vellum::NodeOutputCompiledValue]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::NodeOutputCompiledNumberValue] 
    # @return [Vellum::NodeOutputCompiledValue]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::NodeOutputCompiledJSONValue] 
    # @return [Vellum::NodeOutputCompiledValue]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::NodeOutputCompiledChatHistoryValue] 
    # @return [Vellum::NodeOutputCompiledValue]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::NodeOutputCompiledSearchResultsValue] 
    # @return [Vellum::NodeOutputCompiledValue]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end
    # @param member [Vellum::NodeOutputCompiledErrorValue] 
    # @return [Vellum::NodeOutputCompiledValue]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
    # @param member [Vellum::NodeOutputCompiledArrayValue] 
    # @return [Vellum::NodeOutputCompiledValue]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
    # @param member [Vellum::NodeOutputCompiledFunctionCallValue] 
    # @return [Vellum::NodeOutputCompiledValue]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::NodeOutputCompiledThinkingValue] 
    # @return [Vellum::NodeOutputCompiledValue]
    def self.thinking(member:)
      new(member: member, discriminant: "THINKING")
    end
  end
end