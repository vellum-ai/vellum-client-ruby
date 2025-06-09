# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class WorkflowExpandMetaRequest
  # @return [Boolean] If enabled, the Prompt Node FULFILLED events will include model host usage
#  tracking. This may increase latency for some model hosts.
    attr_reader :usage
  # @return [Boolean] If enabled, the Prompt Node FULFILLED events will include model host cost
#  tracking. This may increase latency for some model hosts.
    attr_reader :cost
  # @return [Boolean] If enabled, the Prompt Node FULFILLED events will include model host name
    attr_reader :model_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param usage [Boolean] If enabled, the Prompt Node FULFILLED events will include model host usage
#  tracking. This may increase latency for some model hosts.
    # @param cost [Boolean] If enabled, the Prompt Node FULFILLED events will include model host cost
#  tracking. This may increase latency for some model hosts.
    # @param model_name [Boolean] If enabled, the Prompt Node FULFILLED events will include model host name
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowExpandMetaRequest]
    def initialize(usage: OMIT, cost: OMIT, model_name: OMIT, additional_properties: nil)
      @usage = usage if usage != OMIT
      @cost = cost if cost != OMIT
      @model_name = model_name if model_name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "usage": usage, "cost": cost, "model_name": model_name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowExpandMetaRequest
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowExpandMetaRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      usage = parsed_json["usage"]
      cost = parsed_json["cost"]
      model_name = parsed_json["model_name"]
      new(
        usage: usage,
        cost: cost,
        model_name: model_name,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowExpandMetaRequest to a JSON object
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
      obj.usage&.is_a?(Boolean) != false || raise("Passed value for field obj.usage is not the expected type, validation failed.")
      obj.cost&.is_a?(Boolean) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
      obj.model_name&.is_a?(Boolean) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
    end
  end
end