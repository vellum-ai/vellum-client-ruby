# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# Represents a file that has been uploaded to a Vellum Workspace.
  class UploadedFileRead
  # @return [String] 
    attr_reader :id
  # @return [String] A signed URL to download the uploaded file.
    attr_reader :file_url
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param file_url [String] A signed URL to download the uploaded file.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::UploadedFileRead]
    def initialize(id: OMIT, file_url: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @file_url = file_url if file_url != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "file_url": file_url }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of UploadedFileRead
    #
    # @param json_object [String] 
    # @return [Vellum::UploadedFileRead]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      file_url = parsed_json["file_url"]
      new(
        id: id,
        file_url: file_url,
        additional_properties: struct
      )
    end
# Serialize an instance of UploadedFileRead to a JSON object
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
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
    end
  end
end