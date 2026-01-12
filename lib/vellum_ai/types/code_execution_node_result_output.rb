# frozen_string_literal: true
require "json"
require_relative "code_execution_node_string_result"
require_relative "code_execution_node_number_result"
require_relative "code_execution_node_json_result"
require_relative "code_execution_node_chat_history_result"
require_relative "code_execution_node_search_results_result"
require_relative "code_execution_node_error_result"
require_relative "code_execution_node_array_result"
require_relative "code_execution_node_function_call_result"

module Vellum
  class CodeExecutionNodeResultOutput
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::CodeExecutionNodeResultOutput]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of CodeExecutionNodeResultOutput
    #
    # @param json_object [String] 
    # @return [Vellum::CodeExecutionNodeResultOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::CodeExecutionNodeStringResult.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::CodeExecutionNodeNumberResult.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::CodeExecutionNodeJSONResult.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::CodeExecutionNodeChatHistoryResult.from_json(json_object: json_object)
      when "SEARCH_RESULTS"
        member = Vellum::CodeExecutionNodeSearchResultsResult.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::CodeExecutionNodeErrorResult.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::CodeExecutionNodeArrayResult.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::CodeExecutionNodeFunctionCallResult.from_json(json_object: json_object)
      else
        member = Vellum::CodeExecutionNodeStringResult.from_json(json_object: json_object)
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
        Vellum::CodeExecutionNodeStringResult.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::CodeExecutionNodeNumberResult.validate_raw(obj: obj)
      when "JSON"
        Vellum::CodeExecutionNodeJSONResult.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::CodeExecutionNodeChatHistoryResult.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        Vellum::CodeExecutionNodeSearchResultsResult.validate_raw(obj: obj)
      when "ERROR"
        Vellum::CodeExecutionNodeErrorResult.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::CodeExecutionNodeArrayResult.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::CodeExecutionNodeFunctionCallResult.validate_raw(obj: obj)
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
    # @param member [Vellum::CodeExecutionNodeStringResult] 
    # @return [Vellum::CodeExecutionNodeResultOutput]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::CodeExecutionNodeNumberResult] 
    # @return [Vellum::CodeExecutionNodeResultOutput]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::CodeExecutionNodeJSONResult] 
    # @return [Vellum::CodeExecutionNodeResultOutput]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::CodeExecutionNodeChatHistoryResult] 
    # @return [Vellum::CodeExecutionNodeResultOutput]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::CodeExecutionNodeSearchResultsResult] 
    # @return [Vellum::CodeExecutionNodeResultOutput]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end
    # @param member [Vellum::CodeExecutionNodeErrorResult] 
    # @return [Vellum::CodeExecutionNodeResultOutput]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
    # @param member [Vellum::CodeExecutionNodeArrayResult] 
    # @return [Vellum::CodeExecutionNodeResultOutput]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
    # @param member [Vellum::CodeExecutionNodeFunctionCallResult] 
    # @return [Vellum::CodeExecutionNodeResultOutput]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
  end
end