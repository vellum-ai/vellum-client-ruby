# frozen_string_literal: true

require "json"

module Vellum
  class PromptDeploymentExpandMetaRequestRequest
    attr_reader :model_name, :latency, :deployment_release_tag, :prompt_version_id, :finish_reason,
                :additional_properties

    # @param model_name [Boolean] If enabled, the response will include the model identifier representing the ML Model invoked by the Prompt Deployment.
    # @param latency [Boolean] If enabled, the response will include the time in nanoseconds it took to execute the Prompt Deployment.
    # @param deployment_release_tag [Boolean] If enabled, the response will include the release tag of the Prompt Deployment.
    # @param prompt_version_id [Boolean] If enabled, the response will include the ID of the Prompt Version backing the deployment.
    # @param finish_reason [Boolean] If enabled, the response will include the reason provided by the model for why the execution finished.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [PromptDeploymentExpandMetaRequestRequest]
    def initialize(model_name: nil, latency: nil, deployment_release_tag: nil, prompt_version_id: nil,
                   finish_reason: nil, additional_properties: nil)
      # @type [Boolean] If enabled, the response will include the model identifier representing the ML Model invoked by the Prompt Deployment.
      @model_name = model_name
      # @type [Boolean] If enabled, the response will include the time in nanoseconds it took to execute the Prompt Deployment.
      @latency = latency
      # @type [Boolean] If enabled, the response will include the release tag of the Prompt Deployment.
      @deployment_release_tag = deployment_release_tag
      # @type [Boolean] If enabled, the response will include the ID of the Prompt Version backing the deployment.
      @prompt_version_id = prompt_version_id
      # @type [Boolean] If enabled, the response will include the reason provided by the model for why the execution finished.
      @finish_reason = finish_reason
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of PromptDeploymentExpandMetaRequestRequest
    #
    # @param json_object [JSON]
    # @return [PromptDeploymentExpandMetaRequestRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      model_name = struct.model_name
      latency = struct.latency
      deployment_release_tag = struct.deployment_release_tag
      prompt_version_id = struct.prompt_version_id
      finish_reason = struct.finish_reason
      new(model_name: model_name, latency: latency, deployment_release_tag: deployment_release_tag,
          prompt_version_id: prompt_version_id, finish_reason: finish_reason, additional_properties: struct)
    end

    # Serialize an instance of PromptDeploymentExpandMetaRequestRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "model_name": @model_name,
        "latency": @latency,
        "deployment_release_tag": @deployment_release_tag,
        "prompt_version_id": @prompt_version_id,
        "finish_reason": @finish_reason
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.model_name&.is_a?(Boolean) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
      obj.latency&.is_a?(Boolean) != false || raise("Passed value for field obj.latency is not the expected type, validation failed.")
      obj.deployment_release_tag&.is_a?(Boolean) != false || raise("Passed value for field obj.deployment_release_tag is not the expected type, validation failed.")
      obj.prompt_version_id&.is_a?(Boolean) != false || raise("Passed value for field obj.prompt_version_id is not the expected type, validation failed.")
      obj.finish_reason&.is_a?(Boolean) != false || raise("Passed value for field obj.finish_reason is not the expected type, validation failed.")
    end
  end
end
