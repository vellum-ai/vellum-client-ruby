# frozen_string_literal: true
require "json"
require_relative "open_ai_vectorizer_text_embedding_3_small"
require_relative "open_ai_vectorizer_text_embedding_3_large"
require_relative "open_ai_vectorizer_text_embedding_ada_002"
require_relative "basic_vectorizer_intfloat_multilingual_e_5_large"
require_relative "basic_vectorizer_sentence_transformers_multi_qa_mpnet_base_cos_v_1"
require_relative "basic_vectorizer_sentence_transformers_multi_qa_mpnet_base_dot_v_1"
require_relative "hkunlp_instructor_xl_vectorizer"
require_relative "google_vertex_ai_vectorizer_text_embedding_004"
require_relative "google_vertex_ai_vectorizer_text_multilingual_embedding_002"
require_relative "google_vertex_ai_vectorizer_gemini_embedding_001"
require_relative "fast_embed_vectorizer_baai_bge_small_en_v_15"
require_relative "private_vectorizer"

module Vellum
  class IndexingConfigVectorizer


# Deserialize a JSON object to an instance of IndexingConfigVectorizer
    #
    # @param json_object [String] 
    # @return [Vellum::IndexingConfigVectorizer]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::OpenAiVectorizerTextEmbedding3Small.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::OpenAiVectorizerTextEmbedding3Small.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::OpenAiVectorizerTextEmbedding3Large.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::OpenAiVectorizerTextEmbedding3Large.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::OpenAiVectorizerTextEmbeddingAda002.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::OpenAiVectorizerTextEmbeddingAda002.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::BasicVectorizerIntfloatMultilingualE5Large.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::BasicVectorizerIntfloatMultilingualE5Large.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseCosV1.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseCosV1.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseDotV1.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseDotV1.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::HkunlpInstructorXlVectorizer.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::HkunlpInstructorXlVectorizer.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::GoogleVertexAiVectorizerTextEmbedding004.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::GoogleVertexAiVectorizerTextEmbedding004.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::GoogleVertexAiVectorizerTextMultilingualEmbedding002.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::GoogleVertexAiVectorizerTextMultilingualEmbedding002.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::GoogleVertexAiVectorizerGeminiEmbedding001.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::GoogleVertexAiVectorizerGeminiEmbedding001.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FastEmbedVectorizerBaaiBgeSmallEnV15.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FastEmbedVectorizerBaaiBgeSmallEnV15.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::PrivateVectorizer.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::PrivateVectorizer.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
 return struct
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      begin
        return Vellum::OpenAiVectorizerTextEmbedding3Small.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::OpenAiVectorizerTextEmbedding3Large.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::OpenAiVectorizerTextEmbeddingAda002.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::BasicVectorizerIntfloatMultilingualE5Large.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseCosV1.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseDotV1.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::HkunlpInstructorXlVectorizer.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::GoogleVertexAiVectorizerTextEmbedding004.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::GoogleVertexAiVectorizerTextMultilingualEmbedding002.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::GoogleVertexAiVectorizerGeminiEmbedding001.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FastEmbedVectorizerBaaiBgeSmallEnV15.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::PrivateVectorizer.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end