# frozen_string_literal: true
require_relative "test_suite_test_case_deleted_bulk_result_data"
require "ostruct"
require "json"

module Vellum
# The result of a bulk operation that deleted a Test Case.
  class TestSuiteTestCaseDeletedBulkResult
  # @return [String] An ID that maps back to one of the initially supplied operations. Can be used to
#  determine the result of a given operation.
    attr_reader :id
  # @return [Vellum::TestSuiteTestCaseDeletedBulkResultData] 
    attr_reader :data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] An ID that maps back to one of the initially supplied operations. Can be used to
#  determine the result of a given operation.
    # @param data [Vellum::TestSuiteTestCaseDeletedBulkResultData] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteTestCaseDeletedBulkResult]
    def initialize(id:, data:, additional_properties: nil)
      @id = id
      @data = data
      @additional_properties = additional_properties
      @_field_set = { "id": id, "data": data }
    end
# Deserialize a JSON object to an instance of TestSuiteTestCaseDeletedBulkResult
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteTestCaseDeletedBulkResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      unless parsed_json["data"].nil?
        data = parsed_json["data"].to_json
        data = Vellum::TestSuiteTestCaseDeletedBulkResultData.from_json(json_object: data)
      else
        data = nil
      end
      new(
        id: id,
        data: data,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteTestCaseDeletedBulkResult to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      Vellum::TestSuiteTestCaseDeletedBulkResultData.validate_raw(obj: obj.data)
    end
  end
end