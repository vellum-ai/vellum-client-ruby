# frozen_string_literal: true

require "json"

module Vellum
  class VellumImageRequest
    attr_reader :src, :metadata, :additional_properties

    # @param src [String]
    # @param metadata [Hash{String => String}]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [VellumImageRequest]
    def initialize(src:, metadata: nil, additional_properties: nil)
      # @type [String]
      @src = src
      # @type [Hash{String => String}]
      @metadata = metadata
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of VellumImageRequest
    #
    # @param json_object [JSON]
    # @return [VellumImageRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      src = struct.src
      metadata = struct.metadata
      new(src: src, metadata: metadata, additional_properties: struct)
    end

    # Serialize an instance of VellumImageRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "src": @src, "metadata": @metadata }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.src.is_a?(String) != false || raise("Passed value for field obj.src is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end
