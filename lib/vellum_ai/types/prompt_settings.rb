# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class PromptSettings
  # @return [Float] 
    attr_reader :timeout
  # @return [Boolean] 
    attr_reader :stream_enabled
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param timeout [Float] 
    # @param stream_enabled [Boolean] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PromptSettings]
    def initialize(timeout: OMIT, stream_enabled: OMIT, additional_properties: nil)
      @timeout = timeout if timeout != OMIT
      @stream_enabled = stream_enabled if stream_enabled != OMIT
      @additional_properties = additional_properties
      @_field_set = { "timeout": timeout, "stream_enabled": stream_enabled }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PromptSettings
    #
    # @param json_object [String] 
    # @return [Vellum::PromptSettings]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      timeout = parsed_json["timeout"]
      stream_enabled = parsed_json["stream_enabled"]
      new(
        timeout: timeout,
        stream_enabled: stream_enabled,
        additional_properties: struct
      )
    end
# Serialize an instance of PromptSettings to a JSON object
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
      obj.timeout&.is_a?(Float) != false || raise("Passed value for field obj.timeout is not the expected type, validation failed.")
      obj.stream_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.stream_enabled is not the expected type, validation failed.")
    end
  end
end