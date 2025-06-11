# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class ReleaseCreatedBy
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :full_name
  # @return [String] 
    attr_reader :email
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param full_name [String] 
    # @param email [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ReleaseCreatedBy]
    def initialize(id: OMIT, full_name: OMIT, email:, additional_properties: nil)
      @id = id if id != OMIT
      @full_name = full_name if full_name != OMIT
      @email = email
      @additional_properties = additional_properties
      @_field_set = { "id": id, "full_name": full_name, "email": email }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReleaseCreatedBy
    #
    # @param json_object [String] 
    # @return [Vellum::ReleaseCreatedBy]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      full_name = parsed_json["full_name"]
      email = parsed_json["email"]
      new(
        id: id,
        full_name: full_name,
        email: email,
        additional_properties: struct
      )
    end
# Serialize an instance of ReleaseCreatedBy to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.full_name&.is_a?(String) != false || raise("Passed value for field obj.full_name is not the expected type, validation failed.")
      obj.email.is_a?(String) != false || raise("Passed value for field obj.email is not the expected type, validation failed.")
    end
  end
end