# frozen_string_literal: true
require "json"
require_relative "reducto_chunking"
require_relative "sentence_chunking"
require_relative "token_overlapping_window_chunking"

module Vellum
  class DocumentIndexChunking


# Deserialize a JSON object to an instance of DocumentIndexChunking
    #
    # @param json_object [String] 
    # @return [Vellum::DocumentIndexChunking]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      begin
        Vellum::ReductoChunking.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::ReductoChunking.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::SentenceChunking.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::SentenceChunking.from_json(json_object: struct)
else
  return nil
end
      rescue StandardError
        # noop
      end
      begin
        Vellum::TokenOverlappingWindowChunking.validate_raw(obj: struct)
        unless struct.nil?
  return Vellum::TokenOverlappingWindowChunking.from_json(json_object: struct)
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
        return Vellum::ReductoChunking.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::SentenceChunking.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      begin
        return Vellum::TokenOverlappingWindowChunking.validate_raw(obj: obj)
      rescue StandardError
        # noop
      end
      raise("Passed value matched no type within the union, validation failed.")
    end
  end
end