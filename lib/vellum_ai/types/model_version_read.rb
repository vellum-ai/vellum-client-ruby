# frozen_string_literal: true

require "date"
require_relative "provider_enum"
require_relative "model_version_build_config"
require_relative "model_version_exec_config"
require_relative "model_version_read_status_enum"
require "json"

module Vellum
  class ModelVersionRead
    attr_reader :id, :created, :label, :provider, :external_id, :build_config, :exec_config, :status,
                :additional_properties

    # @param id [String] Vellum-generated ID that uniquely identifies this model version.
    # @param created [DateTime] Timestamp of when this model version was created.
    # @param label [String] Human-friendly name for this model version.
    # @param provider [PROVIDER_ENUM] Which LLM provider this model version is associated with.
    #   - `ANTHROPIC` - Anthropic
    #   - `AWS_BEDROCK` - AWS Bedrock
    #   - `AZURE_OPENAI` - Azure OpenAI
    #   - `COHERE` - Cohere
    #   - `GOOGLE` - Google
    #   - `HOSTED` - Hosted
    #   - `MOSAICML` - MosaicML
    #   - `OPENAI` - OpenAI
    #   - `FIREWORKS_AI` - Fireworks AI
    #   - `HUGGINGFACE` - HuggingFace
    #   - `MYSTIC` - Mystic
    #   - `PYQ` - Pyq
    #   - `REPLICATE` - Replicate
    # @param external_id [String] The unique id of this model version as it exists in the above provider's system.
    # @param build_config [ModelVersionBuildConfig] Configuration used to build this model version.
    # @param exec_config [ModelVersionExecConfig] Configuration used to execute this model version.
    # @param status [MODEL_VERSION_READ_STATUS_ENUM]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ModelVersionRead]
    def initialize(id:, created:, label:, provider:, external_id:, build_config:, exec_config:, status: nil,
                   additional_properties: nil)
      # @type [String] Vellum-generated ID that uniquely identifies this model version.
      @id = id
      # @type [DateTime] Timestamp of when this model version was created.
      @created = created
      # @type [String] Human-friendly name for this model version.
      @label = label
      # @type [PROVIDER_ENUM] Which LLM provider this model version is associated with.
      #   - `ANTHROPIC` - Anthropic
      #   - `AWS_BEDROCK` - AWS Bedrock
      #   - `AZURE_OPENAI` - Azure OpenAI
      #   - `COHERE` - Cohere
      #   - `GOOGLE` - Google
      #   - `HOSTED` - Hosted
      #   - `MOSAICML` - MosaicML
      #   - `OPENAI` - OpenAI
      #   - `FIREWORKS_AI` - Fireworks AI
      #   - `HUGGINGFACE` - HuggingFace
      #   - `MYSTIC` - Mystic
      #   - `PYQ` - Pyq
      #   - `REPLICATE` - Replicate
      @provider = provider
      # @type [String] The unique id of this model version as it exists in the above provider's system.
      @external_id = external_id
      # @type [ModelVersionBuildConfig] Configuration used to build this model version.
      @build_config = build_config
      # @type [ModelVersionExecConfig] Configuration used to execute this model version.
      @exec_config = exec_config
      # @type [MODEL_VERSION_READ_STATUS_ENUM]
      @status = status
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of ModelVersionRead
    #
    # @param json_object [JSON]
    # @return [ModelVersionRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      created = DateTime.parse(parsed_json["created"])
      label = struct.label
      provider = PROVIDER_ENUM.key(parsed_json["provider"]) || parsed_json["provider"]
      external_id = struct.external_id
      if parsed_json["build_config"].nil?
        build_config = nil
      else
        build_config = parsed_json["build_config"].to_json
        build_config = ModelVersionBuildConfig.from_json(json_object: build_config)
      end
      if parsed_json["exec_config"].nil?
        exec_config = nil
      else
        exec_config = parsed_json["exec_config"].to_json
        exec_config = ModelVersionExecConfig.from_json(json_object: exec_config)
      end
      status = MODEL_VERSION_READ_STATUS_ENUM.key(parsed_json["status"]) || parsed_json["status"]
      new(id: id, created: created, label: label, provider: provider, external_id: external_id,
          build_config: build_config, exec_config: exec_config, status: status, additional_properties: struct)
    end

    # Serialize an instance of ModelVersionRead to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "id": @id,
        "created": @created,
        "label": @label,
        "provider": PROVIDER_ENUM[@provider] || @provider,
        "external_id": @external_id,
        "build_config": @build_config,
        "exec_config": @exec_config,
        "status": MODEL_VERSION_READ_STATUS_ENUM[@status] || @status
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.provider.is_a?(PROVIDER_ENUM) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.external_id.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      ModelVersionBuildConfig.validate_raw(obj: obj.build_config)
      ModelVersionExecConfig.validate_raw(obj: obj.exec_config)
      obj.status&.is_a?(MODEL_VERSION_READ_STATUS_ENUM) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
    end
  end
end
