# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# Configuration for using an OpenAI vectorizer.
  class OpenAiVectorizerConfigRequest
  # @return [Boolean] 
    attr_reader :add_openai_api_key
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param add_openai_api_key [Boolean] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::OpenAiVectorizerConfigRequest]
    def initialize(add_openai_api_key: OMIT, additional_properties: nil)
      @add_openai_api_key = add_openai_api_key if add_openai_api_key != OMIT
      @additional_properties = additional_properties
      @_field_set = { "add_openai_api_key": add_openai_api_key }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of OpenAiVectorizerConfigRequest
    #
    # @param json_object [String] 
    # @return [Vellum::OpenAiVectorizerConfigRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      add_openai_api_key = parsed_json["add_openai_api_key"]
      new(add_openai_api_key: add_openai_api_key, additional_properties: struct)
    end
# Serialize an instance of OpenAiVectorizerConfigRequest to a JSON object
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
      obj.add_openai_api_key&.is_a?(Boolean) != false || raise("Passed value for field obj.add_openai_api_key is not the expected type, validation failed.")
    end
  end
end