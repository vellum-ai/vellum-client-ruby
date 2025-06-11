# frozen_string_literal: true
require_relative "logprobs_enum"
require "ostruct"
require "json"

module Vellum
  class GenerateOptionsRequest
  # @return [Vellum::LogprobsEnum] Which logprobs to include, if any. Defaults to NONE.
#  * `ALL` - ALL
#  * `NONE` - NONE
    attr_reader :logprobs
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param logprobs [Vellum::LogprobsEnum] Which logprobs to include, if any. Defaults to NONE.
#  * `ALL` - ALL
#  * `NONE` - NONE
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::GenerateOptionsRequest]
    def initialize(logprobs: OMIT, additional_properties: nil)
      @logprobs = logprobs if logprobs != OMIT
      @additional_properties = additional_properties
      @_field_set = { "logprobs": logprobs }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of GenerateOptionsRequest
    #
    # @param json_object [String] 
    # @return [Vellum::GenerateOptionsRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      logprobs = parsed_json["logprobs"]
      new(logprobs: logprobs, additional_properties: struct)
    end
# Serialize an instance of GenerateOptionsRequest to a JSON object
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
      obj.logprobs&.is_a?(Vellum::LogprobsEnum) != false || raise("Passed value for field obj.logprobs is not the expected type, validation failed.")
    end
  end
end