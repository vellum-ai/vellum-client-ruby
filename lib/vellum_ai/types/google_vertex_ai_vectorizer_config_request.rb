# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class GoogleVertexAiVectorizerConfigRequest
  # @return [String] 
    attr_reader :project_id
  # @return [String] 
    attr_reader :region
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param project_id [String] 
    # @param region [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::GoogleVertexAiVectorizerConfigRequest]
    def initialize(project_id:, region:, additional_properties: nil)
      @project_id = project_id
      @region = region
      @additional_properties = additional_properties
      @_field_set = { "project_id": project_id, "region": region }
    end
# Deserialize a JSON object to an instance of
#  GoogleVertexAiVectorizerConfigRequest
    #
    # @param json_object [String] 
    # @return [Vellum::GoogleVertexAiVectorizerConfigRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      project_id = parsed_json["project_id"]
      region = parsed_json["region"]
      new(
        project_id: project_id,
        region: region,
        additional_properties: struct
      )
    end
# Serialize an instance of GoogleVertexAiVectorizerConfigRequest to a JSON object
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
      obj.project_id.is_a?(String) != false || raise("Passed value for field obj.project_id is not the expected type, validation failed.")
      obj.region.is_a?(String) != false || raise("Passed value for field obj.region is not the expected type, validation failed.")
    end
  end
end