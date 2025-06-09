# frozen_string_literal: true
require "json"
require_relative "test_suite_test_case_created_bulk_result"
require_relative "test_suite_test_case_replaced_bulk_result"
require_relative "test_suite_test_case_deleted_bulk_result"
require_relative "test_suite_test_case_rejected_bulk_result"

module Vellum
  class TestSuiteTestCaseBulkResult


# Deserialize a JSON object to an instance of TestSuiteTestCaseBulkResult
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteTestCaseBulkResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::TestSuiteTestCaseCreatedBulkResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteTestCaseCreatedBulkResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteTestCaseReplacedBulkResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteTestCaseReplacedBulkResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteTestCaseDeletedBulkResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteTestCaseDeletedBulkResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteTestCaseRejectedBulkResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteTestCaseRejectedBulkResult.from_json(json_object: struct)
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
        return Vellum::TestSuiteTestCaseCreatedBulkResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteTestCaseReplacedBulkResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteTestCaseDeletedBulkResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteTestCaseRejectedBulkResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end