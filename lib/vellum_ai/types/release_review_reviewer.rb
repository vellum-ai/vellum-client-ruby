# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class ReleaseReviewReviewer
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :full_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param full_name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ReleaseReviewReviewer]
    def initialize(id: OMIT, full_name: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @full_name = full_name if full_name != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "full_name": full_name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReleaseReviewReviewer
    #
    # @param json_object [String] 
    # @return [Vellum::ReleaseReviewReviewer]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      full_name = parsed_json["full_name"]
      new(
        id: id,
        full_name: full_name,
        additional_properties: struct
      )
    end
# Serialize an instance of ReleaseReviewReviewer to a JSON object
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
    end
  end
end