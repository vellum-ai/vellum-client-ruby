# frozen_string_literal: true
require_relative "open_ai_vectorizer_config"
require "ostruct"
require "json"

module Vellum
# OpenAI vectorizer for text-embedding-3-small.
  class OpenAiVectorizerTextEmbedding3Small
  # @return [Vellum::OpenAiVectorizerConfig] 
    attr_reader :config
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param config [Vellum::OpenAiVectorizerConfig] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::OpenAiVectorizerTextEmbedding3Small]
    def initialize(config:, additional_properties: nil)
      @config = config
      @additional_properties = additional_properties
      @_field_set = { "config": config }
    end
# Deserialize a JSON object to an instance of OpenAiVectorizerTextEmbedding3Small
    #
    # @param json_object [String] 
    # @return [Vellum::OpenAiVectorizerTextEmbedding3Small]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["config"].nil?
        config = parsed_json["config"].to_json
        config = Vellum::OpenAiVectorizerConfig.from_json(json_object: config)
      else
        config = nil
      end
      new(config: config, additional_properties: struct)
    end
# Serialize an instance of OpenAiVectorizerTextEmbedding3Small to a JSON object
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
      Vellum::OpenAiVectorizerConfig.validate_raw(obj: obj.config)
    end
  end
end