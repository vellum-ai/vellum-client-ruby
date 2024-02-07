# frozen_string_literal: true

require "json"

module Vellum
  class SearchResultMergingRequest
    attr_reader :enabled, :additional_properties

    # @param enabled [Boolean] Whether to enable merging results
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SearchResultMergingRequest]
    def initialize(enabled: nil, additional_properties: nil)
      # @type [Boolean] Whether to enable merging results
      @enabled = enabled
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of SearchResultMergingRequest
    #
    # @param json_object [JSON]
    # @return [SearchResultMergingRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      enabled = struct.enabled
      new(enabled: enabled, additional_properties: struct)
    end

    # Serialize an instance of SearchResultMergingRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "enabled": @enabled }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
    end
  end
end
