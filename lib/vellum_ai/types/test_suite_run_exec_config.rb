# frozen_string_literal: true
require "json"
require_relative "test_suite_run_deployment_release_tag_exec_config"
require_relative "test_suite_run_prompt_sandbox_history_item_exec_config"
require_relative "test_suite_run_workflow_release_tag_exec_config"
require_relative "test_suite_run_workflow_sandbox_history_item_exec_config"
require_relative "test_suite_run_external_exec_config"

module Vellum
  class TestSuiteRunExecConfig
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::TestSuiteRunExecConfig]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of TestSuiteRunExecConfig
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunExecConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "DEPLOYMENT_RELEASE_TAG"
        member = Vellum::TestSuiteRunDeploymentReleaseTagExecConfig.from_json(json_object: json_object)
      when "PROMPT_SANDBOX_HISTORY_ITEM"
        member = Vellum::TestSuiteRunPromptSandboxHistoryItemExecConfig.from_json(json_object: json_object)
      when "WORKFLOW_RELEASE_TAG"
        member = Vellum::TestSuiteRunWorkflowReleaseTagExecConfig.from_json(json_object: json_object)
      when "WORKFLOW_SANDBOX_HISTORY_ITEM"
        member = Vellum::TestSuiteRunWorkflowSandboxHistoryItemExecConfig.from_json(json_object: json_object)
      when "EXTERNAL"
        member = Vellum::TestSuiteRunExternalExecConfig.from_json(json_object: json_object)
      else
        member = Vellum::TestSuiteRunDeploymentReleaseTagExecConfig.from_json(json_object: json_object)
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
      when "PROMPT_SANDBOX_HISTORY_ITEM"
        { **@member.to_json, type: @discriminant }.to_json
      when "WORKFLOW_RELEASE_TAG"
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
        Vellum::TestSuiteRunDeploymentReleaseTagExecConfig.validate_raw(obj: obj)
      when "PROMPT_SANDBOX_HISTORY_ITEM"
        Vellum::TestSuiteRunPromptSandboxHistoryItemExecConfig.validate_raw(obj: obj)
      when "WORKFLOW_RELEASE_TAG"
        Vellum::TestSuiteRunWorkflowReleaseTagExecConfig.validate_raw(obj: obj)
      when "WORKFLOW_SANDBOX_HISTORY_ITEM"
        Vellum::TestSuiteRunWorkflowSandboxHistoryItemExecConfig.validate_raw(obj: obj)
      when "EXTERNAL"
        Vellum::TestSuiteRunExternalExecConfig.validate_raw(obj: obj)
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
    # @param member [Vellum::TestSuiteRunDeploymentReleaseTagExecConfig] 
    # @return [Vellum::TestSuiteRunExecConfig]
    def self.deployment_release_tag(member:)
      new(member: member, discriminant: "DEPLOYMENT_RELEASE_TAG")
    end
    # @param member [Vellum::TestSuiteRunPromptSandboxHistoryItemExecConfig] 
    # @return [Vellum::TestSuiteRunExecConfig]
    def self.prompt_sandbox_history_item(member:)
      new(member: member, discriminant: "PROMPT_SANDBOX_HISTORY_ITEM")
    end
    # @param member [Vellum::TestSuiteRunWorkflowReleaseTagExecConfig] 
    # @return [Vellum::TestSuiteRunExecConfig]
    def self.workflow_release_tag(member:)
      new(member: member, discriminant: "WORKFLOW_RELEASE_TAG")
    end
    # @param member [Vellum::TestSuiteRunWorkflowSandboxHistoryItemExecConfig] 
    # @return [Vellum::TestSuiteRunExecConfig]
    def self.workflow_sandbox_history_item(member:)
      new(member: member, discriminant: "WORKFLOW_SANDBOX_HISTORY_ITEM")
    end
    # @param member [Vellum::TestSuiteRunExternalExecConfig] 
    # @return [Vellum::TestSuiteRunExecConfig]
    def self.external(member:)
      new(member: member, discriminant: "EXTERNAL")
    end
  end
end