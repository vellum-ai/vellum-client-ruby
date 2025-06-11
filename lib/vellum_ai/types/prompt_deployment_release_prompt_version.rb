# frozen_string_literal: true
require_relative "components_schemas_prompt_version_build_config_sandbox"
require "ostruct"
require "json"
require_relative "prompt_version_build_config_sandbox"

module Vellum
  class PromptDeploymentReleasePromptVersion
  # @return [String] 
    attr_reader :id
  # @return [Vellum::COMPONENTS_SCHEMAS_PROMPT_VERSION_BUILD_CONFIG_SANDBOX] Configuration used to build this prompt version.
    attr_reader :build_config
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param build_config [Vellum::COMPONENTS_SCHEMAS_PROMPT_VERSION_BUILD_CONFIG_SANDBOX] Configuration used to build this prompt version.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PromptDeploymentReleasePromptVersion]
    def initialize(id: OMIT, build_config: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @build_config = build_config if build_config != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "build_config": build_config }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PromptDeploymentReleasePromptVersion
    #
    # @param json_object [String] 
    # @return [Vellum::PromptDeploymentReleasePromptVersion]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      unless parsed_json["build_config"].nil?
        build_config = parsed_json["build_config"].to_json
        build_config = Vellum::PromptVersionBuildConfigSandbox.from_json(json_object: build_config)
      else
        build_config = nil
      end
      new(
        id: id,
        build_config: build_config,
        additional_properties: struct
      )
    end
# Serialize an instance of PromptDeploymentReleasePromptVersion to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.build_config.nil? || Vellum::PromptVersionBuildConfigSandbox.validate_raw(obj: obj.build_config)
    end
  end
end