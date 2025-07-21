# frozen_string_literal: true
require_relative "vembda_service_tier_enum"
require_relative "quota"
require "ostruct"
require "json"

module Vellum
  class OrganizationLimitConfig
  # @return [Vellum::VembdaServiceTierEnum] 
    attr_reader :vembda_service_tier
  # @return [Vellum::Quota] 
    attr_reader :prompt_executions_quota
  # @return [Vellum::Quota] 
    attr_reader :workflow_executions_quota
  # @return [Vellum::Quota] 
    attr_reader :workflow_runtime_seconds_quota
  # @return [Integer] 
    attr_reader :max_workflow_runtime_seconds
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param vembda_service_tier [Vellum::VembdaServiceTierEnum] 
    # @param prompt_executions_quota [Vellum::Quota] 
    # @param workflow_executions_quota [Vellum::Quota] 
    # @param workflow_runtime_seconds_quota [Vellum::Quota] 
    # @param max_workflow_runtime_seconds [Integer] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::OrganizationLimitConfig]
    def initialize(vembda_service_tier: OMIT, prompt_executions_quota: OMIT, workflow_executions_quota: OMIT, workflow_runtime_seconds_quota: OMIT, max_workflow_runtime_seconds: OMIT, additional_properties: nil)
      @vembda_service_tier = vembda_service_tier if vembda_service_tier != OMIT
      @prompt_executions_quota = prompt_executions_quota if prompt_executions_quota != OMIT
      @workflow_executions_quota = workflow_executions_quota if workflow_executions_quota != OMIT
      @workflow_runtime_seconds_quota = workflow_runtime_seconds_quota if workflow_runtime_seconds_quota != OMIT
      @max_workflow_runtime_seconds = max_workflow_runtime_seconds if max_workflow_runtime_seconds != OMIT
      @additional_properties = additional_properties
      @_field_set = { "vembda_service_tier": vembda_service_tier, "prompt_executions_quota": prompt_executions_quota, "workflow_executions_quota": workflow_executions_quota, "workflow_runtime_seconds_quota": workflow_runtime_seconds_quota, "max_workflow_runtime_seconds": max_workflow_runtime_seconds }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OrganizationLimitConfig
    #
    # @param json_object [String] 
    # @return [Vellum::OrganizationLimitConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      vembda_service_tier = parsed_json["vembda_service_tier"]
      unless parsed_json["prompt_executions_quota"].nil?
        prompt_executions_quota = parsed_json["prompt_executions_quota"].to_json
        prompt_executions_quota = Vellum::Quota.from_json(json_object: prompt_executions_quota)
      else
        prompt_executions_quota = nil
      end
      unless parsed_json["workflow_executions_quota"].nil?
        workflow_executions_quota = parsed_json["workflow_executions_quota"].to_json
        workflow_executions_quota = Vellum::Quota.from_json(json_object: workflow_executions_quota)
      else
        workflow_executions_quota = nil
      end
      unless parsed_json["workflow_runtime_seconds_quota"].nil?
        workflow_runtime_seconds_quota = parsed_json["workflow_runtime_seconds_quota"].to_json
        workflow_runtime_seconds_quota = Vellum::Quota.from_json(json_object: workflow_runtime_seconds_quota)
      else
        workflow_runtime_seconds_quota = nil
      end
      max_workflow_runtime_seconds = parsed_json["max_workflow_runtime_seconds"]
      new(
        vembda_service_tier: vembda_service_tier,
        prompt_executions_quota: prompt_executions_quota,
        workflow_executions_quota: workflow_executions_quota,
        workflow_runtime_seconds_quota: workflow_runtime_seconds_quota,
        max_workflow_runtime_seconds: max_workflow_runtime_seconds,
        additional_properties: struct
      )
    end
# Serialize an instance of OrganizationLimitConfig to a JSON object
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
      obj.vembda_service_tier&.is_a?(Vellum::VembdaServiceTierEnum) != false || raise("Passed value for field obj.vembda_service_tier is not the expected type, validation failed.")
      obj.prompt_executions_quota.nil? || Vellum::Quota.validate_raw(obj: obj.prompt_executions_quota)
      obj.workflow_executions_quota.nil? || Vellum::Quota.validate_raw(obj: obj.workflow_executions_quota)
      obj.workflow_runtime_seconds_quota.nil? || Vellum::Quota.validate_raw(obj: obj.workflow_runtime_seconds_quota)
      obj.max_workflow_runtime_seconds&.is_a?(Integer) != false || raise("Passed value for field obj.max_workflow_runtime_seconds is not the expected type, validation failed.")
    end
  end
end