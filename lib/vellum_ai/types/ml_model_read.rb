# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# An ML Model that your Workspace has access to.
  class MlModelRead
  # @return [String] 
    attr_reader :id
  # @return [String] The unique name of the ML Model.
    attr_reader :name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param name [String] The unique name of the ML Model.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::MlModelRead]
    def initialize(id:, name:, additional_properties: nil)
      @id = id
      @name = name
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name }
    end
# Deserialize a JSON object to an instance of MlModelRead
    #
    # @param json_object [String] 
    # @return [Vellum::MlModelRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      new(
        id: id,
        name: name,
        additional_properties: struct
      )
    end
# Serialize an instance of MlModelRead to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
    end
  end
end