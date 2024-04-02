# frozen_string_literal: true

require "json"

module Vellum
  class TestSuiteRunWorkflowReleaseTagExecConfigData
    attr_reader :workflow_deployment_id, :tag, :additional_properties

    # @param workflow_deployment_id [String] The ID of the Workflow Deployment to run the Test Suite against.
    # @param tag [String] A tag identifying which release of the Workflow Deployment to run the Test Suite against. Useful for testing past versions of the Workflow Deployment
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [TestSuiteRunWorkflowReleaseTagExecConfigData]
    def initialize(workflow_deployment_id:, tag: nil, additional_properties: nil)
      # @type [String] The ID of the Workflow Deployment to run the Test Suite against.
      @workflow_deployment_id = workflow_deployment_id
      # @type [String] A tag identifying which release of the Workflow Deployment to run the Test Suite against. Useful for testing past versions of the Workflow Deployment
      @tag = tag
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of TestSuiteRunWorkflowReleaseTagExecConfigData
    #
    # @param json_object [JSON]
    # @return [TestSuiteRunWorkflowReleaseTagExecConfigData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      workflow_deployment_id = struct.workflow_deployment_id
      tag = struct.tag
      new(workflow_deployment_id: workflow_deployment_id, tag: tag, additional_properties: struct)
    end

    # Serialize an instance of TestSuiteRunWorkflowReleaseTagExecConfigData to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "workflow_deployment_id": @workflow_deployment_id, "tag": @tag }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.workflow_deployment_id.is_a?(String) != false || raise("Passed value for field obj.workflow_deployment_id is not the expected type, validation failed.")
      obj.tag&.is_a?(String) != false || raise("Passed value for field obj.tag is not the expected type, validation failed.")
    end
  end
end
