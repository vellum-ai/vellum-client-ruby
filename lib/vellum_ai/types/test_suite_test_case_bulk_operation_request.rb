# frozen_string_literal: true
require "json"
require_relative "test_suite_test_case_create_bulk_operation_request"
require_relative "test_suite_test_case_replace_bulk_operation_request"
require_relative "test_suite_test_case_upsert_bulk_operation_request"
require_relative "test_suite_test_case_delete_bulk_operation_request"

module Vellum
  class TestSuiteTestCaseBulkOperationRequest
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::TestSuiteTestCaseBulkOperationRequest]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of
#  TestSuiteTestCaseBulkOperationRequest
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteTestCaseBulkOperationRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "CREATE"
        member = Vellum::TestSuiteTestCaseCreateBulkOperationRequest.from_json(json_object: json_object)
      when "REPLACE"
        member = Vellum::TestSuiteTestCaseReplaceBulkOperationRequest.from_json(json_object: json_object)
      when "UPSERT"
        member = Vellum::TestSuiteTestCaseUpsertBulkOperationRequest.from_json(json_object: json_object)
      when "DELETE"
        member = Vellum::TestSuiteTestCaseDeleteBulkOperationRequest.from_json(json_object: json_object)
      else
        member = Vellum::TestSuiteTestCaseCreateBulkOperationRequest.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "CREATE"
        { **@member.to_json, type: @discriminant }.to_json
      when "REPLACE"
        { **@member.to_json, type: @discriminant }.to_json
      when "UPSERT"
        { **@member.to_json, type: @discriminant }.to_json
      when "DELETE"
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
      when "CREATE"
        Vellum::TestSuiteTestCaseCreateBulkOperationRequest.validate_raw(obj: obj)
      when "REPLACE"
        Vellum::TestSuiteTestCaseReplaceBulkOperationRequest.validate_raw(obj: obj)
      when "UPSERT"
        Vellum::TestSuiteTestCaseUpsertBulkOperationRequest.validate_raw(obj: obj)
      when "DELETE"
        Vellum::TestSuiteTestCaseDeleteBulkOperationRequest.validate_raw(obj: obj)
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
    # @param member [Vellum::TestSuiteTestCaseCreateBulkOperationRequest] 
    # @return [Vellum::TestSuiteTestCaseBulkOperationRequest]
    def self.create(member:)
      new(member: member, discriminant: "CREATE")
    end
    # @param member [Vellum::TestSuiteTestCaseReplaceBulkOperationRequest] 
    # @return [Vellum::TestSuiteTestCaseBulkOperationRequest]
    def self.replace(member:)
      new(member: member, discriminant: "REPLACE")
    end
    # @param member [Vellum::TestSuiteTestCaseUpsertBulkOperationRequest] 
    # @return [Vellum::TestSuiteTestCaseBulkOperationRequest]
    def self.upsert(member:)
      new(member: member, discriminant: "UPSERT")
    end
    # @param member [Vellum::TestSuiteTestCaseDeleteBulkOperationRequest] 
    # @return [Vellum::TestSuiteTestCaseBulkOperationRequest]
    def self.delete(member:)
      new(member: member, discriminant: "DELETE")
    end
  end
end