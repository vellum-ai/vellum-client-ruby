# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# Icon to be used alongside a Workflow
  class WorkflowDisplayIcon
  # @return [String] 
    attr_reader :src
  # @return [String] 
    attr_reader :color
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param src [String] 
    # @param color [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::WorkflowDisplayIcon]
    def initialize(src: OMIT, color: OMIT, additional_properties: nil)
      @src = src if src != OMIT
      @color = color if color != OMIT
      @additional_properties = additional_properties
      @_field_set = { "src": src, "color": color }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of WorkflowDisplayIcon
    #
    # @param json_object [String] 
    # @return [Vellum::WorkflowDisplayIcon]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      src = parsed_json["src"]
      color = parsed_json["color"]
      new(
        src: src,
        color: color,
        additional_properties: struct
      )
    end
# Serialize an instance of WorkflowDisplayIcon to a JSON object
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
      obj.src&.is_a?(String) != false || raise("Passed value for field obj.src is not the expected type, validation failed.")
      obj.color&.is_a?(String) != false || raise("Passed value for field obj.color is not the expected type, validation failed.")
    end
  end
end