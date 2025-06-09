# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class TestSuiteRunTestSuite
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :history_item_id
  # @return [String] 
    attr_reader :label
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param history_item_id [String] 
    # @param label [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunTestSuite]
    def initialize(id:, history_item_id:, label:, additional_properties: nil)
      @id = id
      @history_item_id = history_item_id
      @label = label
      @additional_properties = additional_properties
      @_field_set = { "id": id, "history_item_id": history_item_id, "label": label }
    end
# Deserialize a JSON object to an instance of TestSuiteRunTestSuite
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunTestSuite]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      history_item_id = parsed_json["history_item_id"]
      label = parsed_json["label"]
      new(
        id: id,
        history_item_id: history_item_id,
        label: label,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunTestSuite to a JSON object
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
      obj.history_item_id.is_a?(String) != false || raise("Passed value for field obj.history_item_id is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
    end
  end
end