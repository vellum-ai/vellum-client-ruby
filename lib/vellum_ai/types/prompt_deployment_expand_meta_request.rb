# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class PromptDeploymentExpandMetaRequest
  # @return [Boolean] If enabled, the response will include the model identifier representing the ML
#  Model invoked by the Prompt.
    attr_reader :model_name
  # @return [Boolean] If enabled, the response will include model host usage tracking. This may
#  increase latency for some model hosts.
    attr_reader :usage
  # @return [Boolean] If enabled, the response will include model host cost tracking. This may
#  increase latency for some model hosts.
    attr_reader :cost
  # @return [Boolean] If enabled, the response will include the reason provided by the model for why
#  the execution finished.
    attr_reader :finish_reason
  # @return [Boolean] If enabled, the response will include the time in nanoseconds it took to execute
#  the Prompt Deployment.
    attr_reader :latency
  # @return [Boolean] If enabled, the response will include the release tag of the Prompt Deployment.
    attr_reader :deployment_release_tag
  # @return [Boolean] If enabled, the response will include the ID of the Prompt Version backing the
#  deployment.
    attr_reader :prompt_version_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model_name [Boolean] If enabled, the response will include the model identifier representing the ML
#  Model invoked by the Prompt.
    # @param usage [Boolean] If enabled, the response will include model host usage tracking. This may
#  increase latency for some model hosts.
    # @param cost [Boolean] If enabled, the response will include model host cost tracking. This may
#  increase latency for some model hosts.
    # @param finish_reason [Boolean] If enabled, the response will include the reason provided by the model for why
#  the execution finished.
    # @param latency [Boolean] If enabled, the response will include the time in nanoseconds it took to execute
#  the Prompt Deployment.
    # @param deployment_release_tag [Boolean] If enabled, the response will include the release tag of the Prompt Deployment.
    # @param prompt_version_id [Boolean] If enabled, the response will include the ID of the Prompt Version backing the
#  deployment.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PromptDeploymentExpandMetaRequest]
    def initialize(model_name: OMIT, usage: OMIT, cost: OMIT, finish_reason: OMIT, latency: OMIT, deployment_release_tag: OMIT, prompt_version_id: OMIT, additional_properties: nil)
      @model_name = model_name if model_name != OMIT
      @usage = usage if usage != OMIT
      @cost = cost if cost != OMIT
      @finish_reason = finish_reason if finish_reason != OMIT
      @latency = latency if latency != OMIT
      @deployment_release_tag = deployment_release_tag if deployment_release_tag != OMIT
      @prompt_version_id = prompt_version_id if prompt_version_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "model_name": model_name, "usage": usage, "cost": cost, "finish_reason": finish_reason, "latency": latency, "deployment_release_tag": deployment_release_tag, "prompt_version_id": prompt_version_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PromptDeploymentExpandMetaRequest
    #
    # @param json_object [String] 
    # @return [Vellum::PromptDeploymentExpandMetaRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model_name = parsed_json["model_name"]
      usage = parsed_json["usage"]
      cost = parsed_json["cost"]
      finish_reason = parsed_json["finish_reason"]
      latency = parsed_json["latency"]
      deployment_release_tag = parsed_json["deployment_release_tag"]
      prompt_version_id = parsed_json["prompt_version_id"]
      new(
        model_name: model_name,
        usage: usage,
        cost: cost,
        finish_reason: finish_reason,
        latency: latency,
        deployment_release_tag: deployment_release_tag,
        prompt_version_id: prompt_version_id,
        additional_properties: struct
      )
    end
# Serialize an instance of PromptDeploymentExpandMetaRequest to a JSON object
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
      obj.model_name&.is_a?(Boolean) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
      obj.usage&.is_a?(Boolean) != false || raise("Passed value for field obj.usage is not the expected type, validation failed.")
      obj.cost&.is_a?(Boolean) != false || raise("Passed value for field obj.cost is not the expected type, validation failed.")
      obj.finish_reason&.is_a?(Boolean) != false || raise("Passed value for field obj.finish_reason is not the expected type, validation failed.")
      obj.latency&.is_a?(Boolean) != false || raise("Passed value for field obj.latency is not the expected type, validation failed.")
      obj.deployment_release_tag&.is_a?(Boolean) != false || raise("Passed value for field obj.deployment_release_tag is not the expected type, validation failed.")
      obj.prompt_version_id&.is_a?(Boolean) != false || raise("Passed value for field obj.prompt_version_id is not the expected type, validation failed.")
    end
  end
end