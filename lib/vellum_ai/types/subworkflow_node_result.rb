# frozen_string_literal: true
require_relative "subworkflow_node_result_data"
require "ostruct"
require "json"

module Vellum
# A Node Result Event emitted from a Subworkflow Node.
  class SubworkflowNodeResult
  # @return [String] 
    attr_reader :type
  # @return [Vellum::SubworkflowNodeResultData] 
    attr_reader :data
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] 
    # @param data [Vellum::SubworkflowNodeResultData] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SubworkflowNodeResult]
    def initialize(type:, data: OMIT, additional_properties: nil)
      @type = type
      @data = data if data != OMIT
      @additional_properties = additional_properties
      @_field_set = { "type": type, "data": data }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SubworkflowNodeResult
    #
    # @param json_object [String] 
    # @return [Vellum::SubworkflowNodeResult]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      unless parsed_json["data"].nil?
        data = parsed_json["data"].to_json
        data = Vellum::SubworkflowNodeResultData.from_json(json_object: data)
      else
        data = nil
      end
      new(
        type: type,
        data: data,
        additional_properties: struct
      )
    end
# Serialize an instance of SubworkflowNodeResult to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.data.nil? || Vellum::SubworkflowNodeResultData.validate_raw(obj: obj.data)
    end
  end
end