# frozen_string_literal: true

require "json"
require_relative "test_case_string_variable_value"
require_relative "test_case_number_variable_value"
require_relative "test_case_json_variable_value"
require_relative "test_case_chat_history_variable_value"
require_relative "test_case_search_results_variable_value"
require_relative "test_case_error_variable_value"

module Vellum
  class TestCaseVariableValue
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [TestCaseVariableValue]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of TestCaseVariableValue
    #
    # @param json_object [JSON]
    # @return [TestCaseVariableValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "STRING"
                 TestCaseStringVariableValue.from_json(json_object: json_object)
               when "NUMBER"
                 TestCaseNumberVariableValue.from_json(json_object: json_object)
               when "JSON"
                 TestCaseJsonVariableValue.from_json(json_object: json_object)
               when "CHAT_HISTORY"
                 TestCaseChatHistoryVariableValue.from_json(json_object: json_object)
               when "SEARCH_RESULTS"
                 TestCaseSearchResultsVariableValue.from_json(json_object: json_object)
               when "ERROR"
                 TestCaseErrorVariableValue.from_json(json_object: json_object)
               else
                 TestCaseStringVariableValue.from_json(json_object: json_object)
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
        TestCaseStringVariableValue.validate_raw(obj: obj)
      when "NUMBER"
        TestCaseNumberVariableValue.validate_raw(obj: obj)
      when "JSON"
        TestCaseJsonVariableValue.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        TestCaseChatHistoryVariableValue.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        TestCaseSearchResultsVariableValue.validate_raw(obj: obj)
      when "ERROR"
        TestCaseErrorVariableValue.validate_raw(obj: obj)
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

    # @param member [TestCaseStringVariableValue]
    # @return [TestCaseVariableValue]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end

    # @param member [TestCaseNumberVariableValue]
    # @return [TestCaseVariableValue]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end

    # @param member [TestCaseJsonVariableValue]
    # @return [TestCaseVariableValue]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end

    # @param member [TestCaseChatHistoryVariableValue]
    # @return [TestCaseVariableValue]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end

    # @param member [TestCaseSearchResultsVariableValue]
    # @return [TestCaseVariableValue]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end

    # @param member [TestCaseErrorVariableValue]
    # @return [TestCaseVariableValue]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
  end
end
