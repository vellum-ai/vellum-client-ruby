# frozen_string_literal: true
require_relative "ml_model_usage"
require_relative "price"
require "ostruct"
require "json"

module Vellum
# The subset of the metadata tracked by Vellum during prompt execution that the
#  request opted into with `expand_meta`.
  class PromptNodeExecutionMeta
  # @return [Vellum::MlModelUsage] 
    attr_reader :usage
  # @return [Vellum::Price] 
    attr_reader :cost
  # @return [String] 
    attr_reader :model_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param usage [Vellum::MlModelUsage] 
    # @param cost [Vellum::Price] 
    # @param model_name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PromptNodeExecutionMeta]
    def initialize(usage: OMIT, cost: OMIT, model_name: OMIT, additional_properties: nil)
      @usage = usage if usage != OMIT
      @cost = cost if cost != OMIT
      @model_name = model_name if model_name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "usage": usage, "cost": cost, "model_name": model_name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PromptNodeExecutionMeta
    #
    # @param json_object [String] 
    # @return [Vellum::PromptNodeExecutionMeta]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
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
      model_name = parsed_json["model_name"]
      new(
        usage: usage,
        cost: cost,
        model_name: model_name,
        additional_properties: struct
      )
    end
# Serialize an instance of PromptNodeExecutionMeta to a JSON object
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
      obj.usage.nil? || Vellum::MlModelUsage.validate_raw(obj: obj.usage)
      obj.cost.nil? || Vellum::Price.validate_raw(obj: obj.cost)
      obj.model_name&.is_a?(String) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
    end
  end
end