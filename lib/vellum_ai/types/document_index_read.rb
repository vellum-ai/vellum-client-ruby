# frozen_string_literal: true

require "date"
require_relative "entity_status"
require_relative "environment_enum"
require "json"

module Vellum
  class DocumentIndexRead
    attr_reader :id, :created, :label, :name, :status, :environment, :indexing_config, :additional_properties

    # @param id [String]
    # @param created [DateTime]
    # @param label [String] A human-readable label for the document index
    # @param name [String] A name that uniquely identifies this index within its workspace
    # @param status [ENTITY_STATUS] The current status of the document index
    #   - `ACTIVE` - Active
    #   - `ARCHIVED` - Archived
    # @param environment [ENVIRONMENT_ENUM] The environment this document index is used in
    #   - `DEVELOPMENT` - Development
    #   - `STAGING` - Staging
    #   - `PRODUCTION` - Production
    # @param indexing_config [Hash{String => String}] Configuration representing how documents should be indexed
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [DocumentIndexRead]
    def initialize(id:, created:, label:, name:, indexing_config:, status: nil, environment: nil,
                   additional_properties: nil)
      # @type [String]
      @id = id
      # @type [DateTime]
      @created = created
      # @type [String] A human-readable label for the document index
      @label = label
      # @type [String] A name that uniquely identifies this index within its workspace
      @name = name
      # @type [ENTITY_STATUS] The current status of the document index
      #   - `ACTIVE` - Active
      #   - `ARCHIVED` - Archived
      @status = status
      # @type [ENVIRONMENT_ENUM] The environment this document index is used in
      #   - `DEVELOPMENT` - Development
      #   - `STAGING` - Staging
      #   - `PRODUCTION` - Production
      @environment = environment
      # @type [Hash{String => String}] Configuration representing how documents should be indexed
      @indexing_config = indexing_config
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of DocumentIndexRead
    #
    # @param json_object [JSON]
    # @return [DocumentIndexRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      created = DateTime.parse(parsed_json["created"])
      label = struct.label
      name = struct.name
      status = ENTITY_STATUS.key(parsed_json["status"]) || parsed_json["status"]
      environment = ENVIRONMENT_ENUM.key(parsed_json["environment"]) || parsed_json["environment"]
      indexing_config = struct.indexing_config
      new(id: id, created: created, label: label, name: name, status: status, environment: environment,
          indexing_config: indexing_config, additional_properties: struct)
    end

    # Serialize an instance of DocumentIndexRead to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "id": @id,
        "created": @created,
        "label": @label,
        "name": @name,
        "status": ENTITY_STATUS[@status] || @status,
        "environment": ENVIRONMENT_ENUM[@environment] || @environment,
        "indexing_config": @indexing_config
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.status&.is_a?(ENTITY_STATUS) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.environment&.is_a?(ENVIRONMENT_ENUM) != false || raise("Passed value for field obj.environment is not the expected type, validation failed.")
      obj.indexing_config.is_a?(Hash) != false || raise("Passed value for field obj.indexing_config is not the expected type, validation failed.")
    end
  end
end
