# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class AdHocExpandMeta
  # @return [Boolean] If enabled, the response will include model host cost tracking. This may
#  increase latency for some model hosts.
    attr_reader :cost
  # @return [Boolean] If enabled, the response will include the model identifier representing the ML
#  Model invoked by the Prompt.
    attr_reader :model_name
  # @return [Boolean] If enabled, the response will include model host usage tracking. This may
#  increase latency for some model hosts.
    attr_reader :usage
  # @return [Boolean] If enabled, the response will include the reason provided by the model for why
#  the execution finished.
    attr_reader :finish_reason
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param cost [Boolean] If enabled, the response will include model host cost tracking. This may
#  increase latency for some model hosts.
    # @param model_name [Boolean] If enabled, the response will include the model identifier representing the ML
#  Model invoked by the Prompt.
    # @param usage [Boolean] If enabled, the response will include model host usage tracking. This may
#  increase latency for some model hosts.
    # @param finish_reason [Boolean] If enabled, the response will include the reason provided by the model for why
#  the execution finished.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::AdHocExpandMeta]
    def initialize(cost: OMIT, model_name: OMIT, usage: OMIT, finish_reason: OMIT, additional_properties: nil)
      @cost = cost if cost != OMIT
      @model_name = model_name if model_name != OMIT
      @usage = usage if usage != OMIT
      @finish_reason = finish_reason if finish_reason != OMIT
      @additional_properties = additional_properties
      @_field_set = { "cost": cost, "model_name": model_name, "usage": usage, "finish_reason": finish_reason }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of AdHocExpandMeta
    #
    # @param json_object [String] 
    # @return [Vellum::AdHocExpandMeta]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      cost = parsed_json["cost"]
      model_name = parsed_json["model_name"]
      usage = parsed_json["usage"]
      finish_reason = parsed_json["finish_reason"]
      new(
        cost: cost,
        model_name: model_name,
        usage: usage,
        finish_reason: finish_reason,
        additional_properties: struct
      )
    end
# Serialize an instance of AdHocExpandMeta to a JSON object
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
      obj.cost&.is_a?(Boolean) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
      obj.model_name&.is_a?(Boolean) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
      obj.usage&.is_a?(Boolean) != false || raise("Passed value for field obj.usage is not the expected type, validation failed.")
      obj.finish_reason&.is_a?(Boolean) != false || raise("Passed value for field obj.finish_reason is not the expected type, validation failed.")
    end
  end
end