# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# Basic vectorizer for sentence-transformers/multi-qa-mpnet-base-dot-v1.
  class BasicVectorizerSentenceTransformersMultiQaMpnetBaseDotV1Request
  # @return [String] 
    attr_reader :model_name
  # @return [Hash{String => Object}] 
    attr_reader :config
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param model_name [String] 
    # @param config [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseDotV1Request]
    def initialize(model_name:, config: OMIT, additional_properties: nil)
      @model_name = model_name
      @config = config if config != OMIT
      @additional_properties = additional_properties
      @_field_set = { "model_name": model_name, "config": config }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of
#  BasicVectorizerSentenceTransformersMultiQaMpnetBaseDotV1Request
    #
    # @param json_object [String] 
    # @return [Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseDotV1Request]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      model_name = parsed_json["model_name"]
      config = parsed_json["config"]
      new(
        model_name: model_name,
        config: config,
        additional_properties: struct
      )
    end
# Serialize an instance of
#  BasicVectorizerSentenceTransformersMultiQaMpnetBaseDotV1Request to a JSON object
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
      obj.config&.is_a?(Hash) != false || raise("Passed value for field obj.config is not the expected type, validation failed.")
    end
  end
end