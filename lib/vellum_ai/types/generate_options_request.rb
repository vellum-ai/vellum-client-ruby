# frozen_string_literal: true

require_relative "logprobs_enum"
require "json"

module Vellum
  class GenerateOptionsRequest
    attr_reader :logprobs, :additional_properties

    # @param logprobs [LOGPROBS_ENUM] Which logprobs to include, if any. Defaults to NONE.
    #   - `ALL` - ALL
    #   - `NONE` - NONE
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [GenerateOptionsRequest]
    def initialize(logprobs: nil, additional_properties: nil)
      # @type [LOGPROBS_ENUM] Which logprobs to include, if any. Defaults to NONE.
      #   - `ALL` - ALL
      #   - `NONE` - NONE
      @logprobs = logprobs
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of GenerateOptionsRequest
    #
    # @param json_object [JSON]
    # @return [GenerateOptionsRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      logprobs = LOGPROBS_ENUM.key(parsed_json["logprobs"]) || parsed_json["logprobs"]
      new(logprobs: logprobs, additional_properties: struct)
    end

    # Serialize an instance of GenerateOptionsRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "logprobs": LOGPROBS_ENUM[@logprobs] || @logprobs }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.logprobs&.is_a?(LOGPROBS_ENUM) != false || raise("Passed value for field obj.logprobs is not the expected type, validation failed.")
    end
  end
end
