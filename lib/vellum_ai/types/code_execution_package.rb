# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class CodeExecutionPackage
  # @return [String] 
    attr_reader :version
  # @return [String] 
    attr_reader :name
  # @return [String] 
    attr_reader :repository
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param version [String] 
    # @param name [String] 
    # @param repository [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::CodeExecutionPackage]
    def initialize(version:, name:, repository: OMIT, additional_properties: nil)
      @version = version
      @name = name
      @repository = repository if repository != OMIT
      @additional_properties = additional_properties
      @_field_set = { "version": version, "name": name, "repository": repository }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of CodeExecutionPackage
    #
    # @param json_object [String] 
    # @return [Vellum::CodeExecutionPackage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      version = parsed_json["version"]
      name = parsed_json["name"]
      repository = parsed_json["repository"]
      new(
        version: version,
        name: name,
        repository: repository,
        additional_properties: struct
      )
    end
# Serialize an instance of CodeExecutionPackage to a JSON object
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
      obj.version.is_a?(String) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.repository&.is_a?(String) != false || raise("Passed value for field obj.repository is not the expected type, validation failed.")
    end
  end
end