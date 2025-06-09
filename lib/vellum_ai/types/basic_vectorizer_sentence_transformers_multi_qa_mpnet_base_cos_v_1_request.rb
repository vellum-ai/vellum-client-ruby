# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# Basic vectorizer for sentence-transformers/multi-qa-mpnet-base-cos-v1.
  class BasicVectorizerSentenceTransformersMultiQaMpnetBaseCosV1Request
  # @return [Hash{String => Object}] 
    attr_reader :config
  # @return [String] 
    attr_reader :model_name
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param config [Hash{String => Object}] 
    # @param model_name [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseCosV1Request]
    def initialize(config: OMIT, model_name:, additional_properties: nil)
      @config = config if config != OMIT
      @model_name = model_name
      @additional_properties = additional_properties
      @_field_set = { "config": config, "model_name": model_name }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  BasicVectorizerSentenceTransformersMultiQaMpnetBaseCosV1Request
    #
    # @param json_object [String] 
    # @return [Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseCosV1Request]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      config = parsed_json["config"]
      model_name = parsed_json["model_name"]
      new(
        config: config,
        model_name: model_name,
        additional_properties: struct
      )
    end
# Serialize an instance of
#  BasicVectorizerSentenceTransformersMultiQaMpnetBaseCosV1Request to a JSON object
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
      obj.config&.is_a?(Hash) != false || raise("Passed value for field obj.config is not the expected type, validation failed.")
      obj.model_name.is_a?(String) != false || raise("Passed value for field obj.model_name is not the expected type, validation failed.")
    end
  end
end