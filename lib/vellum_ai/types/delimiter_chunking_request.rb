# frozen_string_literal: true
require_relative "delimiter_chunker_config_request"
require "ostruct"
require "json"

module Vellum
  class DelimiterChunkingRequest
  # @return [String] 
    attr_reader :chunker_name
  # @return [Vellum::DelimiterChunkerConfigRequest] 
    attr_reader :chunker_config
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param chunker_name [String] 
    # @param chunker_config [Vellum::DelimiterChunkerConfigRequest] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::DelimiterChunkingRequest]
    def initialize(chunker_name:, chunker_config: OMIT, additional_properties: nil)
      @chunker_name = chunker_name
      @chunker_config = chunker_config if chunker_config != OMIT
      @additional_properties = additional_properties
      @_field_set = { "chunker_name": chunker_name, "chunker_config": chunker_config }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of DelimiterChunkingRequest
    #
    # @param json_object [String] 
    # @return [Vellum::DelimiterChunkingRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      chunker_name = parsed_json["chunker_name"]
      unless parsed_json["chunker_config"].nil?
        chunker_config = parsed_json["chunker_config"].to_json
        chunker_config = Vellum::DelimiterChunkerConfigRequest.from_json(json_object: chunker_config)
      else
        chunker_config = nil
      end
      new(
        chunker_name: chunker_name,
        chunker_config: chunker_config,
        additional_properties: struct
      )
    end
# Serialize an instance of DelimiterChunkingRequest to a JSON object
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
      obj.chunker_name.is_a?(String) != false || raise("Passed value for field obj.chunker_name is not the expected type, validation failed.")
      obj.chunker_config.nil? || Vellum::DelimiterChunkerConfigRequest.validate_raw(obj: obj.chunker_config)
    end
  end
end