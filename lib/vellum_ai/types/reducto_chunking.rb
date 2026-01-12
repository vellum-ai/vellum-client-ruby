# frozen_string_literal: true
require_relative "reducto_chunker_config"
require "ostruct"
require "json"

module Vellum
# Reducto chunking
  class ReductoChunking
  # @return [Vellum::ReductoChunkerConfig] 
    attr_reader :chunker_config
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param chunker_config [Vellum::ReductoChunkerConfig] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ReductoChunking]
    def initialize(chunker_config: OMIT, additional_properties: nil)
      @chunker_config = chunker_config if chunker_config != OMIT
      @additional_properties = additional_properties
      @_field_set = { "chunker_config": chunker_config }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ReductoChunking
    #
    # @param json_object [String] 
    # @return [Vellum::ReductoChunking]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["chunker_config"].nil?
        chunker_config = parsed_json["chunker_config"].to_json
        chunker_config = Vellum::ReductoChunkerConfig.from_json(json_object: chunker_config)
      else
        chunker_config = nil
      end
      new(chunker_config: chunker_config, additional_properties: struct)
    end
# Serialize an instance of ReductoChunking to a JSON object
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
      obj.chunker_config.nil? || Vellum::ReductoChunkerConfig.validate_raw(obj: obj.chunker_config)
    end
  end
end