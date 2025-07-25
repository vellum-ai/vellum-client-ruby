# frozen_string_literal: true
require_relative "vellum_audio_request"
require "ostruct"
require "json"

module Vellum
# An audio value that is used in a chat message.
  class AudioChatMessageContentRequest
  # @return [String] 
    attr_reader :type
  # @return [Vellum::VellumAudioRequest] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param type [String] 
    # @param value [Vellum::VellumAudioRequest] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::AudioChatMessageContentRequest]
    def initialize(type:, value:, additional_properties: nil)
      @type = type
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "type": type, "value": value }
    end
# Deserialize a JSON object to an instance of AudioChatMessageContentRequest
    #
    # @param json_object [String] 
    # @return [Vellum::AudioChatMessageContentRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      type = parsed_json["type"]
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::VellumAudioRequest.from_json(json_object: value)
      else
        value = nil
      end
      new(
        type: type,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of AudioChatMessageContentRequest to a JSON object
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
      obj.type.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      Vellum::VellumAudioRequest.validate_raw(obj: obj.value)
    end
  end
end