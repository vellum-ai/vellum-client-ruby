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
  # @return [String] 
    attr_reader :toolkit_version
  # @return [String] 
    attr_reader :integration_name
  # @return [String] 
    attr_reader :integration
  # @return [String] 
    attr_reader :tool_name
  # @return [String] 
    attr_reader :tool
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param provider [String] 
    # @param arguments [Hash{String => Object}] 
    # @param toolkit_version [String] 
    # @param integration_name [String] 
    # @param integration [String] 
    # @param tool_name [String] 
    # @param tool [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ComposioExecuteToolRequest]
    def initialize(provider:, arguments:, toolkit_version: OMIT, integration_name: OMIT, integration: OMIT, tool_name: OMIT, tool: OMIT, additional_properties: nil)
      @provider = provider
      @arguments = arguments
      @toolkit_version = toolkit_version if toolkit_version != OMIT
      @integration_name = integration_name if integration_name != OMIT
      @integration = integration if integration != OMIT
      @tool_name = tool_name if tool_name != OMIT
      @tool = tool if tool != OMIT
      @additional_properties = additional_properties
      @_field_set = { "provider": provider, "arguments": arguments, "toolkit_version": toolkit_version, "integration_name": integration_name, "integration": integration, "tool_name": tool_name, "tool": tool }.reject do | _k, v |
  v == OMIT
end
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
      toolkit_version = parsed_json["toolkit_version"]
      integration_name = parsed_json["integration_name"]
      integration = parsed_json["integration"]
      tool_name = parsed_json["tool_name"]
      tool = parsed_json["tool"]
      new(
        provider: provider,
        arguments: arguments,
        toolkit_version: toolkit_version,
        integration_name: integration_name,
        integration: integration,
        tool_name: tool_name,
        tool: tool,
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
      obj.toolkit_version&.is_a?(String) != false || raise("Passed value for field obj.toolkit_version is not the expected type, validation failed.")
      obj.integration_name&.is_a?(String) != false || raise("Passed value for field obj.integration_name is not the expected type, validation failed.")
      obj.integration&.is_a?(String) != false || raise("Passed value for field obj.integration is not the expected type, validation failed.")
      obj.tool_name&.is_a?(String) != false || raise("Passed value for field obj.tool_name is not the expected type, validation failed.")
      obj.tool&.is_a?(String) != false || raise("Passed value for field obj.tool is not the expected type, validation failed.")
    end
  end
end