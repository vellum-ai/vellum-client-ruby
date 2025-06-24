# frozen_string_literal: true
require_relative "code_execution_package"
require "ostruct"
require "json"

module Vellum
  class ContainerImageBuildConfig
  # @return [Array<Vellum::CodeExecutionPackage>] 
    attr_reader :packages
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param packages [Array<Vellum::CodeExecutionPackage>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ContainerImageBuildConfig]
    def initialize(packages:, additional_properties: nil)
      @packages = packages
      @additional_properties = additional_properties
      @_field_set = { "packages": packages }
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
      new(packages: packages, additional_properties: struct)
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
    end
  end
end