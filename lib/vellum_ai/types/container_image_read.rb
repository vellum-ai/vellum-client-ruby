# frozen_string_literal: true
require_relative "entity_visibility"
require "date"
require "date"
require_relative "container_image_container_image_tag"
require_relative "build_status_enum"
require_relative "container_image_build_config"
require "ostruct"
require "json"

module Vellum
  class ContainerImageRead
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :name
  # @return [Vellum::EntityVisibility] 
    attr_reader :visibility
  # @return [DateTime] 
    attr_reader :created
  # @return [DateTime] 
    attr_reader :modified
  # @return [String] 
    attr_reader :repository
  # @return [String] 
    attr_reader :sha
  # @return [Array<Vellum::ContainerImageContainerImageTag>] 
    attr_reader :tags
  # @return [Vellum::BuildStatusEnum] 
    attr_reader :build_status
  # @return [Vellum::ContainerImageBuildConfig] 
    attr_reader :build_config
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param name [String] 
    # @param visibility [Vellum::EntityVisibility] 
    # @param created [DateTime] 
    # @param modified [DateTime] 
    # @param repository [String] 
    # @param sha [String] 
    # @param tags [Array<Vellum::ContainerImageContainerImageTag>] 
    # @param build_status [Vellum::BuildStatusEnum] 
    # @param build_config [Vellum::ContainerImageBuildConfig] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ContainerImageRead]
    def initialize(id:, name:, visibility:, created:, modified:, repository:, sha:, tags:, build_status: OMIT, build_config: OMIT, additional_properties: nil)
      @id = id
      @name = name
      @visibility = visibility
      @created = created
      @modified = modified
      @repository = repository
      @sha = sha
      @tags = tags
      @build_status = build_status if build_status != OMIT
      @build_config = build_config if build_config != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "visibility": visibility, "created": created, "modified": modified, "repository": repository, "sha": sha, "tags": tags, "build_status": build_status, "build_config": build_config }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ContainerImageRead
    #
    # @param json_object [String] 
    # @return [Vellum::ContainerImageRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      visibility = parsed_json["visibility"]
      created = unless parsed_json["created"].nil?
  DateTime.parse(parsed_json["created"])
else
  nil
end
      modified = unless parsed_json["modified"].nil?
  DateTime.parse(parsed_json["modified"])
else
  nil
end
      repository = parsed_json["repository"]
      sha = parsed_json["sha"]
      tags = parsed_json["tags"]&.map do | item |
  item = item.to_json
  Vellum::ContainerImageContainerImageTag.from_json(json_object: item)
end
      build_status = parsed_json["build_status"]
      unless parsed_json["build_config"].nil?
        build_config = parsed_json["build_config"].to_json
        build_config = Vellum::ContainerImageBuildConfig.from_json(json_object: build_config)
      else
        build_config = nil
      end
      new(
        id: id,
        name: name,
        visibility: visibility,
        created: created,
        modified: modified,
        repository: repository,
        sha: sha,
        tags: tags,
        build_status: build_status,
        build_config: build_config,
        additional_properties: struct
      )
    end
# Serialize an instance of ContainerImageRead to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.visibility.is_a?(Vellum::EntityVisibility) != false || raise("Passed value for field obj.visibility is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.modified.is_a?(DateTime) != false || raise("Passed value for field obj.modified is not the expected type, validation failed.")
      obj.repository.is_a?(String) != false || raise("Passed value for field obj.repository is not the expected type, validation failed.")
      obj.sha.is_a?(String) != false || raise("Passed value for field obj.sha is not the expected type, validation failed.")
      obj.tags.is_a?(Array) != false || raise("Passed value for field obj.tags is not the expected type, validation failed.")
      obj.build_status&.is_a?(Vellum::BuildStatusEnum) != false || raise("Passed value for field obj.build_status is not the expected type, validation failed.")
      obj.build_config.nil? || Vellum::ContainerImageBuildConfig.validate_raw(obj: obj.build_config)
    end
  end
end