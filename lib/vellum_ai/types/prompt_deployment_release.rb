# frozen_string_literal: true
require "date"
require_relative "release_environment"
require_relative "release_created_by"
require_relative "prompt_deployment_release_prompt_version"
require_relative "prompt_deployment_release_prompt_deployment"
require_relative "release_release_tag"
require_relative "slim_release_review"
require "ostruct"
require "json"

module Vellum
  class PromptDeploymentRelease
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created
  # @return [Vellum::ReleaseEnvironment] 
    attr_reader :environment
  # @return [Vellum::ReleaseCreatedBy] 
    attr_reader :created_by
  # @return [Vellum::PromptDeploymentReleasePromptVersion] 
    attr_reader :prompt_version
  # @return [Vellum::PromptDeploymentReleasePromptDeployment] 
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
    # @param prompt_version [Vellum::PromptDeploymentReleasePromptVersion] 
    # @param deployment [Vellum::PromptDeploymentReleasePromptDeployment] 
    # @param description [String] 
    # @param release_tags [Array<Vellum::ReleaseReleaseTag>] 
    # @param reviews [Array<Vellum::SlimReleaseReview>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PromptDeploymentRelease]
    def initialize(id: OMIT, created: OMIT, environment:, created_by: OMIT, prompt_version:, deployment:, description: OMIT, release_tags:, reviews:, additional_properties: nil)
      @id = id if id != OMIT
      @created = created if created != OMIT
      @environment = environment
      @created_by = created_by if created_by != OMIT
      @prompt_version = prompt_version
      @deployment = deployment
      @description = description if description != OMIT
      @release_tags = release_tags
      @reviews = reviews
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created": created, "environment": environment, "created_by": created_by, "prompt_version": prompt_version, "deployment": deployment, "description": description, "release_tags": release_tags, "reviews": reviews }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PromptDeploymentRelease
    #
    # @param json_object [String] 
    # @return [Vellum::PromptDeploymentRelease]
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
      unless parsed_json["prompt_version"].nil?
        prompt_version = parsed_json["prompt_version"].to_json
        prompt_version = Vellum::PromptDeploymentReleasePromptVersion.from_json(json_object: prompt_version)
      else
        prompt_version = nil
      end
      unless parsed_json["deployment"].nil?
        deployment = parsed_json["deployment"].to_json
        deployment = Vellum::PromptDeploymentReleasePromptDeployment.from_json(json_object: deployment)
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
        prompt_version: prompt_version,
        deployment: deployment,
        description: description,
        release_tags: release_tags,
        reviews: reviews,
        additional_properties: struct
      )
    end
# Serialize an instance of PromptDeploymentRelease to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.created&.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      Vellum::ReleaseEnvironment.validate_raw(obj: obj.environment)
      obj.created_by.nil? || Vellum::ReleaseCreatedBy.validate_raw(obj: obj.created_by)
      Vellum::PromptDeploymentReleasePromptVersion.validate_raw(obj: obj.prompt_version)
      Vellum::PromptDeploymentReleasePromptDeployment.validate_raw(obj: obj.deployment)
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.release_tags.is_a?(Array) != false || raise("Passed value for field obj.release_tags is not the expected type, validation failed.")
      obj.reviews.is_a?(Array) != false || raise("Passed value for field obj.reviews is not the expected type, validation failed.")
    end
  end
end