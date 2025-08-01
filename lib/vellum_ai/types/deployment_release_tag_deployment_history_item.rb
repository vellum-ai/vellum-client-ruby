# frozen_string_literal: true
require "date"
require "ostruct"
require "json"

module Vellum
  class DeploymentReleaseTagDeploymentHistoryItem
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :timestamp
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param timestamp [DateTime] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::DeploymentReleaseTagDeploymentHistoryItem]
    def initialize(id:, timestamp:, additional_properties: nil)
      @id = id
      @timestamp = timestamp
      @additional_properties = additional_properties
      @_field_set = { "id": id, "timestamp": timestamp }
    end
# Deserialize a JSON object to an instance of
#  DeploymentReleaseTagDeploymentHistoryItem
    #
    # @param json_object [String] 
    # @return [Vellum::DeploymentReleaseTagDeploymentHistoryItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      timestamp = unless parsed_json["timestamp"].nil?
  DateTime.parse(parsed_json["timestamp"])
else
  nil
end
      new(
        id: id,
        timestamp: timestamp,
        additional_properties: struct
      )
    end
# Serialize an instance of DeploymentReleaseTagDeploymentHistoryItem to a JSON
#  object
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
      obj.timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
    end
  end
end