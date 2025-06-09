# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class WorkflowExecutionSpanAttributes
  # @return [String] 
    attr_reader :label
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param label [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowExecutionSpanAttributes]
    def initialize(label:, additional_properties: nil)
      @label = label
      @additional_properties = additional_properties
      @_field_set = { "label": label }
    end
# Deserialize a JSON object to an instance of WorkflowExecutionSpanAttributes
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowExecutionSpanAttributes]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      label = parsed_json["label"]
      new(label: label, additional_properties: struct)
    end
# Serialize an instance of WorkflowExecutionSpanAttributes to a JSON object
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
      obj.label.is_a?(String) != false || raise("Passed value for field obj.label is not the expected type, validation failed.")
    end
  end
end