# frozen_string_literal: true
require_relative "slim_workflow_execution_read"
require "ostruct"
require "json"

module Vellum
  class WorkflowDeploymentEventExecutionsResponse
  # @return [Integer] 
    attr_reader :count
  # @return [Array<Vellum::SlimWorkflowExecutionRead>] 
    attr_reader :results
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param count [Integer] 
    # @param results [Array<Vellum::SlimWorkflowExecutionRead>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowDeploymentEventExecutionsResponse]
    def initialize(count:, results:, additional_properties: nil)
      @count = count
      @results = results
      @additional_properties = additional_properties
      @_field_set = { "count": count, "results": results }
    end
# Deserialize a JSON object to an instance of
#  WorkflowDeploymentEventExecutionsResponse
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowDeploymentEventExecutionsResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      count = parsed_json["count"]
      results = parsed_json["results"]&.map do | item |
  item = item.to_json
  Vellum::SlimWorkflowExecutionRead.from_json(json_object: item)
end
      new(
        count: count,
        results: results,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowDeploymentEventExecutionsResponse to a JSON
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
      obj.count.is_a?(Integer) != false || raise("Passed value for field obj.count is not the expected type, validation failed.")
      obj.results.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
    end
  end
end