# frozen_string_literal: true

require "json"
require_relative "test_suite_run_execution_string_output"
require_relative "test_suite_run_execution_number_output"
require_relative "test_suite_run_execution_json_output"
require_relative "test_suite_run_execution_chat_history_output"
require_relative "test_suite_run_execution_search_results_output"
require_relative "test_suite_run_execution_error_output"

module Vellum
  class TestSuiteRunExecutionOutput
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [TestSuiteRunExecutionOutput]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of TestSuiteRunExecutionOutput
    #
    # @param json_object [JSON]
    # @return [TestSuiteRunExecutionOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "STRING"
                 TestSuiteRunExecutionStringOutput.from_json(json_object: json_object)
               when "NUMBER"
                 TestSuiteRunExecutionNumberOutput.from_json(json_object: json_object)
               when "JSON"
                 TestSuiteRunExecutionJsonOutput.from_json(json_object: json_object)
               when "CHAT_HISTORY"
                 TestSuiteRunExecutionChatHistoryOutput.from_json(json_object: json_object)
               when "SEARCH_RESULTS"
                 TestSuiteRunExecutionSearchResultsOutput.from_json(json_object: json_object)
               when "ERROR"
                 TestSuiteRunExecutionErrorOutput.from_json(json_object: json_object)
               else
                 TestSuiteRunExecutionStringOutput.from_json(json_object: json_object)
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
        TestSuiteRunExecutionStringOutput.validate_raw(obj: obj)
      when "NUMBER"
        TestSuiteRunExecutionNumberOutput.validate_raw(obj: obj)
      when "JSON"
        TestSuiteRunExecutionJsonOutput.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        TestSuiteRunExecutionChatHistoryOutput.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        TestSuiteRunExecutionSearchResultsOutput.validate_raw(obj: obj)
      when "ERROR"
        TestSuiteRunExecutionErrorOutput.validate_raw(obj: obj)
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

    # @param member [TestSuiteRunExecutionStringOutput]
    # @return [TestSuiteRunExecutionOutput]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end

    # @param member [TestSuiteRunExecutionNumberOutput]
    # @return [TestSuiteRunExecutionOutput]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end

    # @param member [TestSuiteRunExecutionJsonOutput]
    # @return [TestSuiteRunExecutionOutput]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end

    # @param member [TestSuiteRunExecutionChatHistoryOutput]
    # @return [TestSuiteRunExecutionOutput]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end

    # @param member [TestSuiteRunExecutionSearchResultsOutput]
    # @return [TestSuiteRunExecutionOutput]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end

    # @param member [TestSuiteRunExecutionErrorOutput]
    # @return [TestSuiteRunExecutionOutput]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
  end
end
