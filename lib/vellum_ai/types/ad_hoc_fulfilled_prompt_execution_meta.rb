# frozen_string_literal: true
require_relative "finish_reason_enum"
require_relative "ml_model_usage"
require_relative "price"
require "ostruct"
require "json"

module Vellum
# The subset of the metadata tracked by Vellum during prompt execution that the
#  request opted into with `expand_meta`.
  class AdHocFulfilledPromptExecutionMeta
  # @return [Integer] 
    attr_reader :latency
  # @return [Vellum::FinishReasonEnum] 
    attr_reader :finish_reason
  # @return [Vellum::MlModelUsage] 
    attr_reader :usage
  # @return [Vellum::Price] 
    attr_reader :cost
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param latency [Integer] 
    # @param finish_reason [Vellum::FinishReasonEnum] 
    # @param usage [Vellum::MlModelUsage] 
    # @param cost [Vellum::Price] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::AdHocFulfilledPromptExecutionMeta]
    def initialize(latency: OMIT, finish_reason: OMIT, usage: OMIT, cost: OMIT, additional_properties: nil)
      @latency = latency if latency != OMIT
      @finish_reason = finish_reason if finish_reason != OMIT
      @usage = usage if usage != OMIT
      @cost = cost if cost != OMIT
      @additional_properties = additional_properties
      @_field_set = { "latency": latency, "finish_reason": finish_reason, "usage": usage, "cost": cost }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AdHocFulfilledPromptExecutionMeta
    #
    # @param json_object [String] 
    # @return [Vellum::AdHocFulfilledPromptExecutionMeta]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      latency = parsed_json["latency"]
      finish_reason = parsed_json["finish_reason"]
      unless parsed_json["usage"].nil?
        usage = parsed_json["usage"].to_json
        usage = Vellum::MlModelUsage.from_json(json_object: usage)
      else
        usage = nil
      end
      unless parsed_json["cost"].nil?
        cost = parsed_json["cost"].to_json
        cost = Vellum::Price.from_json(json_object: cost)
      else
        cost = nil
      end
      new(
        latency: latency,
        finish_reason: finish_reason,
        usage: usage,
        cost: cost,
        additional_properties: struct
      )
    end
# Serialize an instance of AdHocFulfilledPromptExecutionMeta to a JSON object
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
      obj.usage.nil? || Vellum::MlModelUsage.validate_raw(obj: obj.usage)
      obj.cost.nil? || Vellum::Price.validate_raw(obj: obj.cost)
    end
  end
end