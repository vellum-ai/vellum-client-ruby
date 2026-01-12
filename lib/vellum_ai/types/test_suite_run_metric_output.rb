# frozen_string_literal: true
require "json"
require_relative "test_suite_run_metric_string_output"
require_relative "test_suite_run_metric_number_output"
require_relative "test_suite_run_metric_json_output"
require_relative "test_suite_run_metric_error_output"
require_relative "test_suite_run_metric_array_output"

module Vellum
  class TestSuiteRunMetricOutput
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::TestSuiteRunMetricOutput]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of TestSuiteRunMetricOutput
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunMetricOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::TestSuiteRunMetricStringOutput.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::TestSuiteRunMetricNumberOutput.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::TestSuiteRunMetricJSONOutput.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::TestSuiteRunMetricErrorOutput.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::TestSuiteRunMetricArrayOutput.from_json(json_object: json_object)
      else
        member = Vellum::TestSuiteRunMetricStringOutput.from_json(json_object: json_object)
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
      when "ERROR"
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
        Vellum::TestSuiteRunMetricStringOutput.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::TestSuiteRunMetricNumberOutput.validate_raw(obj: obj)
      when "JSON"
        Vellum::TestSuiteRunMetricJSONOutput.validate_raw(obj: obj)
      when "ERROR"
        Vellum::TestSuiteRunMetricErrorOutput.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::TestSuiteRunMetricArrayOutput.validate_raw(obj: obj)
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
    # @param member [Vellum::TestSuiteRunMetricStringOutput] 
    # @return [Vellum::TestSuiteRunMetricOutput]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::TestSuiteRunMetricNumberOutput] 
    # @return [Vellum::TestSuiteRunMetricOutput]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::TestSuiteRunMetricJSONOutput] 
    # @return [Vellum::TestSuiteRunMetricOutput]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::TestSuiteRunMetricErrorOutput] 
    # @return [Vellum::TestSuiteRunMetricOutput]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
    # @param member [Vellum::TestSuiteRunMetricArrayOutput] 
    # @return [Vellum::TestSuiteRunMetricOutput]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
  end
end