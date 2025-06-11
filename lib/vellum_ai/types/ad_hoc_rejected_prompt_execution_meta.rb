# frozen_string_literal: true
require_relative "finish_reason_enum"
require "ostruct"
require "json"

module Vellum
# The subset of the metadata tracked by Vellum during prompt execution that the
#  request opted into with `expand_meta`.
  class AdHocRejectedPromptExecutionMeta
  # @return [Integer] 
    attr_reader :latency
  # @return [Vellum::FinishReasonEnum] 
    attr_reader :finish_reason
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param latency [Integer] 
    # @param finish_reason [Vellum::FinishReasonEnum] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::AdHocRejectedPromptExecutionMeta]
    def initialize(latency: OMIT, finish_reason: OMIT, additional_properties: nil)
      @latency = latency if latency != OMIT
      @finish_reason = finish_reason if finish_reason != OMIT
      @additional_properties = additional_properties
      @_field_set = { "latency": latency, "finish_reason": finish_reason }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AdHocRejectedPromptExecutionMeta
    #
    # @param json_object [String] 
    # @return [Vellum::AdHocRejectedPromptExecutionMeta]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      latency = parsed_json["latency"]
      finish_reason = parsed_json["finish_reason"]
      new(
        latency: latency,
        finish_reason: finish_reason,
        additional_properties: struct
      )
    end
# Serialize an instance of AdHocRejectedPromptExecutionMeta to a JSON object
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
      obj.latency&.is_a?(Integer) != false || raise("Passed value for field obj.latency is not the expected type, validation failed.")
      obj.finish_reason&.is_a?(Vellum::FinishReasonEnum) != false || raise("Passed value for field obj.finish_reason is not the expected type, validation failed.")
    end
  end
end