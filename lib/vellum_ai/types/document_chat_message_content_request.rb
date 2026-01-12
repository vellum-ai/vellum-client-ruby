# frozen_string_literal: true
require_relative "vellum_document_request"
require "ostruct"
require "json"

module Vellum
# A document value that is used in a chat message.
  class DocumentChatMessageContentRequest
  # @return [Vellum::VellumDocumentRequest] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param value [Vellum::VellumDocumentRequest] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::DocumentChatMessageContentRequest]
    def initialize(value:, additional_properties: nil)
      @value = value
      @additional_properties = additional_properties
      @_field_set = { "value": value }
    end
# Deserialize a JSON object to an instance of DocumentChatMessageContentRequest
    #
    # @param json_object [String] 
    # @return [Vellum::DocumentChatMessageContentRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["value"].nil?
        value = parsed_json["value"].to_json
        value = Vellum::VellumDocumentRequest.from_json(json_object: value)
      else
        value = nil
      end
      new(value: value, additional_properties: struct)
    end
# Serialize an instance of DocumentChatMessageContentRequest to a JSON object
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
      Vellum::VellumDocumentRequest.validate_raw(obj: obj.value)
    end
  end
end