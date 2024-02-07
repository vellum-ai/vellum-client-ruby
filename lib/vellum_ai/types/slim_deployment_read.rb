# frozen_string_literal: true

require "date"
require_relative "entity_status"
require_relative "environment_enum"
require_relative "vellum_variable"
require "json"

module Vellum
  class SlimDeploymentRead
    attr_reader :id, :created, :label, :name, :status, :environment, :last_deployed_on, :input_variables,
                :additional_properties

    # @param id [String]
    # @param created [DateTime]
    # @param label [String] A human-readable label for the deployment
    # @param name [String] A name that uniquely identifies this deployment within its workspace
    # @param status [ENTITY_STATUS] The current status of the deployment
    #   - `ACTIVE` - Active
    #   - `ARCHIVED` - Archived
    # @param environment [ENVIRONMENT_ENUM] The environment this deployment is used in
    #   - `DEVELOPMENT` - Development
    #   - `STAGING` - Staging
    #   - `PRODUCTION` - Production
    # @param last_deployed_on [DateTime]
    # @param input_variables [Array<VellumVariable>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SlimDeploymentRead]
    def initialize(id:, created:, label:, name:, last_deployed_on:, input_variables:, status: nil, environment: nil,
                   additional_properties: nil)
      # @type [String]
      @id = id
      # @type [DateTime]
      @created = created
      # @type [String] A human-readable label for the deployment
      @label = label
      # @type [String] A name that uniquely identifies this deployment within its workspace
      @name = name
      # @type [ENTITY_STATUS] The current status of the deployment
      #   - `ACTIVE` - Active
      #   - `ARCHIVED` - Archived
      @status = status
      # @type [ENVIRONMENT_ENUM] The environment this deployment is used in
      #   - `DEVELOPMENT` - Development
      #   - `STAGING` - Staging
      #   - `PRODUCTION` - Production
      @environment = environment
      # @type [DateTime]
      @last_deployed_on = last_deployed_on
      # @type [Array<VellumVariable>]
      @input_variables = input_variables
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of SlimDeploymentRead
    #
    # @param json_object [JSON]
    # @return [SlimDeploymentRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      created = DateTime.parse(parsed_json["created"])
      label = struct.label
      name = struct.name
      status = ENTITY_STATUS.key(parsed_json["status"]) || parsed_json["status"]
      environment = ENVIRONMENT_ENUM.key(parsed_json["environment"]) || parsed_json["environment"]
      last_deployed_on = DateTime.parse(parsed_json["last_deployed_on"])
      input_variables = parsed_json["input_variables"].map do |v|
        v = v.to_json
        VellumVariable.from_json(json_object: v)
      end
      new(id: id, created: created, label: label, name: name, status: status, environment: environment,
          last_deployed_on: last_deployed_on, input_variables: input_variables, additional_properties: struct)
    end

    # Serialize an instance of SlimDeploymentRead to a JSON object
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
        "last_deployed_on": @last_deployed_on,
        "input_variables": @input_variables
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
      obj.last_deployed_on.is_a?(DateTime) != false || raise("Passed value for field obj.last_deployed_on is not the expected type, validation failed.")
      obj.input_variables.is_a?(Array) != false || raise("Passed value for field obj.input_variables is not the expected type, validation failed.")
    end
  end
end
