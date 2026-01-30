# frozen_string_literal: true
require "date"
require_relative "entity_status"
require_relative "environment_enum"
require "date"
require_relative "vellum_variable"
require "ostruct"
require "json"

module Vellum
# A subset of a Prompt Deployment's full details.
  class SlimDeploymentRead
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created
  # @return [String] A human-readable label for the deployment
    attr_reader :label
  # @return [String] A name that uniquely identifies this deployment within its workspace
    attr_reader :name
  # @return [Vellum::EntityStatus] The current status of the deployment
#  * `ACTIVE` - Active
#  * `ARCHIVED` - Archived
#  * `PENDING_DELETION` - Pending Deletion
    attr_reader :status
  # @return [Vellum::EnvironmentEnum] Deprecated. The value returned will always be 'PRODUCTION'.
    attr_reader :environment
  # @return [DateTime] 
    attr_reader :last_deployed_on
  # @return [Array<Vellum::VellumVariable>] 
    attr_reader :input_variables
  # @return [String] A human-readable description of the deployment
    attr_reader :description
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created [DateTime] 
    # @param label [String] A human-readable label for the deployment
    # @param name [String] A name that uniquely identifies this deployment within its workspace
    # @param status [Vellum::EntityStatus] The current status of the deployment
#  * `ACTIVE` - Active
#  * `ARCHIVED` - Archived
#  * `PENDING_DELETION` - Pending Deletion
    # @param environment [Vellum::EnvironmentEnum] Deprecated. The value returned will always be 'PRODUCTION'.
    # @param last_deployed_on [DateTime] 
    # @param input_variables [Array<Vellum::VellumVariable>] 
    # @param description [String] A human-readable description of the deployment
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SlimDeploymentRead]
    def initialize(id:, created:, label:, name:, status: OMIT, environment: OMIT, last_deployed_on:, input_variables:, description: OMIT, additional_properties: nil)
      @id = id
      @created = created
      @label = label
      @name = name
      @status = status if status != OMIT
      @environment = environment if environment != OMIT
      @last_deployed_on = last_deployed_on
      @input_variables = input_variables
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created": created, "label": label, "name": name, "status": status, "environment": environment, "last_deployed_on": last_deployed_on, "input_variables": input_variables, "description": description }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SlimDeploymentRead
    #
    # @param json_object [String] 
    # @return [Vellum::SlimDeploymentRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created = unless parsed_json["created"].nil?
  DateTime.parse(parsed_json["created"])
else
  nil
end
      label = parsed_json["label"]
      name = parsed_json["name"]
      status = parsed_json["status"]
      environment = parsed_json["environment"]
      last_deployed_on = unless parsed_json["last_deployed_on"].nil?
  DateTime.parse(parsed_json["last_deployed_on"])
else
  nil
end
      input_variables = parsed_json["input_variables"]&.map do | item |
  item = item.to_json
  Vellum::VellumVariable.from_json(json_object: item)
end
      description = parsed_json["description"]
      new(
        id: id,
        created: created,
        label: label,
        name: name,
        status: status,
        environment: environment,
        last_deployed_on: last_deployed_on,
        input_variables: input_variables,
        description: description,
        additional_properties: struct
      )
    end
# Serialize an instance of SlimDeploymentRead to a JSON object
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
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.status&.is_a?(Vellum::EntityStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.environment&.is_a?(Vellum::EnvironmentEnum) != false || raise("Passed value for field obj.environment is not the expected type, validation failed.")
      obj.last_deployed_on.is_a?(DateTime) != false || raise("Passed value for field obj.last_deployed_on is not the expected type, validation failed.")
      obj.input_variables.is_a?(Array) != false || raise("Passed value for field obj.input_variables is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end