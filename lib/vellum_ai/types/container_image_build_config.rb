# frozen_string_literal: true
require_relative "code_execution_package"
require "ostruct"
require "json"

module Vellum
  class ContainerImageBuildConfig
  # @return [Array<Vellum::CodeExecutionPackage>] 
    attr_reader :packages
  # @return [String] 
    attr_reader :user_script
  # @return [String] 
    attr_reader :hotswappable_version
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param packages [Array<Vellum::CodeExecutionPackage>] 
    # @param user_script [String] 
    # @param hotswappable_version [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ContainerImageBuildConfig]
    def initialize(packages:, user_script: OMIT, hotswappable_version: OMIT, additional_properties: nil)
      @packages = packages
      @user_script = user_script if user_script != OMIT
      @hotswappable_version = hotswappable_version if hotswappable_version != OMIT
      @additional_properties = additional_properties
      @_field_set = { "packages": packages, "user_script": user_script, "hotswappable_version": hotswappable_version }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ContainerImageBuildConfig
    #
    # @param json_object [String] 
    # @return [Vellum::ContainerImageBuildConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      packages = parsed_json["packages"]&.map do | item |
  item = item.to_json
  Vellum::CodeExecutionPackage.from_json(json_object: item)
end
      user_script = parsed_json["user_script"]
      hotswappable_version = parsed_json["hotswappable_version"]
      new(
        packages: packages,
        user_script: user_script,
        hotswappable_version: hotswappable_version,
        additional_properties: struct
      )
    end
# Serialize an instance of ContainerImageBuildConfig to a JSON object
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
      obj.packages.is_a?(Array) != false || raise("Passed value for field obj.packages is not the expected type, validation failed.")
      obj.user_script&.is_a?(String) != false || raise("Passed value for field obj.user_script is not the expected type, validation failed.")
      obj.hotswappable_version&.is_a?(String) != false || raise("Passed value for field obj.hotswappable_version is not the expected type, validation failed.")
    end
  end
end