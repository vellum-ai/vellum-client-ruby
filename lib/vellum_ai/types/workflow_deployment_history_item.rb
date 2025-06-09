# frozen_string_literal: true
require "date"
require_relative "vellum_variable"
require "ostruct"
require "json"

module Vellum
  class WorkflowDeploymentHistoryItem
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :workflow_deployment_id
  # @return [DateTime] 
    attr_reader :timestamp
  # @return [String] A human-readable label for the workflow deployment
    attr_reader :label
  # @return [String] A name that uniquely identifies this workflow deployment within its workspace
    attr_reader :name
  # @return [Array<Vellum::VellumVariable>] 
    attr_reader :input_variables
  # @return [Array<Vellum::VellumVariable>] 
    attr_reader :output_variables
  # @return [String] A human-readable description of the workflow deployment
    attr_reader :description
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param workflow_deployment_id [String] 
    # @param timestamp [DateTime] 
    # @param label [String] A human-readable label for the workflow deployment
    # @param name [String] A name that uniquely identifies this workflow deployment within its workspace
    # @param input_variables [Array<Vellum::VellumVariable>] 
    # @param output_variables [Array<Vellum::VellumVariable>] 
    # @param description [String] A human-readable description of the workflow deployment
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowDeploymentHistoryItem]
    def initialize(id:, workflow_deployment_id:, timestamp:, label:, name:, input_variables:, output_variables:, description: OMIT, additional_properties: nil)
      @id = id
      @workflow_deployment_id = workflow_deployment_id
      @timestamp = timestamp
      @label = label
      @name = name
      @input_variables = input_variables
      @output_variables = output_variables
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "workflow_deployment_id": workflow_deployment_id, "timestamp": timestamp, "label": label, "name": name, "input_variables": input_variables, "output_variables": output_variables, "description": description }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowDeploymentHistoryItem
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowDeploymentHistoryItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      workflow_deployment_id = parsed_json["workflow_deployment_id"]
      timestamp = unless parsed_json["timestamp"].nil?
  DateTime.parse(parsed_json["timestamp"])
else
  nil
end
      label = parsed_json["label"]
      name = parsed_json["name"]
      input_variables = parsed_json["input_variables"]&.map do | item |
  item = item.to_json
  Vellum::VellumVariable.from_json(json_object: item)
end
      output_variables = parsed_json["output_variables"]&.map do | item |
  item = item.to_json
  Vellum::VellumVariable.from_json(json_object: item)
end
      description = parsed_json["description"]
      new(
        id: id,
        workflow_deployment_id: workflow_deployment_id,
        timestamp: timestamp,
        label: label,
        name: name,
        input_variables: input_variables,
        output_variables: output_variables,
        description: description,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowDeploymentHistoryItem to a JSON object
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
      obj.workflow_deployment_id.is_a?(String) != false || raise("Passed value for field obj.workflow_deployment_id is not the expected type, validation failed.")
      obj.timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.input_variables.is_a?(Array) != false || raise("Passed value for field obj.input_variables is not the expected type, validation failed.")
      obj.output_variables.is_a?(Array) != false || raise("Passed value for field obj.output_variables is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end