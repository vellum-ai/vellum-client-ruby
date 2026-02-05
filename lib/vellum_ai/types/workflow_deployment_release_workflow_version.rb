# frozen_string_literal: true
require_relative "vellum_variable"
require_relative "workflow_dependency"
require "ostruct"
require "json"

module Vellum
# Mixin for serializers using VellumSerializerMethodField to enable custom OpenAPI
#  required behavior.
#  This mixin must be used with any serializer that contains
#  VellumSerializerMethodField fields
#  for the custom required behavior to work correctly.
#  Usage:
#  class MySerializer(VellumSerializerMethodFieldMixin,
#  serializers.Serializer):
#  computed = VellumSerializerMethodField(required=True)
  class WorkflowDeploymentReleaseWorkflowVersion
  # @return [String] 
    attr_reader :id
  # @return [Array<Vellum::VellumVariable>] 
    attr_reader :input_variables
  # @return [Array<Vellum::VellumVariable>] 
    attr_reader :output_variables
  # @return [Array<Vellum::WorkflowDependency>] 
    attr_reader :dependencies
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param input_variables [Array<Vellum::VellumVariable>] 
    # @param output_variables [Array<Vellum::VellumVariable>] 
    # @param dependencies [Array<Vellum::WorkflowDependency>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowDeploymentReleaseWorkflowVersion]
    def initialize(id:, input_variables:, output_variables:, dependencies: OMIT, additional_properties: nil)
      @id = id
      @input_variables = input_variables
      @output_variables = output_variables
      @dependencies = dependencies if dependencies != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "input_variables": input_variables, "output_variables": output_variables, "dependencies": dependencies }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  WorkflowDeploymentReleaseWorkflowVersion
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowDeploymentReleaseWorkflowVersion]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      input_variables = parsed_json["input_variables"]&.map do | item |
  item = item.to_json
  Vellum::VellumVariable.from_json(json_object: item)
end
      output_variables = parsed_json["output_variables"]&.map do | item |
  item = item.to_json
  Vellum::VellumVariable.from_json(json_object: item)
end
      dependencies = parsed_json["dependencies"]&.map do | item |
  item = item.to_json
  Vellum::WorkflowDependency.from_json(json_object: item)
end
      new(
        id: id,
        input_variables: input_variables,
        output_variables: output_variables,
        dependencies: dependencies,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowDeploymentReleaseWorkflowVersion to a JSON
#  object
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
      obj.input_variables.is_a?(Array) != false || raise("Passed value for field obj.input_variables is not the expected type, validation failed.")
      obj.output_variables.is_a?(Array) != false || raise("Passed value for field obj.output_variables is not the expected type, validation failed.")
      obj.dependencies&.is_a?(Array) != false || raise("Passed value for field obj.dependencies is not the expected type, validation failed.")
    end
  end
end