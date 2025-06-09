# frozen_string_literal: true
require_relative "finish_reason_enum"
require_relative "ml_model_usage"
require_relative "price"
require "ostruct"
require "json"

module Vellum
# The subset of the metadata tracked by Vellum during prompt execution that the
#  request opted into with `expand_meta`.
  class PromptExecutionMeta
  # @return [String] 
    attr_reader :model_name
  # @return [Integer] 
    attr_reader :latency
  # @return [String] 
    attr_reader :deployment_release_tag
  # @return [String] 
    attr_reader :prompt_version_id
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

    # @param model_name [String] 
    # @param latency [Integer] 
    # @param deployment_release_tag [String] 
    # @param prompt_version_id [String] 
    # @param finish_reason [Vellum::FinishReasonEnum] 
    # @param usage [Vellum::MlModelUsage] 
    # @param cost [Vellum::Price] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PromptExecutionMeta]
    def initialize(model_name: OMIT, latency: OMIT, deployment_release_tag: OMIT, prompt_version_id: OMIT, finish_reason: OMIT, usage: OMIT, cost: OMIT, additional_properties: nil)
      @model_name = model_name if model_name != OMIT
      @latency = latency if latency != OMIT
      @deployment_release_tag = deployment_release_tag if deployment_release_tag != OMIT
      @prompt_version_id = prompt_version_id if prompt_version_id != OMIT
      @finish_reason = finish_reason if finish_reason != OMIT
      @usage = usage if usage != OMIT
      @cost = cost if cost != OMIT
      @additional_properties = additional_properties
      @_field_set = { "model_name": model_name, "latency": latency, "deployment_release_tag": deployment_release_tag, "prompt_version_id": prompt_version_id, "finish_reason": finish_reason, "usage": usage, "cost": cost }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PromptExecutionMeta
    #
    # @param json_object [String] 
    # @return [Vellum::PromptExecutionMeta]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model_name = parsed_json["model_name"]
      latency = parsed_json["latency"]
      deployment_release_tag = parsed_json["deployment_release_tag"]
      prompt_version_id = parsed_json["prompt_version_id"]
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
        model_name: model_name,
        latency: latency,
        deployment_release_tag: deployment_release_tag,
        prompt_version_id: prompt_version_id,
        finish_reason: finish_reason,
        usage: usage,
        cost: cost,
        additional_properties: struct
      )
    end
# Serialize an instance of PromptExecutionMeta to a JSON object
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
      obj.model_name&.is_a?(String) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
      obj.latency&.is_a?(Integer) != false || raise("Passed value for field obj.latency is not the expected type, validation failed.")
      obj.deployment_release_tag&.is_a?(String) != false || raise("Passed value for field obj.deployment_release_tag is not the expected type, validation failed.")
      obj.prompt_version_id&.is_a?(String) != false || raise("Passed value for field obj.prompt_version_id is not the expected type, validation failed.")
      obj.finish_reason&.is_a?(Vellum::FinishReasonEnum) != false || raise("Passed value for field obj.finish_reason is not the expected type, validation failed.")
      obj.usage.nil? || Vellum::MlModelUsage.validate_raw(obj: obj.usage)
      obj.cost.nil? || Vellum::Price.validate_raw(obj: obj.cost)
    end
  end
end