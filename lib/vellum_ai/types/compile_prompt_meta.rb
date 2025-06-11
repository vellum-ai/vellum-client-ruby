# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# The subset of the metadata tracked by Vellum during Prompt Deployment
#  compilation that the request opted into with `expand_meta`.
  class CompilePromptMeta
  # @return [String] 
    attr_reader :model_name
  # @return [String] 
    attr_reader :deployment_release_tag
  # @return [String] 
    attr_reader :prompt_version_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model_name [String] 
    # @param deployment_release_tag [String] 
    # @param prompt_version_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::CompilePromptMeta]
    def initialize(model_name: OMIT, deployment_release_tag: OMIT, prompt_version_id: OMIT, additional_properties: nil)
      @model_name = model_name if model_name != OMIT
      @deployment_release_tag = deployment_release_tag if deployment_release_tag != OMIT
      @prompt_version_id = prompt_version_id if prompt_version_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "model_name": model_name, "deployment_release_tag": deployment_release_tag, "prompt_version_id": prompt_version_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CompilePromptMeta
    #
    # @param json_object [String] 
    # @return [Vellum::CompilePromptMeta]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model_name = parsed_json["model_name"]
      deployment_release_tag = parsed_json["deployment_release_tag"]
      prompt_version_id = parsed_json["prompt_version_id"]
      new(
        model_name: model_name,
        deployment_release_tag: deployment_release_tag,
        prompt_version_id: prompt_version_id,
        additional_properties: struct
      )
    end
# Serialize an instance of CompilePromptMeta to a JSON object
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
      obj.deployment_release_tag&.is_a?(String) != false || raise("Passed value for field obj.deployment_release_tag is not the expected type, validation failed.")
      obj.prompt_version_id&.is_a?(String) != false || raise("Passed value for field obj.prompt_version_id is not the expected type, validation failed.")
    end
  end
end