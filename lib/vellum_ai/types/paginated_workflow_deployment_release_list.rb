# frozen_string_literal: true
require_relative "workflow_deployment_release"
require "ostruct"
require "json"

module Vellum
  class PaginatedWorkflowDeploymentReleaseList
  # @return [Integer] 
    attr_reader :count
  # @return [String] 
    attr_reader :next_
  # @return [String] 
    attr_reader :previous
  # @return [Array<Vellum::WorkflowDeploymentRelease>] 
    attr_reader :results
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param count [Integer] 
    # @param next_ [String] 
    # @param previous [String] 
    # @param results [Array<Vellum::WorkflowDeploymentRelease>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PaginatedWorkflowDeploymentReleaseList]
    def initialize(count: OMIT, next_: OMIT, previous: OMIT, results: OMIT, additional_properties: nil)
      @count = count if count != OMIT
      @next_ = next_ if next_ != OMIT
      @previous = previous if previous != OMIT
      @results = results if results != OMIT
      @additional_properties = additional_properties
      @_field_set = { "count": count, "next": next_, "previous": previous, "results": results }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  PaginatedWorkflowDeploymentReleaseList
    #
    # @param json_object [String] 
    # @return [Vellum::PaginatedWorkflowDeploymentReleaseList]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      count = parsed_json["count"]
      next_ = parsed_json["next"]
      previous = parsed_json["previous"]
      results = parsed_json["results"]&.map do | item |
  item = item.to_json
  Vellum::WorkflowDeploymentRelease.from_json(json_object: item)
end
      new(
        count: count,
        next_: next_,
        previous: previous,
        results: results,
        additional_properties: struct
      )
    end
# Serialize an instance of PaginatedWorkflowDeploymentReleaseList to a JSON object
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
      obj.count&.is_a?(Integer) != false || raise("Passed value for field obj.count is not the expected type, validation failed.")
      obj.next_&.is_a?(String) != false || raise("Passed value for field obj.next_ is not the expected type, validation failed.")
      obj.previous&.is_a?(String) != false || raise("Passed value for field obj.previous is not the expected type, validation failed.")
      obj.results&.is_a?(Array) != false || raise("Passed value for field obj.results is not the expected type, validation failed.")
    end
  end
end