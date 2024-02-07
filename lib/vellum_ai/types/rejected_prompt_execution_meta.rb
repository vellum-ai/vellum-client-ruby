# frozen_string_literal: true

require_relative "finish_reason_enum"
require "json"

module Vellum
  # The subset of the metadata tracked by Vellum during prompt execution that the request opted into with `expand_meta`.
  class RejectedPromptExecutionMeta
    attr_reader :latency, :finish_reason, :additional_properties

    # @param latency [Integer]
    # @param finish_reason [FINISH_REASON_ENUM]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RejectedPromptExecutionMeta]
    def initialize(latency: nil, finish_reason: nil, additional_properties: nil)
      # @type [Integer]
      @latency = latency
      # @type [FINISH_REASON_ENUM]
      @finish_reason = finish_reason
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of RejectedPromptExecutionMeta
    #
    # @param json_object [JSON]
    # @return [RejectedPromptExecutionMeta]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      latency = struct.latency
      finish_reason = FINISH_REASON_ENUM.key(parsed_json["finish_reason"]) || parsed_json["finish_reason"]
      new(latency: latency, finish_reason: finish_reason, additional_properties: struct)
    end

    # Serialize an instance of RejectedPromptExecutionMeta to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "latency": @latency, "finish_reason": FINISH_REASON_ENUM[@finish_reason] || @finish_reason }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.latency&.is_a?(Integer) != false || raise("Passed value for field obj.latency is not the expected type, validation failed.")
      obj.finish_reason&.is_a?(FINISH_REASON_ENUM) != false || raise("Passed value for field obj.finish_reason is not the expected type, validation failed.")
    end
  end
end
