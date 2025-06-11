# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class SubworkflowNodeResultData
  # @return [String] 
    attr_reader :execution_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param execution_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SubworkflowNodeResultData]
    def initialize(execution_id: OMIT, additional_properties: nil)
      @execution_id = execution_id if execution_id != OMIT
      @additional_properties = additional_properties
      @_field_set = { "execution_id": execution_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SubworkflowNodeResultData
    #
    # @param json_object [String] 
    # @return [Vellum::SubworkflowNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      execution_id = parsed_json["execution_id"]
      new(execution_id: execution_id, additional_properties: struct)
    end
# Serialize an instance of SubworkflowNodeResultData to a JSON object
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
      obj.execution_id&.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
    end
  end
end