# frozen_string_literal: true
require "json"
require_relative "reducto_chunking_request"
require_relative "sentence_chunking_request"
require_relative "token_overlapping_window_chunking_request"

module Vellum
  class DocumentIndexChunkingRequest


# Deserialize a JSON object to an instance of DocumentIndexChunkingRequest
    #
    # @param json_object [String] 
    # @return [Vellum::DocumentIndexChunkingRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::ReductoChunkingRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ReductoChunkingRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::SentenceChunkingRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::SentenceChunkingRequest.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TokenOverlappingWindowChunkingRequest.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TokenOverlappingWindowChunkingRequest.from_json(json_object: struct)
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
        return Vellum::ReductoChunkingRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::SentenceChunkingRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TokenOverlappingWindowChunkingRequest.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end