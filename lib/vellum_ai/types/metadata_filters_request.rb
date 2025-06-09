# frozen_string_literal: true
require "json"
require_relative "metadata_filter_config_request"
require_relative "vellum_value_logical_expression_request"

module Vellum
  class MetadataFiltersRequest


# Deserialize a JSON object to an instance of MetadataFiltersRequest
    #
    # @param json_object [String] 
    # @return [Vellum::MetadataFiltersRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::MetadataFilterConfigRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::MetadataFilterConfigRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::VellumValueLogicalExpressionRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::VellumValueLogicalExpressionRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Vellum::MetadataFilterConfigRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::VellumValueLogicalExpressionRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end