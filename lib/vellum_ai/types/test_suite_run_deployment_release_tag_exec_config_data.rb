# frozen_string_literal: true

require "json"

module Vellum
  class TestSuiteRunDeploymentReleaseTagExecConfigData
    attr_reader :deployment_id, :tag, :additional_properties

    # @param deployment_id [String] The ID of the Prompt Deployment to run the Test Suite against.
    # @param tag [String] A tag identifying which release of the Prompt Deployment to run the Test Suite against. Useful for testing past versions of the Prompt Deployment
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TestSuiteRunDeploymentReleaseTagExecConfigData]
    def initialize(deployment_id:, tag: nil, additional_properties: nil)
      # @type [String] The ID of the Prompt Deployment to run the Test Suite against.
      @deployment_id = deployment_id
      # @type [String] A tag identifying which release of the Prompt Deployment to run the Test Suite against. Useful for testing past versions of the Prompt Deployment
      @tag = tag
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TestSuiteRunDeploymentReleaseTagExecConfigData
    #
    # @param json_object [JSON]
    # @return [TestSuiteRunDeploymentReleaseTagExecConfigData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      deployment_id = struct.deployment_id
      tag = struct.tag
      new(deployment_id: deployment_id, tag: tag, additional_properties: struct)
    end

    # Serialize an instance of TestSuiteRunDeploymentReleaseTagExecConfigData to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "deployment_id": @deployment_id, "tag": @tag }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.deployment_id.is_a?(String) != false || raise("Passed value for field obj.deployment_id is not the expected type, validation failed.")
      obj.tag&.is_a?(String) != false || raise("Passed value for field obj.tag is not the expected type, validation failed.")
    end
  end
end
