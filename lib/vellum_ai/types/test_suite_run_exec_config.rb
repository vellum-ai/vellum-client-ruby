# frozen_string_literal: true
require "json"
require_relative "test_suite_run_deployment_release_tag_exec_config"
require_relative "test_suite_run_prompt_sandbox_history_item_exec_config"
require_relative "test_suite_run_workflow_release_tag_exec_config"
require_relative "test_suite_run_workflow_sandbox_history_item_exec_config"
require_relative "test_suite_run_external_exec_config"

module Vellum
  class TestSuiteRunExecConfig


# Deserialize a JSON object to an instance of TestSuiteRunExecConfig
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunExecConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::TestSuiteRunDeploymentReleaseTagExecConfig.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunDeploymentReleaseTagExecConfig.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunPromptSandboxHistoryItemExecConfig.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunPromptSandboxHistoryItemExecConfig.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunWorkflowReleaseTagExecConfig.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunWorkflowReleaseTagExecConfig.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunWorkflowSandboxHistoryItemExecConfig.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunWorkflowSandboxHistoryItemExecConfig.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunExternalExecConfig.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunExternalExecConfig.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Vellum::TestSuiteRunDeploymentReleaseTagExecConfig.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunPromptSandboxHistoryItemExecConfig.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunWorkflowReleaseTagExecConfig.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunWorkflowSandboxHistoryItemExecConfig.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunExternalExecConfig.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end