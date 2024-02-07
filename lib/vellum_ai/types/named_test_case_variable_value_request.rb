# frozen_string_literal: true

require "json"
require_relative "named_test_case_string_variable_value_request"
require_relative "named_test_case_number_variable_value_request"
require_relative "named_test_case_json_variable_value_request"
require_relative "named_test_case_chat_history_variable_value_request"
require_relative "named_test_case_search_results_variable_value_request"
require_relative "named_test_case_error_variable_value_request"

module Vellum
  class NamedTestCaseVariableValueRequest
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [NamedTestCaseVariableValueRequest]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of NamedTestCaseVariableValueRequest
    #
    # @param json_object [JSON]
    # @return [NamedTestCaseVariableValueRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "STRING"
                 NamedTestCaseStringVariableValueRequest.from_json(json_object: json_object)
               when "NUMBER"
                 NamedTestCaseNumberVariableValueRequest.from_json(json_object: json_object)
               when "JSON"
                 NamedTestCaseJsonVariableValueRequest.from_json(json_object: json_object)
               when "CHAT_HISTORY"
                 NamedTestCaseChatHistoryVariableValueRequest.from_json(json_object: json_object)
               when "SEARCH_RESULTS"
                 NamedTestCaseSearchResultsVariableValueRequest.from_json(json_object: json_object)
               when "ERROR"
                 NamedTestCaseErrorVariableValueRequest.from_json(json_object: json_object)
               else
                 NamedTestCaseStringVariableValueRequest.from_json(json_object: json_object)
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
        NamedTestCaseStringVariableValueRequest.validate_raw(obj: obj)
      when "NUMBER"
        NamedTestCaseNumberVariableValueRequest.validate_raw(obj: obj)
      when "JSON"
        NamedTestCaseJsonVariableValueRequest.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        NamedTestCaseChatHistoryVariableValueRequest.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        NamedTestCaseSearchResultsVariableValueRequest.validate_raw(obj: obj)
      when "ERROR"
        NamedTestCaseErrorVariableValueRequest.validate_raw(obj: obj)
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

    # @param member [NamedTestCaseStringVariableValueRequest]
    # @return [NamedTestCaseVariableValueRequest]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end

    # @param member [NamedTestCaseNumberVariableValueRequest]
    # @return [NamedTestCaseVariableValueRequest]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end

    # @param member [NamedTestCaseJsonVariableValueRequest]
    # @return [NamedTestCaseVariableValueRequest]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end

    # @param member [NamedTestCaseChatHistoryVariableValueRequest]
    # @return [NamedTestCaseVariableValueRequest]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end

    # @param member [NamedTestCaseSearchResultsVariableValueRequest]
    # @return [NamedTestCaseVariableValueRequest]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end

    # @param member [NamedTestCaseErrorVariableValueRequest]
    # @return [NamedTestCaseVariableValueRequest]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
  end
end
