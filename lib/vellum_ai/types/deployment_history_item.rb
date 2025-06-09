# frozen_string_literal: true
require "date"
require_relative "vellum_variable"
require "ostruct"
require "json"

module Vellum
  class DeploymentHistoryItem
  # @return [String] 
    attr_reader :id
  # @return [String] 
    attr_reader :deployment_id
  # @return [DateTime] 
    attr_reader :timestamp
  # @return [String] A human-readable label for the deployment
    attr_reader :label
  # @return [String] A name that uniquely identifies this deployment within its workspace
    attr_reader :name
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
    # @param deployment_id [String] 
    # @param timestamp [DateTime] 
    # @param label [String] A human-readable label for the deployment
    # @param name [String] A name that uniquely identifies this deployment within its workspace
    # @param input_variables [Array<Vellum::VellumVariable>] 
    # @param description [String] A human-readable description of the deployment
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::DeploymentHistoryItem]
    def initialize(id:, deployment_id:, timestamp:, label:, name:, input_variables:, description: OMIT, additional_properties: nil)
      @id = id
      @deployment_id = deployment_id
      @timestamp = timestamp
      @label = label
      @name = name
      @input_variables = input_variables
      @description = description if description != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "deployment_id": deployment_id, "timestamp": timestamp, "label": label, "name": name, "input_variables": input_variables, "description": description }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DeploymentHistoryItem
    #
    # @param json_object [String] 
    # @return [Vellum::DeploymentHistoryItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      deployment_id = parsed_json["deployment_id"]
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
      description = parsed_json["description"]
      new(
        id: id,
        deployment_id: deployment_id,
        timestamp: timestamp,
        label: label,
        name: name,
        input_variables: input_variables,
        description: description,
        additional_properties: struct
      )
    end
# Serialize an instance of DeploymentHistoryItem to a JSON object
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
      obj.deployment_id.is_a?(String) != false || raise("Passed value for field obj.deployment_id is not the expected type, validation failed.")
      obj.timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.input_variables.is_a?(Array) != false || raise("Passed value for field obj.input_variables is not the expected type, validation failed.")
      obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
    end
  end
end