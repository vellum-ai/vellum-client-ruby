# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class WorkflowPushResponse
  # @return [String] 
    attr_reader :workflow_sandbox_id
  # @return [String] 
    attr_reader :workflow_deployment_id
  # @return [Hash{String => Object}] 
    attr_reader :proposed_diffs
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param workflow_sandbox_id [String] 
    # @param workflow_deployment_id [String] 
    # @param proposed_diffs [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowPushResponse]
    def initialize(workflow_sandbox_id:, workflow_deployment_id: OMIT, proposed_diffs: OMIT, additional_properties: nil)
      @workflow_sandbox_id = workflow_sandbox_id
      @workflow_deployment_id = workflow_deployment_id if workflow_deployment_id != OMIT
      @proposed_diffs = proposed_diffs if proposed_diffs != OMIT
      @additional_properties = additional_properties
      @_field_set = { "workflow_sandbox_id": workflow_sandbox_id, "workflow_deployment_id": workflow_deployment_id, "proposed_diffs": proposed_diffs }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowPushResponse
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowPushResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      workflow_sandbox_id = parsed_json["workflow_sandbox_id"]
      workflow_deployment_id = parsed_json["workflow_deployment_id"]
      proposed_diffs = parsed_json["proposed_diffs"]
      new(
        workflow_sandbox_id: workflow_sandbox_id,
        workflow_deployment_id: workflow_deployment_id,
        proposed_diffs: proposed_diffs,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowPushResponse to a JSON object
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
      obj.workflow_deployment_id&.is_a?(String) != false || raise("Passed value for field obj.workflow_deployment_id is not the expected type, validation failed.")
      obj.proposed_diffs&.is_a?(Hash) != false || raise("Passed value for field obj.proposed_diffs is not the expected type, validation failed.")
    end
  end
end