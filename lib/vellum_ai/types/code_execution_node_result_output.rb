# frozen_string_literal: true

require "json"
require_relative "code_execution_node_string_result"
require_relative "code_execution_node_number_result"
require_relative "code_execution_node_json_result"
require_relative "code_execution_node_chat_history_result"
require_relative "code_execution_node_search_results_result"
require_relative "code_execution_node_error_result"

module Vellum
  class CodeExecutionNodeResultOutput
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [CodeExecutionNodeResultOutput]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of CodeExecutionNodeResultOutput
    #
    # @param json_object [JSON]
    # @return [CodeExecutionNodeResultOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "STRING"
                 CodeExecutionNodeStringResult.from_json(json_object: json_object)
               when "NUMBER"
                 CodeExecutionNodeNumberResult.from_json(json_object: json_object)
               when "JSON"
                 CodeExecutionNodeJsonResult.from_json(json_object: json_object)
               when "CHAT_HISTORY"
                 CodeExecutionNodeChatHistoryResult.from_json(json_object: json_object)
               when "SEARCH_RESULTS"
                 CodeExecutionNodeSearchResultsResult.from_json(json_object: json_object)
               when "ERROR"
                 CodeExecutionNodeErrorResult.from_json(json_object: json_object)
               else
                 CodeExecutionNodeStringResult.from_json(json_object: json_object)
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
        CodeExecutionNodeStringResult.validate_raw(obj: obj)
      when "NUMBER"
        CodeExecutionNodeNumberResult.validate_raw(obj: obj)
      when "JSON"
        CodeExecutionNodeJsonResult.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        CodeExecutionNodeChatHistoryResult.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        CodeExecutionNodeSearchResultsResult.validate_raw(obj: obj)
      when "ERROR"
        CodeExecutionNodeErrorResult.validate_raw(obj: obj)
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

    # @param member [CodeExecutionNodeStringResult]
    # @return [CodeExecutionNodeResultOutput]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end

    # @param member [CodeExecutionNodeNumberResult]
    # @return [CodeExecutionNodeResultOutput]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end

    # @param member [CodeExecutionNodeJsonResult]
    # @return [CodeExecutionNodeResultOutput]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end

    # @param member [CodeExecutionNodeChatHistoryResult]
    # @return [CodeExecutionNodeResultOutput]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end

    # @param member [CodeExecutionNodeSearchResultsResult]
    # @return [CodeExecutionNodeResultOutput]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end

    # @param member [CodeExecutionNodeErrorResult]
    # @return [CodeExecutionNodeResultOutput]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
  end
end
