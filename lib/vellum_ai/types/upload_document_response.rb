# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class UploadDocumentResponse
  # @return [String] The ID of the newly created document.
    attr_reader :document_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param document_id [String] The ID of the newly created document.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::UploadDocumentResponse]
    def initialize(document_id:, additional_properties: nil)
      @document_id = document_id
      @additional_properties = additional_properties
      @_field_set = { "document_id": document_id }
    end
# Deserialize a JSON object to an instance of UploadDocumentResponse
    #
    # @param json_object [String] 
    # @return [Vellum::UploadDocumentResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      document_id = parsed_json["document_id"]
      new(document_id: document_id, additional_properties: struct)
    end
# Serialize an instance of UploadDocumentResponse to a JSON object
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
      obj.document_id.is_a?(String) != false || raise("Passed value for field obj.document_id is not the expected type, validation failed.")
    end
  end
end