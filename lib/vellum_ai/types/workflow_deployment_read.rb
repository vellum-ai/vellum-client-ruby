# frozen_string_literal: true

require_relative "entity_status"
require_relative "environment_enum"
require "date"
require_relative "vellum_variable"
require "json"

module Vellum
  class WorkflowDeploymentRead
    attr_reader :id, :name, :label, :status, :environment, :created, :last_deployed_on, :input_variables,
                :output_variables, :additional_properties

    # @param id [String]
    # @param name [String] A name that uniquely identifies this workflow deployment within its workspace
    # @param label [String] A human-readable label for the workflow deployment
    # @param status [ENTITY_STATUS] The current status of the workflow deployment
    #   - `ACTIVE` - Active
    #   - `ARCHIVED` - Archived
    # @param environment [ENVIRONMENT_ENUM] The environment this workflow deployment is used in
    #   - `DEVELOPMENT` - Development
    #   - `STAGING` - Staging
    #   - `PRODUCTION` - Production
    # @param created [DateTime]
    # @param last_deployed_on [DateTime]
    # @param input_variables [Array<VellumVariable>] The input variables this Workflow Deployment expects to receive values for when it is executed.
    # @param output_variables [Array<VellumVariable>] The output variables this Workflow Deployment produces values for when it's executed.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [WorkflowDeploymentRead]
    def initialize(id:, name:, label:, created:, last_deployed_on:, input_variables:, output_variables:, status: nil,
                   environment: nil, additional_properties: nil)
      # @type [String]
      @id = id
      # @type [String] A name that uniquely identifies this workflow deployment within its workspace
      @name = name
      # @type [String] A human-readable label for the workflow deployment
      @label = label
      # @type [ENTITY_STATUS] The current status of the workflow deployment
      #   - `ACTIVE` - Active
      #   - `ARCHIVED` - Archived
      @status = status
      # @type [ENVIRONMENT_ENUM] The environment this workflow deployment is used in
      #   - `DEVELOPMENT` - Development
      #   - `STAGING` - Staging
      #   - `PRODUCTION` - Production
      @environment = environment
      # @type [DateTime]
      @created = created
      # @type [DateTime]
      @last_deployed_on = last_deployed_on
      # @type [Array<VellumVariable>] The input variables this Workflow Deployment expects to receive values for when it is executed.
      @input_variables = input_variables
      # @type [Array<VellumVariable>] The output variables this Workflow Deployment produces values for when it's executed.
      @output_variables = output_variables
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of WorkflowDeploymentRead
    #
    # @param json_object [JSON]
    # @return [WorkflowDeploymentRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      name = struct.name
      label = struct.label
      status = ENTITY_STATUS.key(parsed_json["status"]) || parsed_json["status"]
      environment = ENVIRONMENT_ENUM.key(parsed_json["environment"]) || parsed_json["environment"]
      created = DateTime.parse(parsed_json["created"])
      last_deployed_on = DateTime.parse(parsed_json["last_deployed_on"])
      input_variables = parsed_json["input_variables"].map do |v|
        v = v.to_json
        VellumVariable.from_json(json_object: v)
      end
      output_variables = parsed_json["output_variables"].map do |v|
        v = v.to_json
        VellumVariable.from_json(json_object: v)
      end
      new(id: id, name: name, label: label, status: status, environment: environment, created: created,
          last_deployed_on: last_deployed_on, input_variables: input_variables, output_variables: output_variables, additional_properties: struct)
    end

    # Serialize an instance of WorkflowDeploymentRead to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "id": @id,
        "name": @name,
        "label": @label,
        "status": ENTITY_STATUS[@status] || @status,
        "environment": ENVIRONMENT_ENUM[@environment] || @environment,
        "created": @created,
        "last_deployed_on": @last_deployed_on,
        "input_variables": @input_variables,
        "output_variables": @output_variables
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.status&.is_a?(ENTITY_STATUS) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.environment&.is_a?(ENVIRONMENT_ENUM) != false || raise("Passed value for field obj.environment is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.last_deployed_on.is_a?(DateTime) != false || raise("Passed value for field obj.last_deployed_on is not the expected type, validation failed.")
      obj.input_variables.is_a?(Array) != false || raise("Passed value for field obj.input_variables is not the expected type, validation failed.")
      obj.output_variables.is_a?(Array) != false || raise("Passed value for field obj.output_variables is not the expected type, validation failed.")
    end
  end
end
