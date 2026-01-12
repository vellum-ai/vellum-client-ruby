# frozen_string_literal: true
require "json"
require_relative "workflow_parent_context"
require_relative "node_parent_context"
require_relative "workflow_deployment_parent_context"
require_relative "workflow_sandbox_parent_context"
require_relative "prompt_deployment_parent_context"
require_relative "api_request_parent_context"
require_relative "external_parent_context"
require_relative "scheduled_trigger_context"
require_relative "integration_trigger_context"

module Vellum
  class ParentContext
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::ParentContext]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of ParentContext
    #
    # @param json_object [String] 
    # @return [Vellum::ParentContext]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "WORKFLOW"
        member = Vellum::WorkflowParentContext.from_json(json_object: json_object)
      when "WORKFLOW_NODE"
        member = Vellum::NodeParentContext.from_json(json_object: json_object)
      when "WORKFLOW_RELEASE_TAG"
        member = Vellum::WorkflowDeploymentParentContext.from_json(json_object: json_object)
      when "WORKFLOW_SANDBOX"
        member = Vellum::WorkflowSandboxParentContext.from_json(json_object: json_object)
      when "PROMPT_RELEASE_TAG"
        member = Vellum::PromptDeploymentParentContext.from_json(json_object: json_object)
      when "API_REQUEST"
        member = Vellum::APIRequestParentContext.from_json(json_object: json_object)
      when "EXTERNAL"
        member = Vellum::ExternalParentContext.from_json(json_object: json_object)
      when "SCHEDULED"
        member = Vellum::ScheduledTriggerContext.from_json(json_object: json_object)
      when "INTEGRATION"
        member = Vellum::IntegrationTriggerContext.from_json(json_object: json_object)
      else
        member = Vellum::WorkflowParentContext.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "WORKFLOW"
        { **@member.to_json, type: @discriminant }.to_json
      when "WORKFLOW_NODE"
        { **@member.to_json, type: @discriminant }.to_json
      when "WORKFLOW_RELEASE_TAG"
        { **@member.to_json, type: @discriminant }.to_json
      when "WORKFLOW_SANDBOX"
        { **@member.to_json, type: @discriminant }.to_json
      when "PROMPT_RELEASE_TAG"
        { **@member.to_json, type: @discriminant }.to_json
      when "API_REQUEST"
        { **@member.to_json, type: @discriminant }.to_json
      when "EXTERNAL"
        { **@member.to_json, type: @discriminant }.to_json
      when "SCHEDULED"
        { **@member.to_json, type: @discriminant }.to_json
      when "INTEGRATION"
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
      when "WORKFLOW"
        Vellum::WorkflowParentContext.validate_raw(obj: obj)
      when "WORKFLOW_NODE"
        Vellum::NodeParentContext.validate_raw(obj: obj)
      when "WORKFLOW_RELEASE_TAG"
        Vellum::WorkflowDeploymentParentContext.validate_raw(obj: obj)
      when "WORKFLOW_SANDBOX"
        Vellum::WorkflowSandboxParentContext.validate_raw(obj: obj)
      when "PROMPT_RELEASE_TAG"
        Vellum::PromptDeploymentParentContext.validate_raw(obj: obj)
      when "API_REQUEST"
        Vellum::APIRequestParentContext.validate_raw(obj: obj)
      when "EXTERNAL"
        Vellum::ExternalParentContext.validate_raw(obj: obj)
      when "SCHEDULED"
        Vellum::ScheduledTriggerContext.validate_raw(obj: obj)
      when "INTEGRATION"
        Vellum::IntegrationTriggerContext.validate_raw(obj: obj)
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
    # @param member [Vellum::WorkflowParentContext] 
    # @return [Vellum::ParentContext]
    def self.workflow(member:)
      new(member: member, discriminant: "WORKFLOW")
    end
    # @param member [Vellum::NodeParentContext] 
    # @return [Vellum::ParentContext]
    def self.workflow_node(member:)
      new(member: member, discriminant: "WORKFLOW_NODE")
    end
    # @param member [Vellum::WorkflowDeploymentParentContext] 
    # @return [Vellum::ParentContext]
    def self.workflow_release_tag(member:)
      new(member: member, discriminant: "WORKFLOW_RELEASE_TAG")
    end
    # @param member [Vellum::WorkflowSandboxParentContext] 
    # @return [Vellum::ParentContext]
    def self.workflow_sandbox(member:)
      new(member: member, discriminant: "WORKFLOW_SANDBOX")
    end
    # @param member [Vellum::PromptDeploymentParentContext] 
    # @return [Vellum::ParentContext]
    def self.prompt_release_tag(member:)
      new(member: member, discriminant: "PROMPT_RELEASE_TAG")
    end
    # @param member [Vellum::APIRequestParentContext] 
    # @return [Vellum::ParentContext]
    def self.api_request(member:)
      new(member: member, discriminant: "API_REQUEST")
    end
    # @param member [Vellum::ExternalParentContext] 
    # @return [Vellum::ParentContext]
    def self.external(member:)
      new(member: member, discriminant: "EXTERNAL")
    end
    # @param member [Vellum::ScheduledTriggerContext] 
    # @return [Vellum::ParentContext]
    def self.scheduled(member:)
      new(member: member, discriminant: "SCHEDULED")
    end
    # @param member [Vellum::IntegrationTriggerContext] 
    # @return [Vellum::ParentContext]
    def self.integration(member:)
      new(member: member, discriminant: "INTEGRATION")
    end
  end
end