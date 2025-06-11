# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class RawPromptExecutionOverridesRequest
  # @return [Hash{String => Object}] 
    attr_reader :body
  # @return [Hash{String => String}] The raw headers to send to the model host.
    attr_reader :headers
  # @return [String] The raw URL to send to the model host.
    attr_reader :url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param body [Hash{String => Object}] 
    # @param headers [Hash{String => String}] The raw headers to send to the model host.
    # @param url [String] The raw URL to send to the model host.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::RawPromptExecutionOverridesRequest]
    def initialize(body: OMIT, headers: OMIT, url: OMIT, additional_properties: nil)
      @body = body if body != OMIT
      @headers = headers if headers != OMIT
      @url = url if url != OMIT
      @additional_properties = additional_properties
      @_field_set = { "body": body, "headers": headers, "url": url }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RawPromptExecutionOverridesRequest
    #
    # @param json_object [String] 
    # @return [Vellum::RawPromptExecutionOverridesRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      body = parsed_json["body"]
      headers = parsed_json["headers"]
      url = parsed_json["url"]
      new(
        body: body,
        headers: headers,
        url: url,
        additional_properties: struct
      )
    end
# Serialize an instance of RawPromptExecutionOverridesRequest to a JSON object
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
      obj.body&.is_a?(Hash) != false || raise("Passed value for field obj.body is not the expected type, validation failed.")
      obj.headers&.is_a?(Hash) != false || raise("Passed value for field obj.headers is not the expected type, validation failed.")
      obj.url&.is_a?(String) != false || raise("Passed value for field obj.url is not the expected type, validation failed.")
    end
  end
end