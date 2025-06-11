# frozen_string_literal: true
require "date"
require "ostruct"
require "json"

module Vellum
  class ContainerImageContainerImageTag
  # @return [String] 
    attr_reader :name
  # @return [DateTime] 
    attr_reader :modified
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] 
    # @param modified [DateTime] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ContainerImageContainerImageTag]
    def initialize(name:, modified:, additional_properties: nil)
      @name = name
      @modified = modified
      @additional_properties = additional_properties
      @_field_set = { "name": name, "modified": modified }
    end
# Deserialize a JSON object to an instance of ContainerImageContainerImageTag
    #
    # @param json_object [String] 
    # @return [Vellum::ContainerImageContainerImageTag]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      modified = unless parsed_json["modified"].nil?
  DateTime.parse(parsed_json["modified"])
else
  nil
end
      new(
        name: name,
        modified: modified,
        additional_properties: struct
      )
    end
# Serialize an instance of ContainerImageContainerImageTag to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.modified.is_a?(DateTime) != false || raise("Passed value for field obj.modified is not the expected type, validation failed.")
    end
  end
end