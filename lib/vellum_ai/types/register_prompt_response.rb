# frozen_string_literal: true

require_relative "register_prompt_prompt"
require_relative "registered_prompt_sandbox_snapshot"
require_relative "registered_prompt_sandbox"
require_relative "registered_prompt_model_version"
require_relative "registered_prompt_deployment"
require "json"

module Vellum
  class RegisterPromptResponse
    attr_reader :prompt, :sandbox_snapshot, :sandbox, :model_version, :prompt_version_id, :deployment,
                :additional_properties

    # @param prompt [RegisterPromptPrompt] Information about the generated prompt
    # @param sandbox_snapshot [RegisteredPromptSandboxSnapshot] Information about the generated sandbox snapshot
    # @param sandbox [RegisteredPromptSandbox] Information about the generated sandbox
    # @param model_version [RegisteredPromptModelVersion] Information about the generated model version
    # @param prompt_version_id [String] The ID of the generated prompt version
    # @param deployment [RegisteredPromptDeployment] Information about the generated deployment
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RegisterPromptResponse]
    def initialize(prompt:, sandbox_snapshot:, sandbox:, model_version:, prompt_version_id:, deployment:,
                   additional_properties: nil)
      # @type [RegisterPromptPrompt] Information about the generated prompt
      @prompt = prompt
      # @type [RegisteredPromptSandboxSnapshot] Information about the generated sandbox snapshot
      @sandbox_snapshot = sandbox_snapshot
      # @type [RegisteredPromptSandbox] Information about the generated sandbox
      @sandbox = sandbox
      # @type [RegisteredPromptModelVersion] Information about the generated model version
      @model_version = model_version
      # @type [String] The ID of the generated prompt version
      @prompt_version_id = prompt_version_id
      # @type [RegisteredPromptDeployment] Information about the generated deployment
      @deployment = deployment
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of RegisterPromptResponse
    #
    # @param json_object [JSON]
    # @return [RegisterPromptResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["prompt"].nil?
        prompt = nil
      else
        prompt = parsed_json["prompt"].to_json
        prompt = RegisterPromptPrompt.from_json(json_object: prompt)
      end
      if parsed_json["sandbox_snapshot"].nil?
        sandbox_snapshot = nil
      else
        sandbox_snapshot = parsed_json["sandbox_snapshot"].to_json
        sandbox_snapshot = RegisteredPromptSandboxSnapshot.from_json(json_object: sandbox_snapshot)
      end
      if parsed_json["sandbox"].nil?
        sandbox = nil
      else
        sandbox = parsed_json["sandbox"].to_json
        sandbox = RegisteredPromptSandbox.from_json(json_object: sandbox)
      end
      if parsed_json["model_version"].nil?
        model_version = nil
      else
        model_version = parsed_json["model_version"].to_json
        model_version = RegisteredPromptModelVersion.from_json(json_object: model_version)
      end
      prompt_version_id = struct.prompt_version_id
      if parsed_json["deployment"].nil?
        deployment = nil
      else
        deployment = parsed_json["deployment"].to_json
        deployment = RegisteredPromptDeployment.from_json(json_object: deployment)
      end
      new(prompt: prompt, sandbox_snapshot: sandbox_snapshot, sandbox: sandbox, model_version: model_version,
          prompt_version_id: prompt_version_id, deployment: deployment, additional_properties: struct)
    end

    # Serialize an instance of RegisterPromptResponse to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "prompt": @prompt,
        "sandbox_snapshot": @sandbox_snapshot,
        "sandbox": @sandbox,
        "model_version": @model_version,
        "prompt_version_id": @prompt_version_id,
        "deployment": @deployment
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      RegisterPromptPrompt.validate_raw(obj: obj.prompt)
      RegisteredPromptSandboxSnapshot.validate_raw(obj: obj.sandbox_snapshot)
      RegisteredPromptSandbox.validate_raw(obj: obj.sandbox)
      RegisteredPromptModelVersion.validate_raw(obj: obj.model_version)
      obj.prompt_version_id.is_a?(String) != false || raise("Passed value for field obj.prompt_version_id is not the expected type, validation failed.")
      RegisteredPromptDeployment.validate_raw(obj: obj.deployment)
    end
  end
end
