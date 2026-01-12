# frozen_string_literal: true
require "json"
require_relative "test_suite_run_execution_string_output"
require_relative "test_suite_run_execution_number_output"
require_relative "test_suite_run_execution_json_output"
require_relative "test_suite_run_execution_chat_history_output"
require_relative "test_suite_run_execution_search_results_output"
require_relative "test_suite_run_execution_error_output"
require_relative "test_suite_run_execution_function_call_output"
require_relative "test_suite_run_execution_array_output"

module Vellum
  class TestSuiteRunExecutionOutput
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::TestSuiteRunExecutionOutput]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of TestSuiteRunExecutionOutput
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunExecutionOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::TestSuiteRunExecutionStringOutput.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::TestSuiteRunExecutionNumberOutput.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::TestSuiteRunExecutionJSONOutput.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::TestSuiteRunExecutionChatHistoryOutput.from_json(json_object: json_object)
      when "SEARCH_RESULTS"
        member = Vellum::TestSuiteRunExecutionSearchResultsOutput.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::TestSuiteRunExecutionErrorOutput.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::TestSuiteRunExecutionFunctionCallOutput.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::TestSuiteRunExecutionArrayOutput.from_json(json_object: json_object)
      else
        member = Vellum::TestSuiteRunExecutionStringOutput.from_json(json_object: json_object)
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
      when "FUNCTION_CALL"
        { **@member.to_json, type: @discriminant }.to_json
      when "ARRAY"
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
        Vellum::TestSuiteRunExecutionStringOutput.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::TestSuiteRunExecutionNumberOutput.validate_raw(obj: obj)
      when "JSON"
        Vellum::TestSuiteRunExecutionJSONOutput.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::TestSuiteRunExecutionChatHistoryOutput.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        Vellum::TestSuiteRunExecutionSearchResultsOutput.validate_raw(obj: obj)
      when "ERROR"
        Vellum::TestSuiteRunExecutionErrorOutput.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::TestSuiteRunExecutionFunctionCallOutput.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::TestSuiteRunExecutionArrayOutput.validate_raw(obj: obj)
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
    # @param member [Vellum::TestSuiteRunExecutionStringOutput] 
    # @return [Vellum::TestSuiteRunExecutionOutput]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::TestSuiteRunExecutionNumberOutput] 
    # @return [Vellum::TestSuiteRunExecutionOutput]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::TestSuiteRunExecutionJSONOutput] 
    # @return [Vellum::TestSuiteRunExecutionOutput]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::TestSuiteRunExecutionChatHistoryOutput] 
    # @return [Vellum::TestSuiteRunExecutionOutput]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::TestSuiteRunExecutionSearchResultsOutput] 
    # @return [Vellum::TestSuiteRunExecutionOutput]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end
    # @param member [Vellum::TestSuiteRunExecutionErrorOutput] 
    # @return [Vellum::TestSuiteRunExecutionOutput]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
    # @param member [Vellum::TestSuiteRunExecutionFunctionCallOutput] 
    # @return [Vellum::TestSuiteRunExecutionOutput]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::TestSuiteRunExecutionArrayOutput] 
    # @return [Vellum::TestSuiteRunExecutionOutput]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
  end
end