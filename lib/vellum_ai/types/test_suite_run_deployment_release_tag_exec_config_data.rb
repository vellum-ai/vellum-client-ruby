# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class TestSuiteRunDeploymentReleaseTagExecConfigData
  # @return [String] The ID of the Prompt Deployment to run the Test Suite against.
    attr_reader :deployment_id
  # @return [String] A tag identifying which release of the Prompt Deployment to run the Test Suite
#  against. Useful for testing past versions of the Prompt Deployment
    attr_reader :tag
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param deployment_id [String] The ID of the Prompt Deployment to run the Test Suite against.
    # @param tag [String] A tag identifying which release of the Prompt Deployment to run the Test Suite
#  against. Useful for testing past versions of the Prompt Deployment
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunDeploymentReleaseTagExecConfigData]
    def initialize(deployment_id:, tag: OMIT, additional_properties: nil)
      @deployment_id = deployment_id
      @tag = tag if tag != OMIT
      @additional_properties = additional_properties
      @_field_set = { "deployment_id": deployment_id, "tag": tag }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  TestSuiteRunDeploymentReleaseTagExecConfigData
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunDeploymentReleaseTagExecConfigData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      deployment_id = parsed_json["deployment_id"]
      tag = parsed_json["tag"]
      new(
        deployment_id: deployment_id,
        tag: tag,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunDeploymentReleaseTagExecConfigData to a
#  JSON object
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
      obj.deployment_id.is_a?(String) != false || raise("Passed value for field obj.deployment_id is not the expected type, validation failed.")
      obj.tag&.is_a?(String) != false || raise("Passed value for field obj.tag is not the expected type, validation failed.")
    end
  end
end