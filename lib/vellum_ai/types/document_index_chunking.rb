# frozen_string_literal: true
require "json"
require_relative "reducto_chunking"
require_relative "sentence_chunking"
require_relative "token_overlapping_window_chunking"
require_relative "delimiter_chunking"

module Vellum
  class DocumentIndexChunking
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::DocumentIndexChunking]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of DocumentIndexChunking
    #
    # @param json_object [String] 
    # @return [Vellum::DocumentIndexChunking]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.chunker_name
      when "reducto-chunker"
        member = Vellum::ReductoChunking.from_json(json_object: json_object)
      when "sentence-chunker"
        member = Vellum::SentenceChunking.from_json(json_object: json_object)
      when "token-overlapping-window-chunker"
        member = Vellum::TokenOverlappingWindowChunking.from_json(json_object: json_object)
      when "delimiter-chunker"
        member = Vellum::DelimiterChunking.from_json(json_object: json_object)
      else
        member = Vellum::ReductoChunking.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.chunker_name)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "reducto-chunker"
        { **@member.to_json, chunker_name: @discriminant }.to_json
      when "sentence-chunker"
        { **@member.to_json, chunker_name: @discriminant }.to_json
      when "token-overlapping-window-chunker"
        { **@member.to_json, chunker_name: @discriminant }.to_json
      when "delimiter-chunker"
        { **@member.to_json, chunker_name: @discriminant }.to_json
      else
        { "chunker_name": @discriminant, value: @member }.to_json
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
      case obj.chunker_name
      when "reducto-chunker"
        Vellum::ReductoChunking.validate_raw(obj: obj)
      when "sentence-chunker"
        Vellum::SentenceChunking.validate_raw(obj: obj)
      when "token-overlapping-window-chunker"
        Vellum::TokenOverlappingWindowChunking.validate_raw(obj: obj)
      when "delimiter-chunker"
        Vellum::DelimiterChunking.validate_raw(obj: obj)
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
    # @param member [Vellum::ReductoChunking] 
    # @return [Vellum::DocumentIndexChunking]
    def self.reducto_chunker(member:)
      new(member: member, discriminant: "reducto-chunker")
    end
    # @param member [Vellum::SentenceChunking] 
    # @return [Vellum::DocumentIndexChunking]
    def self.sentence_chunker(member:)
      new(member: member, discriminant: "sentence-chunker")
    end
    # @param member [Vellum::TokenOverlappingWindowChunking] 
    # @return [Vellum::DocumentIndexChunking]
    def self.token_overlapping_window_chunker(member:)
      new(member: member, discriminant: "token-overlapping-window-chunker")
    end
    # @param member [Vellum::DelimiterChunking] 
    # @return [Vellum::DocumentIndexChunking]
    def self.delimiter_chunker(member:)
      new(member: member, discriminant: "delimiter-chunker")
    end
  end
end