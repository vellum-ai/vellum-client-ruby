# frozen_string_literal: true
require_relative "open_ai_vectorizer_config_request"
require "ostruct"
require "json"

module Vellum
# OpenAI vectorizer for text-embedding-ada-002.
  class OpenAiVectorizerTextEmbeddingAda002Request
  # @return [Vellum::OpenAiVectorizerConfigRequest] 
    attr_reader :config
  # @return [String] 
    attr_reader :model_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param config [Vellum::OpenAiVectorizerConfigRequest] 
    # @param model_name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::OpenAiVectorizerTextEmbeddingAda002Request]
    def initialize(config:, model_name:, additional_properties: nil)
      @config = config
      @model_name = model_name
      @additional_properties = additional_properties
      @_field_set = { "config": config, "model_name": model_name }
    end
# Deserialize a JSON object to an instance of
#  OpenAiVectorizerTextEmbeddingAda002Request
    #
    # @param json_object [String] 
    # @return [Vellum::OpenAiVectorizerTextEmbeddingAda002Request]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["config"].nil?
        config = parsed_json["config"].to_json
        config = Vellum::OpenAiVectorizerConfigRequest.from_json(json_object: config)
      else
        config = nil
      end
      model_name = parsed_json["model_name"]
      new(
        config: config,
        model_name: model_name,
        additional_properties: struct
      )
    end
# Serialize an instance of OpenAiVectorizerTextEmbeddingAda002Request to a JSON
#  object
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
      Vellum::OpenAiVectorizerConfigRequest.validate_raw(obj: obj.config)
      obj.model_name.is_a?(String) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
    end
  end
end