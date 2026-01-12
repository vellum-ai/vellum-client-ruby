# frozen_string_literal: true
require_relative "parent_context"
require_relative "span_link"
require_relative "api_actor_type_enum"
require "ostruct"
require "json"

module Vellum
  class APIRequestParentContext
  # @return [Vellum::ParentContext] 
    attr_reader :parent
  # @return [Array<Vellum::SpanLink>] 
    attr_reader :links
  # @return [String] 
    attr_reader :span_id
  # @return [String] 
    attr_reader :api_actor_id
  # @return [Vellum::APIActorTypeEnum] 
    attr_reader :api_actor_type
  # @return [String] 
    attr_reader :api_actor_label
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param parent [Vellum::ParentContext] 
    # @param links [Array<Vellum::SpanLink>] 
    # @param span_id [String] 
    # @param api_actor_id [String] 
    # @param api_actor_type [Vellum::APIActorTypeEnum] 
    # @param api_actor_label [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::APIRequestParentContext]
    def initialize(parent: OMIT, links: OMIT, span_id:, api_actor_id: OMIT, api_actor_type: OMIT, api_actor_label: OMIT, additional_properties: nil)
      @parent = parent if parent != OMIT
      @links = links if links != OMIT
      @span_id = span_id
      @api_actor_id = api_actor_id if api_actor_id != OMIT
      @api_actor_type = api_actor_type if api_actor_type != OMIT
      @api_actor_label = api_actor_label if api_actor_label != OMIT
      @additional_properties = additional_properties
      @_field_set = { "parent": parent, "links": links, "span_id": span_id, "api_actor_id": api_actor_id, "api_actor_type": api_actor_type, "api_actor_label": api_actor_label }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of APIRequestParentContext
    #
    # @param json_object [String] 
    # @return [Vellum::APIRequestParentContext]
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
      span_id = parsed_json["span_id"]
      api_actor_id = parsed_json["api_actor_id"]
      api_actor_type = parsed_json["api_actor_type"]
      api_actor_label = parsed_json["api_actor_label"]
      new(
        parent: parent,
        links: links,
        span_id: span_id,
        api_actor_id: api_actor_id,
        api_actor_type: api_actor_type,
        api_actor_label: api_actor_label,
        additional_properties: struct
      )
    end
# Serialize an instance of APIRequestParentContext to a JSON object
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
      obj.span_id.is_a?(String) != false || raise("Passed value for field obj.span_id is not the expected type, validation failed.")
      obj.api_actor_id&.is_a?(String) != false || raise("Passed value for field obj.api_actor_id is not the expected type, validation failed.")
      obj.api_actor_type&.is_a?(Vellum::APIActorTypeEnum) != false || raise("Passed value for field obj.api_actor_type is not the expected type, validation failed.")
      obj.api_actor_label&.is_a?(String) != false || raise("Passed value for field obj.api_actor_label is not the expected type, validation failed.")
    end
  end
end