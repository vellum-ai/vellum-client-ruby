# frozen_string_literal: true
require "json"
require_relative "prompt_node_result"
require_relative "search_node_result"
require_relative "templating_node_result"
require_relative "code_execution_node_result"
require_relative "conditional_node_result"
require_relative "api_node_result"
require_relative "terminal_node_result"
require_relative "merge_node_result"
require_relative "subworkflow_node_result"
require_relative "metric_node_result"
require_relative "map_node_result"

module Vellum
  class WorkflowNodeResultData


# Deserialize a JSON object to an instance of WorkflowNodeResultData
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::PromptNodeResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::PromptNodeResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::SearchNodeResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::SearchNodeResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TemplatingNodeResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TemplatingNodeResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::CodeExecutionNodeResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::CodeExecutionNodeResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ConditionalNodeResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ConditionalNodeResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::ApiNodeResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ApiNodeResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TerminalNodeResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TerminalNodeResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::MergeNodeResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::MergeNodeResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::SubworkflowNodeResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::SubworkflowNodeResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::MetricNodeResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::MetricNodeResult.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::MapNodeResult.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::MapNodeResult.from_json(json_object: struct)
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
        return Vellum::PromptNodeResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::SearchNodeResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TemplatingNodeResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::CodeExecutionNodeResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ConditionalNodeResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::ApiNodeResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TerminalNodeResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::MergeNodeResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::SubworkflowNodeResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::MetricNodeResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::MapNodeResult.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end