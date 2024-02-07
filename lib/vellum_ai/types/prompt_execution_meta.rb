# frozen_string_literal: true

require_relative "finish_reason_enum"
require "json"

module Vellum
  # The subset of the metadata tracked by Vellum during prompt execution that the request opted into with `expand_meta`.
  class PromptExecutionMeta
    attr_reader :model_name, :latency, :deployment_release_tag, :prompt_version_id, :finish_reason,
                :additional_properties

    # @param model_name [String]
    # @param latency [Integer]
    # @param deployment_release_tag [String]
    # @param prompt_version_id [String]
    # @param finish_reason [FINISH_REASON_ENUM]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [PromptExecutionMeta]
    def initialize(model_name: nil, latency: nil, deployment_release_tag: nil, prompt_version_id: nil,
                   finish_reason: nil, additional_properties: nil)
      # @type [String]
      @model_name = model_name
      # @type [Integer]
      @latency = latency
      # @type [String]
      @deployment_release_tag = deployment_release_tag
      # @type [String]
      @prompt_version_id = prompt_version_id
      # @type [FINISH_REASON_ENUM]
      @finish_reason = finish_reason
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of PromptExecutionMeta
    #
    # @param json_object [JSON]
    # @return [PromptExecutionMeta]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model_name = struct.model_name
      latency = struct.latency
      deployment_release_tag = struct.deployment_release_tag
      prompt_version_id = struct.prompt_version_id
      finish_reason = FINISH_REASON_ENUM.key(parsed_json["finish_reason"]) || parsed_json["finish_reason"]
      new(model_name: model_name, latency: latency, deployment_release_tag: deployment_release_tag,
          prompt_version_id: prompt_version_id, finish_reason: finish_reason, additional_properties: struct)
    end

    # Serialize an instance of PromptExecutionMeta to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "model_name": @model_name,
        "latency": @latency,
        "deployment_release_tag": @deployment_release_tag,
        "prompt_version_id": @prompt_version_id,
        "finish_reason": FINISH_REASON_ENUM[@finish_reason] || @finish_reason
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.model_name&.is_a?(String) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
      obj.latency&.is_a?(Integer) != false || raise("Passed value for field obj.latency is not the expected type, validation failed.")
      obj.deployment_release_tag&.is_a?(String) != false || raise("Passed value for field obj.deployment_release_tag is not the expected type, validation failed.")
      obj.prompt_version_id&.is_a?(String) != false || raise("Passed value for field obj.prompt_version_id is not the expected type, validation failed.")
      obj.finish_reason&.is_a?(FINISH_REASON_ENUM) != false || raise("Passed value for field obj.finish_reason is not the expected type, validation failed.")
    end
  end
end
