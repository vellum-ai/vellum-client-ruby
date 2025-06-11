# frozen_string_literal: true
require_relative "release_tag_source"
require "ostruct"
require "json"

module Vellum
  class ReleaseReleaseTag
  # @return [String] The name of the Release Tag
    attr_reader :name
  # @return [Vellum::ReleaseTagSource] The source of how the Release Tag was originally created
#  * `SYSTEM` - System
#  * `USER` - User
    attr_reader :source
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param name [String] The name of the Release Tag
    # @param source [Vellum::ReleaseTagSource] The source of how the Release Tag was originally created
#  * `SYSTEM` - System
#  * `USER` - User
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ReleaseReleaseTag]
    def initialize(name:, source:, additional_properties: nil)
      @name = name
      @source = source
      @additional_properties = additional_properties
      @_field_set = { "name": name, "source": source }
    end
# Deserialize a JSON object to an instance of ReleaseReleaseTag
    #
    # @param json_object [String] 
    # @return [Vellum::ReleaseReleaseTag]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      name = parsed_json["name"]
      source = parsed_json["source"]
      new(
        name: name,
        source: source,
        additional_properties: struct
      )
    end
# Serialize an instance of ReleaseReleaseTag to a JSON object
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
      obj.source.is_a?(Vellum::ReleaseTagSource) != false || raise("Passed value for field obj.source is not the expected type, validation failed.")
    end
  end
end