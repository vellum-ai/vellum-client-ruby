# frozen_string_literal: true
require_relative "parent_context"
require_relative "span_link"
require_relative "workflow_release_tag_enum"
require "ostruct"
require "json"

module Vellum
  class WorkflowDeploymentParentContext
  # @return [Vellum::ParentContext] 
    attr_reader :parent
  # @return [Array<Vellum::SpanLink>] 
    attr_reader :links
  # @return [Vellum::WorkflowReleaseTagEnum] 
    attr_reader :type
  # @return [String] 
    attr_reader :span_id
  # @return [String] 
    attr_reader :deployment_id
  # @return [String] 
    attr_reader :deployment_name
  # @return [String] 
    attr_reader :deployment_history_item_id
  # @return [String] 
    attr_reader :release_tag_id
  # @return [String] 
    attr_reader :release_tag_name
  # @return [String] 
    attr_reader :external_id
  # @return [Hash{String => Object}] 
    attr_reader :metadata
  # @return [String] 
    attr_reader :workflow_version_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param parent [Vellum::ParentContext] 
    # @param links [Array<Vellum::SpanLink>] 
    # @param type [Vellum::WorkflowReleaseTagEnum] 
    # @param span_id [String] 
    # @param deployment_id [String] 
    # @param deployment_name [String] 
    # @param deployment_history_item_id [String] 
    # @param release_tag_id [String] 
    # @param release_tag_name [String] 
    # @param external_id [String] 
    # @param metadata [Hash{String => Object}] 
    # @param workflow_version_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowDeploymentParentContext]
    def initialize(parent: OMIT, links: OMIT, type:, span_id:, deployment_id:, deployment_name:, deployment_history_item_id:, release_tag_id:, release_tag_name:, external_id: OMIT, metadata: OMIT, workflow_version_id:, additional_properties: nil)
      @parent = parent if parent != OMIT
      @links = links if links != OMIT
      @type = type
      @span_id = span_id
      @deployment_id = deployment_id
      @deployment_name = deployment_name
      @deployment_history_item_id = deployment_history_item_id
      @release_tag_id = release_tag_id
      @release_tag_name = release_tag_name
      @external_id = external_id if external_id != OMIT
      @metadata = metadata if metadata != OMIT
      @workflow_version_id = workflow_version_id
      @additional_properties = additional_properties
      @_field_set = { "parent": parent, "links": links, "type": type, "span_id": span_id, "deployment_id": deployment_id, "deployment_name": deployment_name, "deployment_history_item_id": deployment_history_item_id, "release_tag_id": release_tag_id, "release_tag_name": release_tag_name, "external_id": external_id, "metadata": metadata, "workflow_version_id": workflow_version_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowDeploymentParentContext
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowDeploymentParentContext]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["parent"].nil?
        parent = parsed_json["parent"].to_json
        parent = Vellum::ParentContext.from_json(json_object: parent)
      else
        parent = nil
      end
      links = parsed_json["links"]&.map do | item |
  item = item.to_json
  Vellum::SpanLink.from_json(json_object: item)
end
      type = parsed_json["type"]
      span_id = parsed_json["span_id"]
      deployment_id = parsed_json["deployment_id"]
      deployment_name = parsed_json["deployment_name"]
      deployment_history_item_id = parsed_json["deployment_history_item_id"]
      release_tag_id = parsed_json["release_tag_id"]
      release_tag_name = parsed_json["release_tag_name"]
      external_id = parsed_json["external_id"]
      metadata = parsed_json["metadata"]
      workflow_version_id = parsed_json["workflow_version_id"]
      new(
        parent: parent,
        links: links,
        type: type,
        span_id: span_id,
        deployment_id: deployment_id,
        deployment_name: deployment_name,
        deployment_history_item_id: deployment_history_item_id,
        release_tag_id: release_tag_id,
        release_tag_name: release_tag_name,
        external_id: external_id,
        metadata: metadata,
        workflow_version_id: workflow_version_id,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowDeploymentParentContext to a JSON object
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
      obj.parent.nil? || Vellum::ParentContext.validate_raw(obj: obj.parent)
      obj.links&.is_a?(Array) != false || raise("Passed value for field obj.links is not the expected type, validation failed.")
      obj.type.is_a?(Vellum::WorkflowReleaseTagEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.span_id.is_a?(String) != false || raise("Passed value for field obj.span_id is not the expected type, validation failed.")
      obj.deployment_id.is_a?(String) != false || raise("Passed value for field obj.deployment_id is not the expected type, validation failed.")
      obj.deployment_name.is_a?(String) != false || raise("Passed value for field obj.deployment_name is not the expected type, validation failed.")
      obj.deployment_history_item_id.is_a?(String) != false || raise("Passed value for field obj.deployment_history_item_id is not the expected type, validation failed.")
      obj.release_tag_id.is_a?(String) != false || raise("Passed value for field obj.release_tag_id is not the expected type, validation failed.")
      obj.release_tag_name.is_a?(String) != false || raise("Passed value for field obj.release_tag_name is not the expected type, validation failed.")
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
      obj.workflow_version_id.is_a?(String) != false || raise("Passed value for field obj.workflow_version_id is not the expected type, validation failed.")
    end
  end
end