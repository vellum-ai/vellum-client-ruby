# frozen_string_literal: true
require_relative "folder_entity_test_suite_data"
require "ostruct"
require "json"

module Vellum
# A slim representation of a Test Suite, as it exists within a Folder.
  class FolderEntityTestSuite
  # @return [String] 
    attr_reader :id
  # @return [Vellum::FolderEntityTestSuiteData] 
    attr_reader :data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param data [Vellum::FolderEntityTestSuiteData] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::FolderEntityTestSuite]
    def initialize(id:, data:, additional_properties: nil)
      @id = id
      @data = data
      @additional_properties = additional_properties
      @_field_set = { "id": id, "data": data }
    end
# Deserialize a JSON object to an instance of FolderEntityTestSuite
    #
    # @param json_object [String] 
    # @return [Vellum::FolderEntityTestSuite]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      unless parsed_json["data"].nil?
        data = parsed_json["data"].to_json
        data = Vellum::FolderEntityTestSuiteData.from_json(json_object: data)
      else
        data = nil
      end
      new(
        id: id,
        data: data,
        additional_properties: struct
      )
    end
# Serialize an instance of FolderEntityTestSuite to a JSON object
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
      Vellum::FolderEntityTestSuiteData.validate_raw(obj: obj.data)
    end
  end
end