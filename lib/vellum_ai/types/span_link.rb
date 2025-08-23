# frozen_string_literal: true
require_relative "span_link_type_enum"
require_relative "parent_context"
require "ostruct"
require "json"

module Vellum
  class SpanLink
  # @return [String] 
    attr_reader :trace_id
  # @return [Vellum::SpanLinkTypeEnum] 
    attr_reader :type
  # @return [Vellum::ParentContext] 
    attr_reader :span_context
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param trace_id [String] 
    # @param type [Vellum::SpanLinkTypeEnum] 
    # @param span_context [Vellum::ParentContext] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SpanLink]
    def initialize(trace_id:, type:, span_context:, additional_properties: nil)
      @trace_id = trace_id
      @type = type
      @span_context = span_context
      @additional_properties = additional_properties
      @_field_set = { "trace_id": trace_id, "type": type, "span_context": span_context }
    end
# Deserialize a JSON object to an instance of SpanLink
    #
    # @param json_object [String] 
    # @return [Vellum::SpanLink]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      trace_id = parsed_json["trace_id"]
      type = parsed_json["type"]
      unless parsed_json["span_context"].nil?
        span_context = parsed_json["span_context"].to_json
        span_context = Vellum::ParentContext.from_json(json_object: span_context)
      else
        span_context = nil
      end
      new(
        trace_id: trace_id,
        type: type,
        span_context: span_context,
        additional_properties: struct
      )
    end
# Serialize an instance of SpanLink to a JSON object
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
      obj.trace_id.is_a?(String) != false || raise("Passed value for field obj.trace_id is not the expected type, validation failed.")
      obj.type.is_a?(Vellum::SpanLinkTypeEnum) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      Vellum::ParentContext.validate_raw(obj: obj.span_context)
    end
  end
end