# frozen_string_literal: true

require "json"

module Vellum
  class ConditionalNodeResultData
    attr_reader :source_handle_id, :additional_properties

    # @param source_handle_id [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ConditionalNodeResultData]
    def initialize(source_handle_id: nil, additional_properties: nil)
      # @type [String]
      @source_handle_id = source_handle_id
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of ConditionalNodeResultData
    #
    # @param json_object [JSON]
    # @return [ConditionalNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      source_handle_id = struct.source_handle_id
      new(source_handle_id: source_handle_id, additional_properties: struct)
    end

    # Serialize an instance of ConditionalNodeResultData to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "source_handle_id": @source_handle_id }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.source_handle_id&.is_a?(String) != false || raise("Passed value for field obj.source_handle_id is not the expected type, validation failed.")
    end
  end
end
