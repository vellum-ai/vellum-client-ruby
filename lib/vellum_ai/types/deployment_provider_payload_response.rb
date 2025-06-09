# frozen_string_literal: true
require_relative "deployment_provider_payload_response_payload"
require_relative "compile_prompt_meta"
require "ostruct"
require "json"

module Vellum
  class DeploymentProviderPayloadResponse
  # @return [Vellum::DeploymentProviderPayloadResponsePayload] 
    attr_reader :payload
  # @return [Vellum::CompilePromptMeta] 
    attr_reader :meta
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param payload [Vellum::DeploymentProviderPayloadResponsePayload] 
    # @param meta [Vellum::CompilePromptMeta] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::DeploymentProviderPayloadResponse]
    def initialize(payload:, meta: OMIT, additional_properties: nil)
      @payload = payload
      @meta = meta if meta != OMIT
      @additional_properties = additional_properties
      @_field_set = { "payload": payload, "meta": meta }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DeploymentProviderPayloadResponse
    #
    # @param json_object [String] 
    # @return [Vellum::DeploymentProviderPayloadResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["payload"].nil?
        payload = parsed_json["payload"].to_json
        payload = Vellum::DeploymentProviderPayloadResponsePayload.from_json(json_object: payload)
      else
        payload = nil
      end
      unless parsed_json["meta"].nil?
        meta = parsed_json["meta"].to_json
        meta = Vellum::CompilePromptMeta.from_json(json_object: meta)
      else
        meta = nil
      end
      new(
        payload: payload,
        meta: meta,
        additional_properties: struct
      )
    end
# Serialize an instance of DeploymentProviderPayloadResponse to a JSON object
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
      Vellum::DeploymentProviderPayloadResponsePayload.validate_raw(obj: obj.payload)
      obj.meta.nil? || Vellum::CompilePromptMeta.validate_raw(obj: obj.meta)
    end
  end
end