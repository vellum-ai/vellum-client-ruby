# frozen_string_literal: true
require "json"
require_relative "open_ai_vectorizer_text_embedding_3_small_request"
require_relative "open_ai_vectorizer_text_embedding_3_large_request"
require_relative "open_ai_vectorizer_text_embedding_ada_002_request"
require_relative "basic_vectorizer_intfloat_multilingual_e_5_large_request"
require_relative "basic_vectorizer_sentence_transformers_multi_qa_mpnet_base_cos_v_1_request"
require_relative "basic_vectorizer_sentence_transformers_multi_qa_mpnet_base_dot_v_1_request"
require_relative "hkunlp_instructor_xl_vectorizer_request"
require_relative "google_vertex_ai_vectorizer_text_embedding_004_request"
require_relative "google_vertex_ai_vectorizer_text_multilingual_embedding_002_request"
require_relative "google_vertex_ai_vectorizer_gemini_embedding_001_request"
require_relative "fast_embed_vectorizer_baai_bge_small_en_v_15_request"

module Vellum
  class IndexingConfigVectorizerRequest


# Deserialize a JSON object to an instance of IndexingConfigVectorizerRequest
    #
    # @param json_object [String] 
    # @return [Vellum::IndexingConfigVectorizerRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::OpenAiVectorizerTextEmbedding3SmallRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::OpenAiVectorizerTextEmbedding3SmallRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::OpenAiVectorizerTextEmbedding3LargeRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::OpenAiVectorizerTextEmbedding3LargeRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::OpenAiVectorizerTextEmbeddingAda002Request.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::OpenAiVectorizerTextEmbeddingAda002Request.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::BasicVectorizerIntfloatMultilingualE5LargeRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::BasicVectorizerIntfloatMultilingualE5LargeRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseCosV1Request.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseCosV1Request.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseDotV1Request.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseDotV1Request.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::HkunlpInstructorXlVectorizerRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::HkunlpInstructorXlVectorizerRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::GoogleVertexAiVectorizerTextEmbedding004Request.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::GoogleVertexAiVectorizerTextEmbedding004Request.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::GoogleVertexAiVectorizerTextMultilingualEmbedding002Request.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::GoogleVertexAiVectorizerTextMultilingualEmbedding002Request.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::GoogleVertexAiVectorizerGeminiEmbedding001Request.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::GoogleVertexAiVectorizerGeminiEmbedding001Request.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::FastEmbedVectorizerBaaiBgeSmallEnV15Request.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::FastEmbedVectorizerBaaiBgeSmallEnV15Request.from_json(json_object: struct)
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
        return Vellum::OpenAiVectorizerTextEmbedding3SmallRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::OpenAiVectorizerTextEmbedding3LargeRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::OpenAiVectorizerTextEmbeddingAda002Request.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::BasicVectorizerIntfloatMultilingualE5LargeRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseCosV1Request.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::BasicVectorizerSentenceTransformersMultiQaMpnetBaseDotV1Request.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::HkunlpInstructorXlVectorizerRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::GoogleVertexAiVectorizerTextEmbedding004Request.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::GoogleVertexAiVectorizerTextMultilingualEmbedding002Request.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::GoogleVertexAiVectorizerGeminiEmbedding001Request.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::FastEmbedVectorizerBaaiBgeSmallEnV15Request.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end