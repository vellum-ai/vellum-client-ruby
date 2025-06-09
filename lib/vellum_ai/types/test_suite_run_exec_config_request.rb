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


# Deserialize a JSON object to an instance of TestSuiteRunExecConfigRequest
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunExecConfigRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::TestSuiteRunDeploymentReleaseTagExecConfigRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunDeploymentReleaseTagExecConfigRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunPromptSandboxExecConfigRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunPromptSandboxExecConfigRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunPromptSandboxHistoryItemExecConfigRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunPromptSandboxHistoryItemExecConfigRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunWorkflowReleaseTagExecConfigRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunWorkflowReleaseTagExecConfigRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunWorkflowSandboxExecConfigRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunWorkflowSandboxExecConfigRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunWorkflowSandboxHistoryItemExecConfigRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunWorkflowSandboxHistoryItemExecConfigRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TestSuiteRunExternalExecConfigRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TestSuiteRunExternalExecConfigRequest.from_json(json_object: struct)
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
        return Vellum::TestSuiteRunDeploymentReleaseTagExecConfigRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunPromptSandboxExecConfigRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunPromptSandboxHistoryItemExecConfigRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunWorkflowReleaseTagExecConfigRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunWorkflowSandboxExecConfigRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunWorkflowSandboxHistoryItemExecConfigRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TestSuiteRunExternalExecConfigRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end