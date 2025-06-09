# frozen_string_literal: true
require "json"
require_relative "test_suite_test_case_create_bulk_operation_request"
require_relative "test_suite_test_case_replace_bulk_operation_request"
require_relative "test_suite_test_case_upsert_bulk_operation_request"
require_relative "test_suite_test_case_delete_bulk_operation_request"

module Vellum
  class TestSuiteTestCaseBulkOperationRequest


# Deserialize a JSON object to an instance of
#  TestSuiteTestCaseBulkOperationRequest
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteTestCaseBulkOperationRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::TestSuiteTestCaseCreateBulkOperationRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteTestCaseCreateBulkOperationRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteTestCaseReplaceBulkOperationRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteTestCaseReplaceBulkOperationRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteTestCaseUpsertBulkOperationRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteTestCaseUpsertBulkOperationRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteTestCaseDeleteBulkOperationRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteTestCaseDeleteBulkOperationRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Vellum::TestSuiteTestCaseCreateBulkOperationRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteTestCaseReplaceBulkOperationRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteTestCaseUpsertBulkOperationRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteTestCaseDeleteBulkOperationRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end