# frozen_string_literal: true

require_relative "model_version_sandbox_snapshot"
require "json"

module Vellum
  class ModelVersionBuildConfig
    attr_reader :base_model, :sandbox_snapshot, :prompt_version_id, :additional_properties

    # @param base_model [String] The name of the base model used to create this model version, as identified by the LLM provider.
    # @param sandbox_snapshot [ModelVersionSandboxSnapshot] Information about the sandbox snapshot that was used to create this model version, if applicable.
    # @param prompt_version_id [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ModelVersionBuildConfig]
    def initialize(base_model:, sandbox_snapshot: nil, prompt_version_id: nil, additional_properties: nil)
      # @type [String] The name of the base model used to create this model version, as identified by the LLM provider.
      @base_model = base_model
      # @type [ModelVersionSandboxSnapshot] Information about the sandbox snapshot that was used to create this model version, if applicable.
      @sandbox_snapshot = sandbox_snapshot
      # @type [String]
      @prompt_version_id = prompt_version_id
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of ModelVersionBuildConfig
    #
    # @param json_object [JSON]
    # @return [ModelVersionBuildConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      base_model = struct.base_model
      if parsed_json["sandbox_snapshot"].nil?
        sandbox_snapshot = nil
      else
        sandbox_snapshot = parsed_json["sandbox_snapshot"].to_json
        sandbox_snapshot = ModelVersionSandboxSnapshot.from_json(json_object: sandbox_snapshot)
      end
      prompt_version_id = struct.prompt_version_id
      new(base_model: base_model, sandbox_snapshot: sandbox_snapshot, prompt_version_id: prompt_version_id,
          additional_properties: struct)
    end

    # Serialize an instance of ModelVersionBuildConfig to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "base_model": @base_model,
        "sandbox_snapshot": @sandbox_snapshot,
        "prompt_version_id": @prompt_version_id
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.base_model.is_a?(String) != false || raise("Passed value for field obj.base_model is not the expected type, validation failed.")
      obj.sandbox_snapshot.nil? || ModelVersionSandboxSnapshot.validate_raw(obj: obj.sandbox_snapshot)
      obj.prompt_version_id&.is_a?(String) != false || raise("Passed value for field obj.prompt_version_id is not the expected type, validation failed.")
    end
  end
end
