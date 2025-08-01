# frozen_string_literal: true
require_relative "upsert_test_suite_test_case_request"
require "ostruct"
require "json"

module Vellum
# A bulk operation that represents the upserting of a Test Case.
  class TestSuiteTestCaseUpsertBulkOperationRequest
  # @return [String] An ID representing this specific operation. Can later be used to look up
#  information about the operation's success in the response.
    attr_reader :id
  # @return [String] 
    attr_reader :type
  # @return [Vellum::UpsertTestSuiteTestCaseRequest] 
    attr_reader :data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] An ID representing this specific operation. Can later be used to look up
#  information about the operation's success in the response.
    # @param type [String] 
    # @param data [Vellum::UpsertTestSuiteTestCaseRequest] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteTestCaseUpsertBulkOperationRequest]
    def initialize(id:, type:, data:, additional_properties: nil)
      @id = id
      @type = type
      @data = data
      @additional_properties = additional_properties
      @_field_set = { "id": id, "type": type, "data": data }
    end
# Deserialize a JSON object to an instance of
#  TestSuiteTestCaseUpsertBulkOperationRequest
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteTestCaseUpsertBulkOperationRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      type = parsed_json["type"]
      unless parsed_json["data"].nil?
        data = parsed_json["data"].to_json
        data = Vellum::UpsertTestSuiteTestCaseRequest.from_json(json_object: data)
      else
        data = nil
      end
      new(
        id: id,
        type: type,
        data: data,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteTestCaseUpsertBulkOperationRequest to a JSON
#  object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      Vellum::UpsertTestSuiteTestCaseRequest.validate_raw(obj: obj.data)
    end
  end
end