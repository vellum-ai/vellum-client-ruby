# frozen_string_literal: true
require "json"
require_relative "composio_execute_tool_request"

module Vellum
  class ExecuteToolRequest
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::ExecuteToolRequest]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of ExecuteToolRequest
    #
    # @param json_object [String] 
    # @return [Vellum::ExecuteToolRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.provider
      when "COMPOSIO"
        member = Vellum::ComposioExecuteToolRequest.from_json(json_object: json_object)
      else
        member = Vellum::ComposioExecuteToolRequest.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.provider)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "COMPOSIO"
        { **@member.to_json, provider: @discriminant }.to_json
      else
        { "provider": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.provider
      when "COMPOSIO"
        Vellum::ComposioExecuteToolRequest.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
# For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object] 
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end
    # @param member [Vellum::ComposioExecuteToolRequest] 
    # @return [Vellum::ExecuteToolRequest]
    def self.composio(member:)
      new(member: member, discriminant: "COMPOSIO")
    end
  end
end