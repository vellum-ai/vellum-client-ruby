# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class RunnerConfigRequest
  # @return [String] 
    attr_reader :container_image_name
  # @return [String] 
    attr_reader :container_image_tag
  # @return [String] 
    attr_reader :codegen_version
  # @return [String] 
    attr_reader :sdk_version
  # @return [Boolean] 
    attr_reader :is_deployment_inlining_enabled
  # @return [String] 
    attr_reader :server_version
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param container_image_name [String] 
    # @param container_image_tag [String] 
    # @param codegen_version [String] 
    # @param sdk_version [String] 
    # @param is_deployment_inlining_enabled [Boolean] 
    # @param server_version [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::RunnerConfigRequest]
    def initialize(container_image_name: OMIT, container_image_tag: OMIT, codegen_version: OMIT, sdk_version: OMIT, is_deployment_inlining_enabled: OMIT, server_version: OMIT, additional_properties: nil)
      @container_image_name = container_image_name if container_image_name != OMIT
      @container_image_tag = container_image_tag if container_image_tag != OMIT
      @codegen_version = codegen_version if codegen_version != OMIT
      @sdk_version = sdk_version if sdk_version != OMIT
      @is_deployment_inlining_enabled = is_deployment_inlining_enabled if is_deployment_inlining_enabled != OMIT
      @server_version = server_version if server_version != OMIT
      @additional_properties = additional_properties
      @_field_set = { "container_image_name": container_image_name, "container_image_tag": container_image_tag, "codegen_version": codegen_version, "sdk_version": sdk_version, "is_deployment_inlining_enabled": is_deployment_inlining_enabled, "server_version": server_version }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RunnerConfigRequest
    #
    # @param json_object [String] 
    # @return [Vellum::RunnerConfigRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      container_image_name = parsed_json["container_image_name"]
      container_image_tag = parsed_json["container_image_tag"]
      codegen_version = parsed_json["codegen_version"]
      sdk_version = parsed_json["sdk_version"]
      is_deployment_inlining_enabled = parsed_json["is_deployment_inlining_enabled"]
      server_version = parsed_json["server_version"]
      new(
        container_image_name: container_image_name,
        container_image_tag: container_image_tag,
        codegen_version: codegen_version,
        sdk_version: sdk_version,
        is_deployment_inlining_enabled: is_deployment_inlining_enabled,
        server_version: server_version,
        additional_properties: struct
      )
    end
# Serialize an instance of RunnerConfigRequest to a JSON object
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
      obj.container_image_name&.is_a?(String) != false || raise("Passed value for field obj.container_image_name is not the expected type, validation failed.")
      obj.container_image_tag&.is_a?(String) != false || raise("Passed value for field obj.container_image_tag is not the expected type, validation failed.")
      obj.codegen_version&.is_a?(String) != false || raise("Passed value for field obj.codegen_version is not the expected type, validation failed.")
      obj.sdk_version&.is_a?(String) != false || raise("Passed value for field obj.sdk_version is not the expected type, validation failed.")
      obj.is_deployment_inlining_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.is_deployment_inlining_enabled is not the expected type, validation failed.")
      obj.server_version&.is_a?(String) != false || raise("Passed value for field obj.server_version is not the expected type, validation failed.")
    end
  end
end