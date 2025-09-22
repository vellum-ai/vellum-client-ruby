# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# Payload for executing a Composio tool with provider id and tool arguments.
  class ComposioExecuteToolRequest
  # @return [String] 
    attr_reader :provider
  # @return [Hash{String => Object}] 
    attr_reader :arguments
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String] 
    # @param arguments [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ComposioExecuteToolRequest]
    def initialize(provider:, arguments:, additional_properties: nil)
      @provider = provider
      @arguments = arguments
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "arguments": arguments }
    end
# Deserialize a JSON object to an instance of ComposioExecuteToolRequest
    #
    # @param json_object [String] 
    # @return [Vellum::ComposioExecuteToolRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      provider = parsed_json["provider"]
      arguments = parsed_json["arguments"]
      new(
        provider: provider,
        arguments: arguments,
        additional_properties: struct
      )
    end
# Serialize an instance of ComposioExecuteToolRequest to a JSON object
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
      obj.provider.is_a?(String) != false || raise("Passed value for field obj.provider is not the expected type, validation failed.")
      obj.arguments.is_a?(Hash) != false || raise("Passed value for field obj.arguments is not the expected type, validation failed.")
    end
  end
end