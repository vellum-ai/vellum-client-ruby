# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class TestSuiteRunWorkflowReleaseTagExecConfigData
  # @return [String] The ID of the Workflow Deployment to run the Test Suite against.
    attr_reader :workflow_deployment_id
  # @return [String] A tag identifying which release of the Workflow Deployment to run the Test Suite
#  against. Useful for testing past versions of the Workflow Deployment
    attr_reader :tag
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param workflow_deployment_id [String] The ID of the Workflow Deployment to run the Test Suite against.
    # @param tag [String] A tag identifying which release of the Workflow Deployment to run the Test Suite
#  against. Useful for testing past versions of the Workflow Deployment
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunWorkflowReleaseTagExecConfigData]
    def initialize(workflow_deployment_id:, tag: OMIT, additional_properties: nil)
      @workflow_deployment_id = workflow_deployment_id
      @tag = tag if tag != OMIT
      @additional_properties = additional_properties
      @_field_set = { "workflow_deployment_id": workflow_deployment_id, "tag": tag }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  TestSuiteRunWorkflowReleaseTagExecConfigData
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunWorkflowReleaseTagExecConfigData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      workflow_deployment_id = parsed_json["workflow_deployment_id"]
      tag = parsed_json["tag"]
      new(
        workflow_deployment_id: workflow_deployment_id,
        tag: tag,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunWorkflowReleaseTagExecConfigData to a JSON
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
      obj.workflow_deployment_id.is_a?(String) != false || raise("Passed value for field obj.workflow_deployment_id is not the expected type, validation failed.")
      obj.tag&.is_a?(String) != false || raise("Passed value for field obj.tag is not the expected type, validation failed.")
    end
  end
end