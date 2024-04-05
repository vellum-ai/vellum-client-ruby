# frozen_string_literal: true

require "json"
require_relative "templating_node_string_result"
require_relative "templating_node_number_result"
require_relative "templating_node_json_result"
require_relative "templating_node_chat_history_result"
require_relative "templating_node_search_results_result"
require_relative "templating_node_error_result"
require_relative "templating_node_array_result"
require_relative "templating_node_function_call_result"

module Vellum
  class TemplatingNodeResultOutput
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [TemplatingNodeResultOutput]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of TemplatingNodeResultOutput
    #
    # @param json_object [JSON]
    # @return [TemplatingNodeResultOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "STRING"
                 TemplatingNodeStringResult.from_json(json_object: json_object)
               when "NUMBER"
                 TemplatingNodeNumberResult.from_json(json_object: json_object)
               when "JSON"
                 TemplatingNodeJsonResult.from_json(json_object: json_object)
               when "CHAT_HISTORY"
                 TemplatingNodeChatHistoryResult.from_json(json_object: json_object)
               when "SEARCH_RESULTS"
                 TemplatingNodeSearchResultsResult.from_json(json_object: json_object)
               when "ERROR"
                 TemplatingNodeErrorResult.from_json(json_object: json_object)
               when "ARRAY"
                 TemplatingNodeArrayResult.from_json(json_object: json_object)
               when "FUNCTION_CALL"
                 TemplatingNodeFunctionCallResult.from_json(json_object: json_object)
               else
                 TemplatingNodeStringResult.from_json(json_object: json_object)
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
        TemplatingNodeStringResult.validate_raw(obj: obj)
      when "NUMBER"
        TemplatingNodeNumberResult.validate_raw(obj: obj)
      when "JSON"
        TemplatingNodeJsonResult.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        TemplatingNodeChatHistoryResult.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        TemplatingNodeSearchResultsResult.validate_raw(obj: obj)
      when "ERROR"
        TemplatingNodeErrorResult.validate_raw(obj: obj)
      when "ARRAY"
        TemplatingNodeArrayResult.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        TemplatingNodeFunctionCallResult.validate_raw(obj: obj)
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

    # @param member [TemplatingNodeStringResult]
    # @return [TemplatingNodeResultOutput]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end

    # @param member [TemplatingNodeNumberResult]
    # @return [TemplatingNodeResultOutput]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end

    # @param member [TemplatingNodeJsonResult]
    # @return [TemplatingNodeResultOutput]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end

    # @param member [TemplatingNodeChatHistoryResult]
    # @return [TemplatingNodeResultOutput]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end

    # @param member [TemplatingNodeSearchResultsResult]
    # @return [TemplatingNodeResultOutput]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end

    # @param member [TemplatingNodeErrorResult]
    # @return [TemplatingNodeResultOutput]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end

    # @param member [TemplatingNodeArrayResult]
    # @return [TemplatingNodeResultOutput]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end

    # @param member [TemplatingNodeFunctionCallResult]
    # @return [TemplatingNodeResultOutput]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
  end
end
