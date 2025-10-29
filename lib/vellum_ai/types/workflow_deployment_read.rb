# frozen_string_literal: true
require_relative "entity_status"
require_relative "environment_enum"
require "date"
require "date"
require_relative "vellum_variable"
require_relative "workflow_deployment_display_data"
require "ostruct"
require "json"

module Vellum
# A Workflow Deployment's full details.
  class WorkflowDeploymentRead
  # @return [String] 
    attr_reader :id
  # @return [String] A name that uniquely identifies this workflow deployment within its workspace
    attr_reader :name
  # @return [String] A human-readable label for the workflow deployment
    attr_reader :label
  # @return [Vellum::EntityStatus] The current status of the workflow deployment
#  * `ACTIVE` - Active
#  * `ARCHIVED` - Archived
    attr_reader :status
  # @return [Vellum::EnvironmentEnum] Deprecated. The value returned will always be 'PRODUCTION'.
    attr_reader :environment
  # @return [DateTime] 
    attr_reader :created
  # @return [DateTime] 
    attr_reader :last_deployed_on
  # @return [String] The ID of the history item associated with this Workflow Deployment's LATEST
#  Release Tag
    attr_reader :last_deployed_history_item_id
  # @return [Array<Vellum::VellumVariable>] The input variables this Workflow Deployment expects to receive values for when
#  it is executed.
    attr_reader :input_variables
  # @return [Array<Vellum::VellumVariable>] The output variables this Workflow Deployment produces values for when it's
#  executed.
    attr_reader :output_variables
  # @return [String] A human-readable description of the workflow deployment
    attr_reader :description
  # @return [Vellum::WorkflowDeploymentDisplayData] Information used to display this Workflow Deployment.
    attr_reader :display_data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param name [String] A name that uniquely identifies this workflow deployment within its workspace
    # @param label [String] A human-readable label for the workflow deployment
    # @param status [Vellum::EntityStatus] The current status of the workflow deployment
#  * `ACTIVE` - Active
#  * `ARCHIVED` - Archived
    # @param environment [Vellum::EnvironmentEnum] Deprecated. The value returned will always be 'PRODUCTION'.
    # @param created [DateTime] 
    # @param last_deployed_on [DateTime] 
    # @param last_deployed_history_item_id [String] The ID of the history item associated with this Workflow Deployment's LATEST
#  Release Tag
    # @param input_variables [Array<Vellum::VellumVariable>] The input variables this Workflow Deployment expects to receive values for when
#  it is executed.
    # @param output_variables [Array<Vellum::VellumVariable>] The output variables this Workflow Deployment produces values for when it's
#  executed.
    # @param description [String] A human-readable description of the workflow deployment
    # @param display_data [Vellum::WorkflowDeploymentDisplayData] Information used to display this Workflow Deployment.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowDeploymentRead]
    def initialize(id:, name:, label:, status: OMIT, environment: OMIT, created:, last_deployed_on:, last_deployed_history_item_id:, input_variables:, output_variables:, description: OMIT, display_data: OMIT, additional_properties: nil)
      @id = id
      @name = name
      @label = label
      @status = status if status != OMIT
      @environment = environment if environment != OMIT
      @created = created
      @last_deployed_on = last_deployed_on
      @last_deployed_history_item_id = last_deployed_history_item_id
      @input_variables = input_variables
      @output_variables = output_variables
      @description = description if description != OMIT
      @display_data = display_data if display_data != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "label": label, "status": status, "environment": environment, "created": created, "last_deployed_on": last_deployed_on, "last_deployed_history_item_id": last_deployed_history_item_id, "input_variables": input_variables, "output_variables": output_variables, "description": description, "display_data": display_data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowDeploymentRead
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowDeploymentRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      label = parsed_json["label"]
      status = parsed_json["status"]
      environment = parsed_json["environment"]
      created = unless parsed_json["created"].nil?
  DateTime.parse(parsed_json["created"])
else
  nil
end
      last_deployed_on = unless parsed_json["last_deployed_on"].nil?
  DateTime.parse(parsed_json["last_deployed_on"])
else
  nil
end
      last_deployed_history_item_id = parsed_json["last_deployed_history_item_id"]
      input_variables = parsed_json["input_variables"]&.map do | item |
  item = item.to_json
  Vellum::VellumVariable.from_json(json_object: item)
end
      output_variables = parsed_json["output_variables"]&.map do | item |
  item = item.to_json
  Vellum::VellumVariable.from_json(json_object: item)
end
      description = parsed_json["description"]
      unless parsed_json["display_data"].nil?
        display_data = parsed_json["display_data"].to_json
        display_data = Vellum::WorkflowDeploymentDisplayData.from_json(json_object: display_data)
      else
        display_data = nil
      end
      new(
        id: id,
        name: name,
        label: label,
        status: status,
        environment: environment,
        created: created,
        last_deployed_on: last_deployed_on,
        last_deployed_history_item_id: last_deployed_history_item_id,
        input_variables: input_variables,
        output_variables: output_variables,
        description: description,
        display_data: display_data,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowDeploymentRead to a JSON object
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
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.status&.is_a?(Vellum::EntityStatus) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
      obj.environment&.is_a?(Vellum::EnvironmentEnum) != false || raise("Passed value for field obj.environment is not the expected type, validation failed.")
      obj.created.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      obj.last_deployed_on.is_a?(DateTime) != false || raise("Passed value for field obj.last_deployed_on is not the expected type, validation failed.")
      obj.last_deployed_history_item_id.is_a?(String) != false || raise("Passed value for field obj.last_deployed_history_item_id is not the expected type, validation failed.")
      obj.input_variables.is_a?(Array) != false || raise("Passed value for field obj.input_variables is not the expected type, validation failed.")
      obj.output_variables.is_a?(Array) != false || raise("Passed value for field obj.output_variables is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.display_data.nil? || Vellum::WorkflowDeploymentDisplayData.validate_raw(obj: obj.display_data)
    end
  end
end