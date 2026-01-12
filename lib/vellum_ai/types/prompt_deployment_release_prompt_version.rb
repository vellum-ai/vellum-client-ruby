# frozen_string_literal: true
require_relative "prompt_version_build_config"
require "ostruct"
require "json"

module Vellum
  class PromptDeploymentReleasePromptVersion
  # @return [String] 
    attr_reader :id
  # @return [Vellum::PromptVersionBuildConfig] Configuration used to build this prompt version.
    attr_reader :build_config
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param build_config [Vellum::PromptVersionBuildConfig] Configuration used to build this prompt version.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PromptDeploymentReleasePromptVersion]
    def initialize(id:, build_config:, additional_properties: nil)
      @id = id
      @build_config = build_config
      @additional_properties = additional_properties
      @_field_set = { "id": id, "build_config": build_config }
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
        build_config = Vellum::PromptVersionBuildConfig.from_json(json_object: build_config)
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      Vellum::PromptVersionBuildConfig.validate_raw(obj: obj.build_config)
    end
  end
end