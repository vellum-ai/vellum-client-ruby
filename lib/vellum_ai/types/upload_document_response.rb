# frozen_string_literal: true

require "json"

module Vellum
  class UploadDocumentResponse
    attr_reader :document_id, :additional_properties

    # @param document_id [String] The ID of the newly created document.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [UploadDocumentResponse]
    def initialize(document_id:, additional_properties: nil)
      # @type [String] The ID of the newly created document.
      @document_id = document_id
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of UploadDocumentResponse
    #
    # @param json_object [JSON]
    # @return [UploadDocumentResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      document_id = struct.document_id
      new(document_id: document_id, additional_properties: struct)
    end

    # Serialize an instance of UploadDocumentResponse to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "document_id": @document_id }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.document_id.is_a?(String) != false || raise("Passed value for field obj.document_id is not the expected type, validation failed.")
    end
  end
end
