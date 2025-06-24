# frozen_string_literal: true
require "date"
require_relative "release_environment"
require_relative "release_created_by"
require_relative "workflow_deployment_release_workflow_version"
require_relative "workflow_deployment_release_workflow_deployment"
require_relative "release_release_tag"
require_relative "slim_release_review"
require "ostruct"
require "json"

module Vellum
  class WorkflowDeploymentRelease
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created
  # @return [Vellum::ReleaseEnvironment] 
    attr_reader :environment
  # @return [Vellum::ReleaseCreatedBy] 
    attr_reader :created_by
  # @return [Vellum::WorkflowDeploymentReleaseWorkflowVersion] 
    attr_reader :workflow_version
  # @return [Vellum::WorkflowDeploymentReleaseWorkflowDeployment] 
    attr_reader :deployment
  # @return [String] 
    attr_reader :description
  # @return [Array<Vellum::ReleaseReleaseTag>] 
    attr_reader :release_tags
  # @return [Array<Vellum::SlimReleaseReview>] 
    attr_reader :reviews
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created [DateTime] 
    # @param environment [Vellum::ReleaseEnvironment] 
    # @param created_by [Vellum::ReleaseCreatedBy] 
    # @param workflow_version [Vellum::WorkflowDeploymentReleaseWorkflowVersion] 
    # @param deployment [Vellum::WorkflowDeploymentReleaseWorkflowDeployment] 
    # @param description [String] 
    # @param release_tags [Array<Vellum::ReleaseReleaseTag>] 
    # @param reviews [Array<Vellum::SlimReleaseReview>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowDeploymentRelease]
    def initialize(id:, created:, environment:, created_by: OMIT, workflow_version:, deployment:, description: OMIT, release_tags:, reviews:, additional_properties: nil)
      @id = id
      @created = created
      @environment = environment
      @created_by = created_by if created_by != OMIT
      @workflow_version = workflow_version
      @deployment = deployment
      @description = description if description != OMIT
      @release_tags = release_tags
      @reviews = reviews
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created": created, "environment": environment, "created_by": created_by, "workflow_version": workflow_version, "deployment": deployment, "description": description, "release_tags": release_tags, "reviews": reviews }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowDeploymentRelease
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowDeploymentRelease]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created = unless parsed_json["created"].nil?
  DateTime.parse(parsed_json["created"])
else
  nil
end
      unless parsed_json["environment"].nil?
        environment = parsed_json["environment"].to_json
        environment = Vellum::ReleaseEnvironment.from_json(json_object: environment)
      else
        environment = nil
      end
      unless parsed_json["created_by"].nil?
        created_by = parsed_json["created_by"].to_json
        created_by = Vellum::ReleaseCreatedBy.from_json(json_object: created_by)
      else
        created_by = nil
      end
      unless parsed_json["workflow_version"].nil?
        workflow_version = parsed_json["workflow_version"].to_json
        workflow_version = Vellum::WorkflowDeploymentReleaseWorkflowVersion.from_json(json_object: workflow_version)
      else
        workflow_version = nil
      end
      unless parsed_json["deployment"].nil?
        deployment = parsed_json["deployment"].to_json
        deployment = Vellum::WorkflowDeploymentReleaseWorkflowDeployment.from_json(json_object: deployment)
      else
        deployment = nil
      end
      description = parsed_json["description"]
      release_tags = parsed_json["release_tags"]&.map do | item |
  item = item.to_json
  Vellum::ReleaseReleaseTag.from_json(json_object: item)
end
      reviews = parsed_json["reviews"]&.map do | item |
  item = item.to_json
  Vellum::SlimReleaseReview.from_json(json_object: item)
end
      new(
        id: id,
        created: created,
        environment: environment,
        created_by: created_by,
        workflow_version: workflow_version,
        deployment: deployment,
        description: description,
        release_tags: release_tags,
        reviews: reviews,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowDeploymentRelease to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      Vellum::ReleaseEnvironment.validate_raw(obj: obj.environment)
      obj.created_by.nil? || Vellum::ReleaseCreatedBy.validate_raw(obj: obj.created_by)
      Vellum::WorkflowDeploymentReleaseWorkflowVersion.validate_raw(obj: obj.workflow_version)
      Vellum::WorkflowDeploymentReleaseWorkflowDeployment.validate_raw(obj: obj.deployment)
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.release_tags.is_a?(Array) != false || raise("Passed value for field obj.release_tags is not the expected type, validation failed.")
      obj.reviews.is_a?(Array) != false || raise("Passed value for field obj.reviews is not the expected type, validation failed.")
    end
  end
end