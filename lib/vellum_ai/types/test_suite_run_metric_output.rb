# frozen_string_literal: true

require "json"
require_relative "test_suite_run_metric_number_output"
require_relative "test_suite_run_metric_error_output"

module Vellum
  class TestSuiteRunMetricOutput
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [TestSuiteRunMetricOutput]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of TestSuiteRunMetricOutput
    #
    # @param json_object [JSON]
    # @return [TestSuiteRunMetricOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "NUMBER"
                 TestSuiteRunMetricNumberOutput.from_json(json_object: json_object)
               when "ERROR"
                 TestSuiteRunMetricErrorOutput.from_json(json_object: json_object)
               else
                 TestSuiteRunMetricNumberOutput.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [JSON]
    def to_json(*_args)
      case @discriminant
      when "NUMBER"
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
      when "NUMBER"
        TestSuiteRunMetricNumberOutput.validate_raw(obj: obj)
      when "ERROR"
        TestSuiteRunMetricErrorOutput.validate_raw(obj: obj)
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

    # @param member [TestSuiteRunMetricNumberOutput]
    # @return [TestSuiteRunMetricOutput]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end

    # @param member [TestSuiteRunMetricErrorOutput]
    # @return [TestSuiteRunMetricOutput]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
  end
end
