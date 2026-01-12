# frozen_string_literal: true
require "json"
require_relative "pdf_search_result_meta_source_request"

module Vellum
  class SearchResultMetaSourceRequest
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::SearchResultMetaSourceRequest]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of SearchResultMetaSourceRequest
    #
    # @param json_object [String] 
    # @return [Vellum::SearchResultMetaSourceRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.document_type
      when "PDF"
        member = Vellum::PdfSearchResultMetaSourceRequest.from_json(json_object: json_object)
      else
        member = Vellum::PdfSearchResultMetaSourceRequest.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.document_type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "PDF"
        { **@member.to_json, document_type: @discriminant }.to_json
      else
        { "document_type": @discriminant, value: @member }.to_json
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
      case obj.document_type
      when "PDF"
        Vellum::PdfSearchResultMetaSourceRequest.validate_raw(obj: obj)
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
    # @param member [Vellum::PdfSearchResultMetaSourceRequest] 
    # @return [Vellum::SearchResultMetaSourceRequest]
    def self.pdf(member:)
      new(member: member, discriminant: "PDF")
    end
  end
end