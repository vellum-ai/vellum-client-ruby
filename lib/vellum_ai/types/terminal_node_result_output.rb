# frozen_string_literal: true
require "json"
require_relative "terminal_node_string_result"
require_relative "terminal_node_number_result"
require_relative "terminal_node_json_result"
require_relative "terminal_node_chat_history_result"
require_relative "terminal_node_search_results_result"
require_relative "terminal_node_error_result"
require_relative "terminal_node_array_result"
require_relative "terminal_node_function_call_result"

module Vellum
  class TerminalNodeResultOutput
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::TerminalNodeResultOutput]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of TerminalNodeResultOutput
    #
    # @param json_object [String] 
    # @return [Vellum::TerminalNodeResultOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::TerminalNodeStringResult.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::TerminalNodeNumberResult.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::TerminalNodeJSONResult.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::TerminalNodeChatHistoryResult.from_json(json_object: json_object)
      when "SEARCH_RESULTS"
        member = Vellum::TerminalNodeSearchResultsResult.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::TerminalNodeErrorResult.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::TerminalNodeArrayResult.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::TerminalNodeFunctionCallResult.from_json(json_object: json_object)
      else
        member = Vellum::TerminalNodeStringResult.from_json(json_object: json_object)
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
        Vellum::TerminalNodeStringResult.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::TerminalNodeNumberResult.validate_raw(obj: obj)
      when "JSON"
        Vellum::TerminalNodeJSONResult.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::TerminalNodeChatHistoryResult.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        Vellum::TerminalNodeSearchResultsResult.validate_raw(obj: obj)
      when "ERROR"
        Vellum::TerminalNodeErrorResult.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::TerminalNodeArrayResult.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::TerminalNodeFunctionCallResult.validate_raw(obj: obj)
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
    # @param member [Vellum::TerminalNodeStringResult] 
    # @return [Vellum::TerminalNodeResultOutput]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::TerminalNodeNumberResult] 
    # @return [Vellum::TerminalNodeResultOutput]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::TerminalNodeJSONResult] 
    # @return [Vellum::TerminalNodeResultOutput]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::TerminalNodeChatHistoryResult] 
    # @return [Vellum::TerminalNodeResultOutput]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::TerminalNodeSearchResultsResult] 
    # @return [Vellum::TerminalNodeResultOutput]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end
    # @param member [Vellum::TerminalNodeErrorResult] 
    # @return [Vellum::TerminalNodeResultOutput]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
    # @param member [Vellum::TerminalNodeArrayResult] 
    # @return [Vellum::TerminalNodeResultOutput]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
    # @param member [Vellum::TerminalNodeFunctionCallResult] 
    # @return [Vellum::TerminalNodeResultOutput]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
  end
end