# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# Response serializer for successful event creation.
  class EventCreateResponse
  # @return [Boolean] Indicates whether the event was published successfully.
    attr_reader :success
  # @return [Integer] Number of events processed
    attr_reader :count
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param success [Boolean] Indicates whether the event was published successfully.
    # @param count [Integer] Number of events processed
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::EventCreateResponse]
    def initialize(success: OMIT, count:, additional_properties: nil)
      @success = success if success != OMIT
      @count = count
      @additional_properties = additional_properties
      @_field_set = { "success": success, "count": count }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of EventCreateResponse
    #
    # @param json_object [String] 
    # @return [Vellum::EventCreateResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      success = parsed_json["success"]
      count = parsed_json["count"]
      new(
        success: success,
        count: count,
        additional_properties: struct
      )
    end
# Serialize an instance of EventCreateResponse to a JSON object
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
      obj.success&.is_a?(Boolean) != false || raise("Passed value for field obj.success is not the expected type, validation failed.")
      obj.count.is_a?(Integer) != false || raise("Passed value for field obj.count is not the expected type, validation failed.")
    end
  end
end