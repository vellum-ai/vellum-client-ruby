# frozen_string_literal: true
require "json"
require_relative "test_suite_run_deployment_release_tag_exec_config_request"
require_relative "test_suite_run_prompt_sandbox_exec_config_request"
require_relative "test_suite_run_prompt_sandbox_history_item_exec_config_request"
require_relative "test_suite_run_workflow_release_tag_exec_config_request"
require_relative "test_suite_run_workflow_sandbox_exec_config_request"
require_relative "test_suite_run_workflow_sandbox_history_item_exec_config_request"
require_relative "test_suite_run_external_exec_config_request"

module Vellum
  class TestSuiteRunExecConfigRequest
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::TestSuiteRunExecConfigRequest]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of TestSuiteRunExecConfigRequest
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunExecConfigRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "DEPLOYMENT_RELEASE_TAG"
        member = Vellum::TestSuiteRunDeploymentReleaseTagExecConfigRequest.from_json(json_object: json_object)
      when "PROMPT_SANDBOX"
        member = Vellum::TestSuiteRunPromptSandboxExecConfigRequest.from_json(json_object: json_object)
      when "PROMPT_SANDBOX_HISTORY_ITEM"
        member = Vellum::TestSuiteRunPromptSandboxHistoryItemExecConfigRequest.from_json(json_object: json_object)
      when "WORKFLOW_RELEASE_TAG"
        member = Vellum::TestSuiteRunWorkflowReleaseTagExecConfigRequest.from_json(json_object: json_object)
      when "WORKFLOW_SANDBOX"
        member = Vellum::TestSuiteRunWorkflowSandboxExecConfigRequest.from_json(json_object: json_object)
      when "WORKFLOW_SANDBOX_HISTORY_ITEM"
        member = Vellum::TestSuiteRunWorkflowSandboxHistoryItemExecConfigRequest.from_json(json_object: json_object)
      when "EXTERNAL"
        member = Vellum::TestSuiteRunExternalExecConfigRequest.from_json(json_object: json_object)
      else
        member = Vellum::TestSuiteRunDeploymentReleaseTagExecConfigRequest.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "DEPLOYMENT_RELEASE_TAG"
        { **@member.to_json, type: @discriminant }.to_json
      when "PROMPT_SANDBOX"
        { **@member.to_json, type: @discriminant }.to_json
      when "PROMPT_SANDBOX_HISTORY_ITEM"
        { **@member.to_json, type: @discriminant }.to_json
      when "WORKFLOW_RELEASE_TAG"
        { **@member.to_json, type: @discriminant }.to_json
      when "WORKFLOW_SANDBOX"
        { **@member.to_json, type: @discriminant }.to_json
      when "WORKFLOW_SANDBOX_HISTORY_ITEM"
        { **@member.to_json, type: @discriminant }.to_json
      when "EXTERNAL"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "DEPLOYMENT_RELEASE_TAG"
        Vellum::TestSuiteRunDeploymentReleaseTagExecConfigRequest.validate_raw(obj: obj)
      when "PROMPT_SANDBOX"
        Vellum::TestSuiteRunPromptSandboxExecConfigRequest.validate_raw(obj: obj)
      when "PROMPT_SANDBOX_HISTORY_ITEM"
        Vellum::TestSuiteRunPromptSandboxHistoryItemExecConfigRequest.validate_raw(obj: obj)
      when "WORKFLOW_RELEASE_TAG"
        Vellum::TestSuiteRunWorkflowReleaseTagExecConfigRequest.validate_raw(obj: obj)
      when "WORKFLOW_SANDBOX"
        Vellum::TestSuiteRunWorkflowSandboxExecConfigRequest.validate_raw(obj: obj)
      when "WORKFLOW_SANDBOX_HISTORY_ITEM"
        Vellum::TestSuiteRunWorkflowSandboxHistoryItemExecConfigRequest.validate_raw(obj: obj)
      when "EXTERNAL"
        Vellum::TestSuiteRunExternalExecConfigRequest.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
# For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object] 
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end
    # @param member [Vellum::TestSuiteRunDeploymentReleaseTagExecConfigRequest] 
    # @return [Vellum::TestSuiteRunExecConfigRequest]
    def self.deployment_release_tag(member:)
      new(member: member, discriminant: "DEPLOYMENT_RELEASE_TAG")
    end
    # @param member [Vellum::TestSuiteRunPromptSandboxExecConfigRequest] 
    # @return [Vellum::TestSuiteRunExecConfigRequest]
    def self.prompt_sandbox(member:)
      new(member: member, discriminant: "PROMPT_SANDBOX")
    end
    # @param member [Vellum::TestSuiteRunPromptSandboxHistoryItemExecConfigRequest] 
    # @return [Vellum::TestSuiteRunExecConfigRequest]
    def self.prompt_sandbox_history_item(member:)
      new(member: member, discriminant: "PROMPT_SANDBOX_HISTORY_ITEM")
    end
    # @param member [Vellum::TestSuiteRunWorkflowReleaseTagExecConfigRequest] 
    # @return [Vellum::TestSuiteRunExecConfigRequest]
    def self.workflow_release_tag(member:)
      new(member: member, discriminant: "WORKFLOW_RELEASE_TAG")
    end
    # @param member [Vellum::TestSuiteRunWorkflowSandboxExecConfigRequest] 
    # @return [Vellum::TestSuiteRunExecConfigRequest]
    def self.workflow_sandbox(member:)
      new(member: member, discriminant: "WORKFLOW_SANDBOX")
    end
    # @param member [Vellum::TestSuiteRunWorkflowSandboxHistoryItemExecConfigRequest] 
    # @return [Vellum::TestSuiteRunExecConfigRequest]
    def self.workflow_sandbox_history_item(member:)
      new(member: member, discriminant: "WORKFLOW_SANDBOX_HISTORY_ITEM")
    end
    # @param member [Vellum::TestSuiteRunExternalExecConfigRequest] 
    # @return [Vellum::TestSuiteRunExecConfigRequest]
    def self.external(member:)
      new(member: member, discriminant: "EXTERNAL")
    end
  end
end