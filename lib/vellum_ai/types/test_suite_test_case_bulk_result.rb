# frozen_string_literal: true
require "json"
require_relative "test_suite_test_case_created_bulk_result"
require_relative "test_suite_test_case_replaced_bulk_result"
require_relative "test_suite_test_case_deleted_bulk_result"
require_relative "test_suite_test_case_rejected_bulk_result"

module Vellum
  class TestSuiteTestCaseBulkResult
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::TestSuiteTestCaseBulkResult]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of TestSuiteTestCaseBulkResult
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteTestCaseBulkResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "CREATED"
        member = Vellum::TestSuiteTestCaseCreatedBulkResult.from_json(json_object: json_object)
      when "REPLACED"
        member = Vellum::TestSuiteTestCaseReplacedBulkResult.from_json(json_object: json_object)
      when "DELETED"
        member = Vellum::TestSuiteTestCaseDeletedBulkResult.from_json(json_object: json_object)
      when "REJECTED"
        member = Vellum::TestSuiteTestCaseRejectedBulkResult.from_json(json_object: json_object)
      else
        member = Vellum::TestSuiteTestCaseCreatedBulkResult.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "CREATED"
        { **@member.to_json, type: @discriminant }.to_json
      when "REPLACED"
        { **@member.to_json, type: @discriminant }.to_json
      when "DELETED"
        { **@member.to_json, type: @discriminant }.to_json
      when "REJECTED"
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
      when "CREATED"
        Vellum::TestSuiteTestCaseCreatedBulkResult.validate_raw(obj: obj)
      when "REPLACED"
        Vellum::TestSuiteTestCaseReplacedBulkResult.validate_raw(obj: obj)
      when "DELETED"
        Vellum::TestSuiteTestCaseDeletedBulkResult.validate_raw(obj: obj)
      when "REJECTED"
        Vellum::TestSuiteTestCaseRejectedBulkResult.validate_raw(obj: obj)
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
    # @param member [Vellum::TestSuiteTestCaseCreatedBulkResult] 
    # @return [Vellum::TestSuiteTestCaseBulkResult]
    def self.created(member:)
      new(member: member, discriminant: "CREATED")
    end
    # @param member [Vellum::TestSuiteTestCaseReplacedBulkResult] 
    # @return [Vellum::TestSuiteTestCaseBulkResult]
    def self.replaced(member:)
      new(member: member, discriminant: "REPLACED")
    end
    # @param member [Vellum::TestSuiteTestCaseDeletedBulkResult] 
    # @return [Vellum::TestSuiteTestCaseBulkResult]
    def self.deleted(member:)
      new(member: member, discriminant: "DELETED")
    end
    # @param member [Vellum::TestSuiteTestCaseRejectedBulkResult] 
    # @return [Vellum::TestSuiteTestCaseBulkResult]
    def self.rejected(member:)
      new(member: member, discriminant: "REJECTED")
    end
  end
end