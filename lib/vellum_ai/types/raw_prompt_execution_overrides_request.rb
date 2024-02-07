# frozen_string_literal: true

require "json"

module Vellum
  class RawPromptExecutionOverridesRequest
    attr_reader :body, :headers, :url, :additional_properties

    # @param body [Hash{String => String}]
    # @param headers [Hash{String => String}] The raw headers to send to the model host.
    # @param url [String] The raw URL to send to the model host.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RawPromptExecutionOverridesRequest]
    def initialize(body: nil, headers: nil, url: nil, additional_properties: nil)
      # @type [Hash{String => String}]
      @body = body
      # @type [Hash{String => String}] The raw headers to send to the model host.
      @headers = headers
      # @type [String] The raw URL to send to the model host.
      @url = url
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of RawPromptExecutionOverridesRequest
    #
    # @param json_object [JSON]
    # @return [RawPromptExecutionOverridesRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      body = struct.body
      headers = struct.headers
      url = struct.url
      new(body: body, headers: headers, url: url, additional_properties: struct)
    end

    # Serialize an instance of RawPromptExecutionOverridesRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "body": @body, "headers": @headers, "url": @url }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.body&.is_a?(Hash) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
      obj.headers&.is_a?(Hash) != false || raise("Passed value for field obj.headers is not the expected type, validation failed.")
      obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
    end
  end
end
