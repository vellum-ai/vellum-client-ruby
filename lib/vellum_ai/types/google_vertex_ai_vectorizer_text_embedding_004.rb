# frozen_string_literal: true
require_relative "google_vertex_ai_vectorizer_config"
require "ostruct"
require "json"

module Vellum
  class GoogleVertexAiVectorizerTextEmbedding004
  # @return [String] 
    attr_reader :model_name
  # @return [Vellum::GoogleVertexAiVectorizerConfig] 
    attr_reader :config
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model_name [String] 
    # @param config [Vellum::GoogleVertexAiVectorizerConfig] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::GoogleVertexAiVectorizerTextEmbedding004]
    def initialize(model_name:, config:, additional_properties: nil)
      @model_name = model_name
      @config = config
      @additional_properties = additional_properties
      @_field_set = { "model_name": model_name, "config": config }
    end
# Deserialize a JSON object to an instance of
#  GoogleVertexAiVectorizerTextEmbedding004
    #
    # @param json_object [String] 
    # @return [Vellum::GoogleVertexAiVectorizerTextEmbedding004]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model_name = parsed_json["model_name"]
      unless parsed_json["config"].nil?
        config = parsed_json["config"].to_json
        config = Vellum::GoogleVertexAiVectorizerConfig.from_json(json_object: config)
      else
        config = nil
      end
      new(
        model_name: model_name,
        config: config,
        additional_properties: struct
      )
    end
# Serialize an instance of GoogleVertexAiVectorizerTextEmbedding004 to a JSON
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
      obj.model_name.is_a?(String) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
      Vellum::GoogleVertexAiVectorizerConfig.validate_raw(obj: obj.config)
    end
  end
end