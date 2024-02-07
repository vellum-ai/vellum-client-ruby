# frozen_string_literal: true

require "json"

module Vellum
  # A string value that is used in a chat message.
  class StringChatMessageContent
    attr_reader :value, :additional_properties

    # @param value [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [StringChatMessageContent]
    def initialize(value:, additional_properties: nil)
      # @type [String]
      @value = value
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of StringChatMessageContent
    #
    # @param json_object [JSON]
    # @return [StringChatMessageContent]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      value = struct.value
      new(value: value, additional_properties: struct)
    end

    # Serialize an instance of StringChatMessageContent to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "value": @value }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.value.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end
