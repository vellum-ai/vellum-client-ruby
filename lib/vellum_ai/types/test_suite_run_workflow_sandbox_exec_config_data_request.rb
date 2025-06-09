# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class TestSuiteRunWorkflowSandboxExecConfigDataRequest
  # @return [String] The ID of the Workflow Sandbox to run the Test Suite against.
    attr_reader :workflow_sandbox_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param workflow_sandbox_id [String] The ID of the Workflow Sandbox to run the Test Suite against.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunWorkflowSandboxExecConfigDataRequest]
    def initialize(workflow_sandbox_id:, additional_properties: nil)
      @workflow_sandbox_id = workflow_sandbox_id
      @additional_properties = additional_properties
      @_field_set = { "workflow_sandbox_id": workflow_sandbox_id }
    end
# Deserialize a JSON object to an instance of
#  TestSuiteRunWorkflowSandboxExecConfigDataRequest
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunWorkflowSandboxExecConfigDataRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      workflow_sandbox_id = parsed_json["workflow_sandbox_id"]
      new(workflow_sandbox_id: workflow_sandbox_id, additional_properties: struct)
    end
# Serialize an instance of TestSuiteRunWorkflowSandboxExecConfigDataRequest to a
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
      obj.workflow_sandbox_id.is_a?(String) != false || raise("Passed value for field obj.workflow_sandbox_id is not the expected type, validation failed.")
    end
  end
end