# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# The source of a search result from a PDF document.
  class PdfSearchResultMetaSourceRequest
  # @return [String] 
    attr_reader :document_type
  # @return [Integer] The 1-indexed page number where the chunk starts in the document. Only available
#  for supported chunking strategies and document types.
    attr_reader :start_page_num
  # @return [Integer] The 1-indexed page number where the chunk ends in the document. Only available
#  for supported chunking strategies and document types.
    attr_reader :end_page_num
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param document_type [String] 
    # @param start_page_num [Integer] The 1-indexed page number where the chunk starts in the document. Only available
#  for supported chunking strategies and document types.
    # @param end_page_num [Integer] The 1-indexed page number where the chunk ends in the document. Only available
#  for supported chunking strategies and document types.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PdfSearchResultMetaSourceRequest]
    def initialize(document_type:, start_page_num: OMIT, end_page_num: OMIT, additional_properties: nil)
      @document_type = document_type
      @start_page_num = start_page_num if start_page_num != OMIT
      @end_page_num = end_page_num if end_page_num != OMIT
      @additional_properties = additional_properties
      @_field_set = { "document_type": document_type, "start_page_num": start_page_num, "end_page_num": end_page_num }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PdfSearchResultMetaSourceRequest
    #
    # @param json_object [String] 
    # @return [Vellum::PdfSearchResultMetaSourceRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      document_type = parsed_json["document_type"]
      start_page_num = parsed_json["start_page_num"]
      end_page_num = parsed_json["end_page_num"]
      new(
        document_type: document_type,
        start_page_num: start_page_num,
        end_page_num: end_page_num,
        additional_properties: struct
      )
    end
# Serialize an instance of PdfSearchResultMetaSourceRequest to a JSON object
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
      obj.document_type.is_a?(String) != false || raise("Passed value for field obj.document_type is not the expected type, validation failed.")
      obj.start_page_num&.is_a?(Integer) != false || raise("Passed value for field obj.start_page_num is not the expected type, validation failed.")
      obj.end_page_num&.is_a?(Integer) != false || raise("Passed value for field obj.end_page_num is not the expected type, validation failed.")
    end
  end
end