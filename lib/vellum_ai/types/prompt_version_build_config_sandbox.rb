# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class PromptVersionBuildConfigSandbox
  # @return [String] 
    attr_reader :source
  # @return [String] 
    attr_reader :sandbox_id
  # @return [String] 
    attr_reader :sandbox_snapshot_id
  # @return [String] 
    attr_reader :prompt_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param source [String] 
    # @param sandbox_id [String] 
    # @param sandbox_snapshot_id [String] 
    # @param prompt_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PromptVersionBuildConfigSandbox]
    def initialize(source:, sandbox_id:, sandbox_snapshot_id:, prompt_id:, additional_properties: nil)
      @source = source
      @sandbox_id = sandbox_id
      @sandbox_snapshot_id = sandbox_snapshot_id
      @prompt_id = prompt_id
      @additional_properties = additional_properties
      @_field_set = { "source": source, "sandbox_id": sandbox_id, "sandbox_snapshot_id": sandbox_snapshot_id, "prompt_id": prompt_id }
    end
# Deserialize a JSON object to an instance of PromptVersionBuildConfigSandbox
    #
    # @param json_object [String] 
    # @return [Vellum::PromptVersionBuildConfigSandbox]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      source = parsed_json["source"]
      sandbox_id = parsed_json["sandbox_id"]
      sandbox_snapshot_id = parsed_json["sandbox_snapshot_id"]
      prompt_id = parsed_json["prompt_id"]
      new(
        source: source,
        sandbox_id: sandbox_id,
        sandbox_snapshot_id: sandbox_snapshot_id,
        prompt_id: prompt_id,
        additional_properties: struct
      )
    end
# Serialize an instance of PromptVersionBuildConfigSandbox to a JSON object
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
      obj.source.is_a?(String) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
      obj.sandbox_id.is_a?(String) != false || raise("Passed value for field obj.sandbox_id is not the expected type, validation failed.")
      obj.sandbox_snapshot_id.is_a?(String) != false || raise("Passed value for field obj.sandbox_snapshot_id is not the expected type, validation failed.")
      obj.prompt_id.is_a?(String) != false || raise("Passed value for field obj.prompt_id is not the expected type, validation failed.")
    end
  end
end