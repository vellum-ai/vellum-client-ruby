# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class TestSuiteRunWorkflowSandboxHistoryItemExecConfigData
  # @return [String] The ID of the Workflow Sandbox History Item that the Test Suite will run
#  against.
    attr_reader :history_item_id
  # @return [String] The ID of the Workflow Variant within the Workflow Sandbox History Item that
#  you'd like to run the Test Suite against.
    attr_reader :workflow_variant_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param history_item_id [String] The ID of the Workflow Sandbox History Item that the Test Suite will run
#  against.
    # @param workflow_variant_id [String] The ID of the Workflow Variant within the Workflow Sandbox History Item that
#  you'd like to run the Test Suite against.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunWorkflowSandboxHistoryItemExecConfigData]
    def initialize(history_item_id:, workflow_variant_id:, additional_properties: nil)
      @history_item_id = history_item_id
      @workflow_variant_id = workflow_variant_id
      @additional_properties = additional_properties
      @_field_set = { "history_item_id": history_item_id, "workflow_variant_id": workflow_variant_id }
    end
# Deserialize a JSON object to an instance of
#  TestSuiteRunWorkflowSandboxHistoryItemExecConfigData
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunWorkflowSandboxHistoryItemExecConfigData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      history_item_id = parsed_json["history_item_id"]
      workflow_variant_id = parsed_json["workflow_variant_id"]
      new(
        history_item_id: history_item_id,
        workflow_variant_id: workflow_variant_id,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunWorkflowSandboxHistoryItemExecConfigData to
#  a JSON object
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
      obj.history_item_id.is_a?(String) != false || raise("Passed value for field obj.history_item_id is not the expected type, validation failed.")
      obj.workflow_variant_id.is_a?(String) != false || raise("Passed value for field obj.workflow_variant_id is not the expected type, validation failed.")
    end
  end
end