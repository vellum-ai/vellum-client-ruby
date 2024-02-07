# frozen_string_literal: true

require "json"

module Vellum
  # The subset of the metadata tracked by Vellum during prompt execution that the request opted into with `expand_meta`.
  class StreamingPromptExecutionMeta
    attr_reader :latency, :additional_properties

    # @param latency [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [StreamingPromptExecutionMeta]
    def initialize(latency: nil, additional_properties: nil)
      # @type [Integer]
      @latency = latency
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of StreamingPromptExecutionMeta
    #
    # @param json_object [JSON]
    # @return [StreamingPromptExecutionMeta]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      latency = struct.latency
      new(latency: latency, additional_properties: struct)
    end

    # Serialize an instance of StreamingPromptExecutionMeta to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "latency": @latency }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.latency&.is_a?(Integer) != false || raise("Passed value for field obj.latency is not the expected type, validation failed.")
    end
  end
end
