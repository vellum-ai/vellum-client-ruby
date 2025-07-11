# frozen_string_literal: true
require_relative "parent_context"
require_relative "span_link"
require_relative "node_execution_rejected_body"
require "date"
require_relative "api_version_enum"
require "ostruct"
require "json"

module Vellum
  class NodeExecutionRejectedEvent
  # @return [Vellum::ParentContext] 
    attr_reader :parent
  # @return [Array<Vellum::SpanLink>] 
    attr_reader :links
  # @return [String] 
    attr_reader :name
  # @return [Vellum::NodeExecutionRejectedBody] 
    attr_reader :body
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :timestamp
  # @return [Vellum::ApiVersionEnum] 
    attr_reader :api_version
  # @return [String] 
    attr_reader :trace_id
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
    # @param name [String] 
    # @param body [Vellum::NodeExecutionRejectedBody] 
    # @param id [String] 
    # @param timestamp [DateTime] 
    # @param api_version [Vellum::ApiVersionEnum] 
    # @param trace_id [String] 
    # @param span_id [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::NodeExecutionRejectedEvent]
    def initialize(parent: OMIT, links: OMIT, name:, body:, id:, timestamp:, api_version: OMIT, trace_id:, span_id:, additional_properties: nil)
      @parent = parent if parent != OMIT
      @links = links if links != OMIT
      @name = name
      @body = body
      @id = id
      @timestamp = timestamp
      @api_version = api_version if api_version != OMIT
      @trace_id = trace_id
      @span_id = span_id
      @additional_properties = additional_properties
      @_field_set = { "parent": parent, "links": links, "name": name, "body": body, "id": id, "timestamp": timestamp, "api_version": api_version, "trace_id": trace_id, "span_id": span_id }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of NodeExecutionRejectedEvent
    #
    # @param json_object [String] 
    # @return [Vellum::NodeExecutionRejectedEvent]
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
      name = parsed_json["name"]
      unless parsed_json["body"].nil?
        body = parsed_json["body"].to_json
        body = Vellum::NodeExecutionRejectedBody.from_json(json_object: body)
      else
        body = nil
      end
      id = parsed_json["id"]
      timestamp = unless parsed_json["timestamp"].nil?
  DateTime.parse(parsed_json["timestamp"])
else
  nil
end
      api_version = parsed_json["api_version"]
      trace_id = parsed_json["trace_id"]
      span_id = parsed_json["span_id"]
      new(
        parent: parent,
        links: links,
        name: name,
        body: body,
        id: id,
        timestamp: timestamp,
        api_version: api_version,
        trace_id: trace_id,
        span_id: span_id,
        additional_properties: struct
      )
    end
# Serialize an instance of NodeExecutionRejectedEvent to a JSON object
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
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      Vellum::NodeExecutionRejectedBody.validate_raw(obj: obj.body)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.timestamp.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.api_version&.is_a?(Vellum::ApiVersionEnum) != false || raise("Passed value for field obj.api_version is not the expected type, validation failed.")
      obj.trace_id.is_a?(String) != false || raise("Passed value for field obj.trace_id is not the expected type, validation failed.")
      obj.span_id.is_a?(String) != false || raise("Passed value for field obj.span_id is not the expected type, validation failed.")
    end
  end
end