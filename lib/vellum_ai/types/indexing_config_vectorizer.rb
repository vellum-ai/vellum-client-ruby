# frozen_string_literal: true
require "json"
require_relative "open_ai_vectorizer_text_embedding3small"
require_relative "open_ai_vectorizer_text_embedding3large"
require_relative "open_ai_vectorizer_text_embedding_ada002"
require_relative "basic_vectorizer_intfloat_multilingual_e5large"
require_relative "basic_vectorizer_sentence_transformers_multi_qa_mpnet_base_cos_v1"
require_relative "basic_vectorizer_sentence_transformers_multi_qa_mpnet_base_dot_v1"
require_relative "hkunlp_instructor_xl_vectorizer"
require_relative "google_vertex_ai_vectorizer_text_embedding004"
require_relative "google_vertex_ai_vectorizer_text_multilingual_embedding002"
require_relative "google_vertex_ai_vectorizer_gemini_embedding001"
require_relative "fast_embed_vectorizer_baai_bge_small_en_v15"
require_relative "private_vectorizer"

module Vellum
  class IndexingConfigVectorizer
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::IndexingConfigVectorizer]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of IndexingConfigVectorizer
    #
    # @param json_object [String] 
    # @return [Vellum::IndexingConfigVectorizer]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.model_name
      when "text-embedding-3-small"
        member = Vellum::OpenAiVectorizerTextEmbedding3Small.from_json(json_object: json_object)
      when "text-embedding-3-large"
        member = Vellum::OpenAiVectorizerTextEmbedding3Large.from_json(json_object: json_object)
      when "text-embedding-ada-002"
        member = Vellum::OpenAiVectorizerTextEmbeddingAda002.from_json(json_object: json_object)
      when "intfloat/multilingual-e5-large"
        member = Vellum::BasicVectorizerIntfloatMultilingualE5Large.from_json(json_object: json_object)
      when "sentence-transformers/multi-qa-mpnet-base-cos-v1"
        member = Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseCosV1.from_json(json_object: json_object)
      when "sentence-transformers/multi-qa-mpnet-base-dot-v1"
        member = Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseDotV1.from_json(json_object: json_object)
      when "hkunlp/instructor-xl"
        member = Vellum::HkunlpInstructorXlVectorizer.from_json(json_object: json_object)
      when "text-embedding-004"
        member = Vellum::GoogleVertexAiVectorizerTextEmbedding004.from_json(json_object: json_object)
      when "text-multilingual-embedding-002"
        member = Vellum::GoogleVertexAiVectorizerTextMultilingualEmbedding002.from_json(json_object: json_object)
      when "gemini-embedding-001"
        member = Vellum::GoogleVertexAiVectorizerGeminiEmbedding001.from_json(json_object: json_object)
      when "BAAI/bge-small-en-v1.5"
        member = Vellum::FastEmbedVectorizerBaaiBgeSmallEnV15.from_json(json_object: json_object)
      when "private-vectorizer"
        member = Vellum::PrivateVectorizer.from_json(json_object: json_object)
      else
        member = Vellum::OpenAiVectorizerTextEmbedding3Small.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.model_name)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "text-embedding-3-small"
        { **@member.to_json, model_name: @discriminant }.to_json
      when "text-embedding-3-large"
        { **@member.to_json, model_name: @discriminant }.to_json
      when "text-embedding-ada-002"
        { **@member.to_json, model_name: @discriminant }.to_json
      when "intfloat/multilingual-e5-large"
        { **@member.to_json, model_name: @discriminant }.to_json
      when "sentence-transformers/multi-qa-mpnet-base-cos-v1"
        { **@member.to_json, model_name: @discriminant }.to_json
      when "sentence-transformers/multi-qa-mpnet-base-dot-v1"
        { **@member.to_json, model_name: @discriminant }.to_json
      when "hkunlp/instructor-xl"
        { **@member.to_json, model_name: @discriminant }.to_json
      when "text-embedding-004"
        { **@member.to_json, model_name: @discriminant }.to_json
      when "text-multilingual-embedding-002"
        { **@member.to_json, model_name: @discriminant }.to_json
      when "gemini-embedding-001"
        { **@member.to_json, model_name: @discriminant }.to_json
      when "BAAI/bge-small-en-v1.5"
        { **@member.to_json, model_name: @discriminant }.to_json
      when "private-vectorizer"
        { **@member.to_json, model_name: @discriminant }.to_json
      else
        { "model_name": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.model_name
      when "text-embedding-3-small"
        Vellum::OpenAiVectorizerTextEmbedding3Small.validate_raw(obj: obj)
      when "text-embedding-3-large"
        Vellum::OpenAiVectorizerTextEmbedding3Large.validate_raw(obj: obj)
      when "text-embedding-ada-002"
        Vellum::OpenAiVectorizerTextEmbeddingAda002.validate_raw(obj: obj)
      when "intfloat/multilingual-e5-large"
        Vellum::BasicVectorizerIntfloatMultilingualE5Large.validate_raw(obj: obj)
      when "sentence-transformers/multi-qa-mpnet-base-cos-v1"
        Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseCosV1.validate_raw(obj: obj)
      when "sentence-transformers/multi-qa-mpnet-base-dot-v1"
        Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseDotV1.validate_raw(obj: obj)
      when "hkunlp/instructor-xl"
        Vellum::HkunlpInstructorXlVectorizer.validate_raw(obj: obj)
      when "text-embedding-004"
        Vellum::GoogleVertexAiVectorizerTextEmbedding004.validate_raw(obj: obj)
      when "text-multilingual-embedding-002"
        Vellum::GoogleVertexAiVectorizerTextMultilingualEmbedding002.validate_raw(obj: obj)
      when "gemini-embedding-001"
        Vellum::GoogleVertexAiVectorizerGeminiEmbedding001.validate_raw(obj: obj)
      when "BAAI/bge-small-en-v1.5"
        Vellum::FastEmbedVectorizerBaaiBgeSmallEnV15.validate_raw(obj: obj)
      when "private-vectorizer"
        Vellum::PrivateVectorizer.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
# For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object] 
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end
    # @param member [Vellum::OpenAiVectorizerTextEmbedding3Small] 
    # @return [Vellum::IndexingConfigVectorizer]
    def self.text_embedding3small(member:)
      new(member: member, discriminant: "text-embedding-3-small")
    end
    # @param member [Vellum::OpenAiVectorizerTextEmbedding3Large] 
    # @return [Vellum::IndexingConfigVectorizer]
    def self.text_embedding3large(member:)
      new(member: member, discriminant: "text-embedding-3-large")
    end
    # @param member [Vellum::OpenAiVectorizerTextEmbeddingAda002] 
    # @return [Vellum::IndexingConfigVectorizer]
    def self.text_embedding_ada002(member:)
      new(member: member, discriminant: "text-embedding-ada-002")
    end
    # @param member [Vellum::BasicVectorizerIntfloatMultilingualE5Large] 
    # @return [Vellum::IndexingConfigVectorizer]
    def self.intfloat_multilingual_e5large(member:)
      new(member: member, discriminant: "intfloat/multilingual-e5-large")
    end
    # @param member [Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseCosV1] 
    # @return [Vellum::IndexingConfigVectorizer]
    def self.sentence_transformers_multi_qa_mpnet_base_cos_v1(member:)
      new(member: member, discriminant: "sentence-transformers/multi-qa-mpnet-base-cos-v1")
    end
    # @param member [Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseDotV1] 
    # @return [Vellum::IndexingConfigVectorizer]
    def self.sentence_transformers_multi_qa_mpnet_base_dot_v1(member:)
      new(member: member, discriminant: "sentence-transformers/multi-qa-mpnet-base-dot-v1")
    end
    # @param member [Vellum::HkunlpInstructorXlVectorizer] 
    # @return [Vellum::IndexingConfigVectorizer]
    def self.hkunlp_instructor_xl(member:)
      new(member: member, discriminant: "hkunlp/instructor-xl")
    end
    # @param member [Vellum::GoogleVertexAiVectorizerTextEmbedding004] 
    # @return [Vellum::IndexingConfigVectorizer]
    def self.text_embedding004(member:)
      new(member: member, discriminant: "text-embedding-004")
    end
    # @param member [Vellum::GoogleVertexAiVectorizerTextMultilingualEmbedding002] 
    # @return [Vellum::IndexingConfigVectorizer]
    def self.text_multilingual_embedding002(member:)
      new(member: member, discriminant: "text-multilingual-embedding-002")
    end
    # @param member [Vellum::GoogleVertexAiVectorizerGeminiEmbedding001] 
    # @return [Vellum::IndexingConfigVectorizer]
    def self.gemini_embedding001(member:)
      new(member: member, discriminant: "gemini-embedding-001")
    end
    # @param member [Vellum::FastEmbedVectorizerBaaiBgeSmallEnV15] 
    # @return [Vellum::IndexingConfigVectorizer]
    def self.baai_bge_small_en_v15(member:)
      new(member: member, discriminant: "BAAI/bge-small-en-v1.5")
    end
    # @param member [Vellum::PrivateVectorizer] 
    # @return [Vellum::IndexingConfigVectorizer]
    def self.private_vectorizer(member:)
      new(member: member, discriminant: "private-vectorizer")
    end
  end
end