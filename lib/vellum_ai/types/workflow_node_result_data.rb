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
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::WorkflowNodeResultData]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of WorkflowNodeResultData
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "PROMPT"
        member = Vellum::PromptNodeResult.from_json(json_object: json_object)
      when "SEARCH"
        member = Vellum::SearchNodeResult.from_json(json_object: json_object)
      when "TEMPLATING"
        member = Vellum::TemplatingNodeResult.from_json(json_object: json_object)
      when "CODE_EXECUTION"
        member = Vellum::CodeExecutionNodeResult.from_json(json_object: json_object)
      when "CONDITIONAL"
        member = Vellum::ConditionalNodeResult.from_json(json_object: json_object)
      when "API"
        member = Vellum::APINodeResult.from_json(json_object: json_object)
      when "TERMINAL"
        member = Vellum::TerminalNodeResult.from_json(json_object: json_object)
      when "MERGE"
        member = Vellum::MergeNodeResult.from_json(json_object: json_object)
      when "SUBWORKFLOW"
        member = Vellum::SubworkflowNodeResult.from_json(json_object: json_object)
      when "METRIC"
        member = Vellum::MetricNodeResult.from_json(json_object: json_object)
      when "MAP"
        member = Vellum::MapNodeResult.from_json(json_object: json_object)
      else
        member = Vellum::PromptNodeResult.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "PROMPT"
        { **@member.to_json, type: @discriminant }.to_json
      when "SEARCH"
        { **@member.to_json, type: @discriminant }.to_json
      when "TEMPLATING"
        { **@member.to_json, type: @discriminant }.to_json
      when "CODE_EXECUTION"
        { **@member.to_json, type: @discriminant }.to_json
      when "CONDITIONAL"
        { **@member.to_json, type: @discriminant }.to_json
      when "API"
        { **@member.to_json, type: @discriminant }.to_json
      when "TERMINAL"
        { **@member.to_json, type: @discriminant }.to_json
      when "MERGE"
        { **@member.to_json, type: @discriminant }.to_json
      when "SUBWORKFLOW"
        { **@member.to_json, type: @discriminant }.to_json
      when "METRIC"
        { **@member.to_json, type: @discriminant }.to_json
      when "MAP"
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
      when "PROMPT"
        Vellum::PromptNodeResult.validate_raw(obj: obj)
      when "SEARCH"
        Vellum::SearchNodeResult.validate_raw(obj: obj)
      when "TEMPLATING"
        Vellum::TemplatingNodeResult.validate_raw(obj: obj)
      when "CODE_EXECUTION"
        Vellum::CodeExecutionNodeResult.validate_raw(obj: obj)
      when "CONDITIONAL"
        Vellum::ConditionalNodeResult.validate_raw(obj: obj)
      when "API"
        Vellum::APINodeResult.validate_raw(obj: obj)
      when "TERMINAL"
        Vellum::TerminalNodeResult.validate_raw(obj: obj)
      when "MERGE"
        Vellum::MergeNodeResult.validate_raw(obj: obj)
      when "SUBWORKFLOW"
        Vellum::SubworkflowNodeResult.validate_raw(obj: obj)
      when "METRIC"
        Vellum::MetricNodeResult.validate_raw(obj: obj)
      when "MAP"
        Vellum::MapNodeResult.validate_raw(obj: obj)
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
    # @param member [Vellum::PromptNodeResult] 
    # @return [Vellum::WorkflowNodeResultData]
    def self.prompt(member:)
      new(member: member, discriminant: "PROMPT")
    end
    # @param member [Vellum::SearchNodeResult] 
    # @return [Vellum::WorkflowNodeResultData]
    def self.search(member:)
      new(member: member, discriminant: "SEARCH")
    end
    # @param member [Vellum::TemplatingNodeResult] 
    # @return [Vellum::WorkflowNodeResultData]
    def self.templating(member:)
      new(member: member, discriminant: "TEMPLATING")
    end
    # @param member [Vellum::CodeExecutionNodeResult] 
    # @return [Vellum::WorkflowNodeResultData]
    def self.code_execution(member:)
      new(member: member, discriminant: "CODE_EXECUTION")
    end
    # @param member [Vellum::ConditionalNodeResult] 
    # @return [Vellum::WorkflowNodeResultData]
    def self.conditional(member:)
      new(member: member, discriminant: "CONDITIONAL")
    end
    # @param member [Vellum::APINodeResult] 
    # @return [Vellum::WorkflowNodeResultData]
    def self.api(member:)
      new(member: member, discriminant: "API")
    end
    # @param member [Vellum::TerminalNodeResult] 
    # @return [Vellum::WorkflowNodeResultData]
    def self.terminal(member:)
      new(member: member, discriminant: "TERMINAL")
    end
    # @param member [Vellum::MergeNodeResult] 
    # @return [Vellum::WorkflowNodeResultData]
    def self.merge(member:)
      new(member: member, discriminant: "MERGE")
    end
    # @param member [Vellum::SubworkflowNodeResult] 
    # @return [Vellum::WorkflowNodeResultData]
    def self.subworkflow(member:)
      new(member: member, discriminant: "SUBWORKFLOW")
    end
    # @param member [Vellum::MetricNodeResult] 
    # @return [Vellum::WorkflowNodeResultData]
    def self.metric(member:)
      new(member: member, discriminant: "METRIC")
    end
    # @param member [Vellum::MapNodeResult] 
    # @return [Vellum::WorkflowNodeResultData]
    def self.map(member:)
      new(member: member, discriminant: "MAP")
    end
  end
end