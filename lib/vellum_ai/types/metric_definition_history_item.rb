# frozen_string_literal: true
require_relative "vellum_variable"
require "ostruct"
require "json"

module Vellum
  class MetricDefinitionHistoryItem
  # @return [String] 
    attr_reader :id
  # @return [String] A human-readable label for the metric
    attr_reader :label
  # @return [String] A name that uniquely identifies this metric within its workspace
    attr_reader :name
  # @return [String] 
    attr_reader :description
  # @return [Array<Vellum::VellumVariable>] 
    attr_reader :input_variables
  # @return [Array<Vellum::VellumVariable>] 
    attr_reader :output_variables
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param label [String] A human-readable label for the metric
    # @param name [String] A name that uniquely identifies this metric within its workspace
    # @param description [String] 
    # @param input_variables [Array<Vellum::VellumVariable>] 
    # @param output_variables [Array<Vellum::VellumVariable>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::MetricDefinitionHistoryItem]
    def initialize(id:, label:, name:, description:, input_variables: OMIT, output_variables: OMIT, additional_properties: nil)
      @id = id
      @label = label
      @name = name
      @description = description
      @input_variables = input_variables if input_variables != OMIT
      @output_variables = output_variables if output_variables != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "label": label, "name": name, "description": description, "input_variables": input_variables, "output_variables": output_variables }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of MetricDefinitionHistoryItem
    #
    # @param json_object [String] 
    # @return [Vellum::MetricDefinitionHistoryItem]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      label = parsed_json["label"]
      name = parsed_json["name"]
      description = parsed_json["description"]
      input_variables = parsed_json["input_variables"]&.map do | item |
  item = item.to_json
  Vellum::VellumVariable.from_json(json_object: item)
end
      output_variables = parsed_json["output_variables"]&.map do | item |
  item = item.to_json
  Vellum::VellumVariable.from_json(json_object: item)
end
      new(
        id: id,
        label: label,
        name: name,
        description: description,
        input_variables: input_variables,
        output_variables: output_variables,
        additional_properties: struct
      )
    end
# Serialize an instance of MetricDefinitionHistoryItem to a JSON object
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
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
      obj.input_variables&.is_a?(Array) != false || raise("Passed value for field obj.input_variables is not the expected type, validation failed.")
      obj.output_variables&.is_a?(Array) != false || raise("Passed value for field obj.output_variables is not the expected type, validation failed.")
    end
  end
end