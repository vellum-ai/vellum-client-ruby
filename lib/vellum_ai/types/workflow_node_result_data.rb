# frozen_string_literal: true

require "json"
require_relative "prompt_node_result"
require_relative "search_node_result"
require_relative "templating_node_result"
require_relative "code_execution_node_result"
require_relative "conditional_node_result"
require_relative "api_node_result"
require_relative "terminal_node_result"
require_relative "subworkflow_node_result"

module Vellum
  class WorkflowNodeResultData
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [WorkflowNodeResultData]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of WorkflowNodeResultData
    #
    # @param json_object [JSON]
    # @return [WorkflowNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "PROMPT"
                 PromptNodeResult.from_json(json_object: json_object)
               when "SEARCH"
                 SearchNodeResult.from_json(json_object: json_object)
               when "TEMPLATING"
                 TemplatingNodeResult.from_json(json_object: json_object)
               when "CODE_EXECUTION"
                 CodeExecutionNodeResult.from_json(json_object: json_object)
               when "CONDITIONAL"
                 ConditionalNodeResult.from_json(json_object: json_object)
               when "API"
                 ApiNodeResult.from_json(json_object: json_object)
               when "TERMINAL"
                 TerminalNodeResult.from_json(json_object: json_object)
               when "SUBWORKFLOW"
                 SubworkflowNodeResult.from_json(json_object: json_object)
               else
                 PromptNodeResult.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [JSON]
    def to_json(*_args)
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
      when "SUBWORKFLOW"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "PROMPT"
        PromptNodeResult.validate_raw(obj: obj)
      when "SEARCH"
        SearchNodeResult.validate_raw(obj: obj)
      when "TEMPLATING"
        TemplatingNodeResult.validate_raw(obj: obj)
      when "CODE_EXECUTION"
        CodeExecutionNodeResult.validate_raw(obj: obj)
      when "CONDITIONAL"
        ConditionalNodeResult.validate_raw(obj: obj)
      when "API"
        ApiNodeResult.validate_raw(obj: obj)
      when "TERMINAL"
        TerminalNodeResult.validate_raw(obj: obj)
      when "SUBWORKFLOW"
        SubworkflowNodeResult.validate_raw(obj: obj)
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

    # @param member [PromptNodeResult]
    # @return [WorkflowNodeResultData]
    def self.prompt(member:)
      new(member: member, discriminant: "PROMPT")
    end

    # @param member [SearchNodeResult]
    # @return [WorkflowNodeResultData]
    def self.search(member:)
      new(member: member, discriminant: "SEARCH")
    end

    # @param member [TemplatingNodeResult]
    # @return [WorkflowNodeResultData]
    def self.templating(member:)
      new(member: member, discriminant: "TEMPLATING")
    end

    # @param member [CodeExecutionNodeResult]
    # @return [WorkflowNodeResultData]
    def self.code_execution(member:)
      new(member: member, discriminant: "CODE_EXECUTION")
    end

    # @param member [ConditionalNodeResult]
    # @return [WorkflowNodeResultData]
    def self.conditional(member:)
      new(member: member, discriminant: "CONDITIONAL")
    end

    # @param member [ApiNodeResult]
    # @return [WorkflowNodeResultData]
    def self.api(member:)
      new(member: member, discriminant: "API")
    end

    # @param member [TerminalNodeResult]
    # @return [WorkflowNodeResultData]
    def self.terminal(member:)
      new(member: member, discriminant: "TERMINAL")
    end

    # @param member [SubworkflowNodeResult]
    # @return [WorkflowNodeResultData]
    def self.subworkflow(member:)
      new(member: member, discriminant: "SUBWORKFLOW")
    end
  end
end
