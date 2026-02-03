# frozen_string_literal: true
require_relative "ml_model_hosting_interface"
require "date"
require "ostruct"
require "json"

module Vellum
# An ML Model that your Workspace has access to.
  class MlModelRead
  # @return [String] 
    attr_reader :id
  # @return [String] The unique name of the ML Model.
    attr_reader :name
  # @return [Vellum::MlModelHostingInterface] The organization hosting the ML Model.
#  * `ANTHROPIC` - Anthropic
#  * `AWS_BEDROCK` - AWS Bedrock
#  * `AZURE_AI_FOUNDRY` - Azure AI Foundry
#  * `AZURE_OPENAI` - Azure OpenAI
#  * `BASETEN` - BaseTen
#  * `CEREBRAS` - Cerebras
#  * `COHERE` - Cohere
#  * `CUSTOM` - Custom
#  * `DEEP_SEEK` - DeepSeek
#  * `FIREWORKS_AI` - Fireworks AI
#  * `GOOGLE` - Google
#  * `GOOGLE_VERTEX_AI` - Google Vertex AI
#  * `GROQ` - Groq
#  * `HUGGINGFACE` - HuggingFace
#  * `IBM_WATSONX` - IBM WatsonX
#  * `MISTRAL_AI` - Mistral AI
#  * `MOSAICML` - MosaicML
#  * `MYSTIC` - Mystic
#  * `NVIDIA` - NVIDIA
#  * `OPENAI` - OpenAI
#  * `OPEN_ROUTER` - Open Router
#  * `OPENPIPE` - OpenPipe
#  * `PERPLEXITY` - Perplexity
#  * `PYQ` - Pyq
#  * `REPLICATE` - Replicate
#  * `SAMBANOVA` - SambaNova
#  * `TOGETHER_AI` - Together AI
#  * `X_AI` - xAI
#  * `FASTWEB` - Fastweb
#  * `SWISSCOM` - Swisscom
    attr_reader :hosted_by
  # @return [DateTime] 
    attr_reader :introduced_on
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param name [String] The unique name of the ML Model.
    # @param hosted_by [Vellum::MlModelHostingInterface] The organization hosting the ML Model.
#  * `ANTHROPIC` - Anthropic
#  * `AWS_BEDROCK` - AWS Bedrock
#  * `AZURE_AI_FOUNDRY` - Azure AI Foundry
#  * `AZURE_OPENAI` - Azure OpenAI
#  * `BASETEN` - BaseTen
#  * `CEREBRAS` - Cerebras
#  * `COHERE` - Cohere
#  * `CUSTOM` - Custom
#  * `DEEP_SEEK` - DeepSeek
#  * `FIREWORKS_AI` - Fireworks AI
#  * `GOOGLE` - Google
#  * `GOOGLE_VERTEX_AI` - Google Vertex AI
#  * `GROQ` - Groq
#  * `HUGGINGFACE` - HuggingFace
#  * `IBM_WATSONX` - IBM WatsonX
#  * `MISTRAL_AI` - Mistral AI
#  * `MOSAICML` - MosaicML
#  * `MYSTIC` - Mystic
#  * `NVIDIA` - NVIDIA
#  * `OPENAI` - OpenAI
#  * `OPEN_ROUTER` - Open Router
#  * `OPENPIPE` - OpenPipe
#  * `PERPLEXITY` - Perplexity
#  * `PYQ` - Pyq
#  * `REPLICATE` - Replicate
#  * `SAMBANOVA` - SambaNova
#  * `TOGETHER_AI` - Together AI
#  * `X_AI` - xAI
#  * `FASTWEB` - Fastweb
#  * `SWISSCOM` - Swisscom
    # @param introduced_on [DateTime] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::MlModelRead]
    def initialize(id:, name:, hosted_by:, introduced_on:, additional_properties: nil)
      @id = id
      @name = name
      @hosted_by = hosted_by
      @introduced_on = introduced_on
      @additional_properties = additional_properties
      @_field_set = { "id": id, "name": name, "hosted_by": hosted_by, "introduced_on": introduced_on }
    end
# Deserialize a JSON object to an instance of MlModelRead
    #
    # @param json_object [String] 
    # @return [Vellum::MlModelRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      name = parsed_json["name"]
      hosted_by = parsed_json["hosted_by"]
      introduced_on = unless parsed_json["introduced_on"].nil?
  DateTime.parse(parsed_json["introduced_on"])
else
  nil
end
      new(
        id: id,
        name: name,
        hosted_by: hosted_by,
        introduced_on: introduced_on,
        additional_properties: struct
      )
    end
# Serialize an instance of MlModelRead to a JSON object
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
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
      obj.hosted_by.is_a?(Vellum::MlModelHostingInterface) != false || raise("Passed value for field obj.hosted_by is not the expected type, validation failed.")
      obj.introduced_on.is_a?(DateTime) != false || raise("Passed value for field obj.introduced_on is not the expected type, validation failed.")
    end
  end
end