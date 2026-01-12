# frozen_string_literal: true
require_relative "search_result_meta_source"
require "ostruct"
require "json"

module Vellum
  class SearchResultMeta
  # @return [Vellum::SearchResultMetaSource] 
    attr_reader :source
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param source [Vellum::SearchResultMetaSource] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SearchResultMeta]
    def initialize(source: OMIT, additional_properties: nil)
      @source = source if source != OMIT
      @additional_properties = additional_properties
      @_field_set = { "source": source }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SearchResultMeta
    #
    # @param json_object [String] 
    # @return [Vellum::SearchResultMeta]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["source"].nil?
        source = parsed_json["source"].to_json
        source = Vellum::SearchResultMetaSource.from_json(json_object: source)
      else
        source = nil
      end
      new(source: source, additional_properties: struct)
    end
# Serialize an instance of SearchResultMeta to a JSON object
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
      obj.source.nil? || Vellum::SearchResultMetaSource.validate_raw(obj: obj.source)
    end
  end
end