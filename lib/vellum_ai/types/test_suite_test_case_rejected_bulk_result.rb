# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# The result of a bulk operation that failed to operate on a Test Case.
  class TestSuiteTestCaseRejectedBulkResult
  # @return [String] An ID that maps back to one of the initially supplied operations. Can be used to
#  determine the result of a given operation.
    attr_reader :id
  # @return [String] 
    attr_reader :type
  # @return [Hash{String => Object}] Details about the error that occurred
    attr_reader :data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] An ID that maps back to one of the initially supplied operations. Can be used to
#  determine the result of a given operation.
    # @param type [String] 
    # @param data [Hash{String => Object}] Details about the error that occurred
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteTestCaseRejectedBulkResult]
    def initialize(id: OMIT, type:, data:, additional_properties: nil)
      @id = id if id != OMIT
      @type = type
      @data = data
      @additional_properties = additional_properties
      @_field_set = { "id": id, "type": type, "data": data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of TestSuiteTestCaseRejectedBulkResult
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteTestCaseRejectedBulkResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      type = parsed_json["type"]
      data = parsed_json["data"]
      new(
        id: id,
        type: type,
        data: data,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteTestCaseRejectedBulkResult to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.data.is_a?(Hash) != false || raise("Passed value for field obj.data is not the expected type, validation failed.")
    end
  end
end