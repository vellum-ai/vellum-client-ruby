# frozen_string_literal: true

require "json"

module Vellum
  class TestSuiteRunTestSuite
    attr_reader :id, :history_item_id, :label, :additional_properties

    # @param id [String]
    # @param history_item_id [String]
    # @param label [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TestSuiteRunTestSuite]
    def initialize(id:, history_item_id:, label:, additional_properties: nil)
      # @type [String]
      @id = id
      # @type [String]
      @history_item_id = history_item_id
      # @type [String]
      @label = label
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TestSuiteRunTestSuite
    #
    # @param json_object [JSON]
    # @return [TestSuiteRunTestSuite]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      id = struct.id
      history_item_id = struct.history_item_id
      label = struct.label
      new(id: id, history_item_id: history_item_id, label: label, additional_properties: struct)
    end

    # Serialize an instance of TestSuiteRunTestSuite to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "id": @id, "history_item_id": @history_item_id, "label": @label }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
