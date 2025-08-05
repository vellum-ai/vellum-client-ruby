# frozen_string_literal: true
require_relative "parent_context"
require_relative "span_link"
require "ostruct"
require "json"

module Vellum
  class ExternalParentContext
  # @return [Vellum::ParentContext] 
    attr_reader :parent
  # @return [Array<Vellum::SpanLink>] 
    attr_reader :links
  # @return [String] 
    attr_reader :type
  # @return [String] 
    attr_reader :span_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param parent [Vellum::ParentContext] 
    # @param links [Array<Vellum::SpanLink>] 
    # @param type [String] 
    # @param span_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ExternalParentContext]
    def initialize(parent: OMIT, links: OMIT, type:, span_id:, additional_properties: nil)
      @parent = parent if parent != OMIT
      @links = links if links != OMIT
      @type = type
      @span_id = span_id
      @additional_properties = additional_properties
      @_field_set = { "parent": parent, "links": links, "type": type, "span_id": span_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ExternalParentContext
    #
    # @param json_object [String] 
    # @return [Vellum::ExternalParentContext]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["parent"].nil?
        parent = parsed_json["parent"].to_json
        parent = Vellum::ParentContext.from_json(json_object: parent)
      else
        parent = nil
      end
      links = parsed_json["links"]&.map do | item |
  item = item.to_json
  Vellum::SpanLink.from_json(json_object: item)
end
      type = parsed_json["type"]
      span_id = parsed_json["span_id"]
      new(
        parent: parent,
        links: links,
        type: type,
        span_id: span_id,
        additional_properties: struct
      )
    end
# Serialize an instance of ExternalParentContext to a JSON object
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
      obj.parent.nil? || Vellum::ParentContext.validate_raw(obj: obj.parent)
      obj.links&.is_a?(Array) != false || raise("Passed value for field obj.links is not the expected type, validation failed.")
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      obj.span_id.is_a?(String) != false || raise("Passed value for field obj.span_id is not the expected type, validation failed.")
    end
  end
end