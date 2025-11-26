# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class VellumVideo
  # @return [String] The reference to the source data. This can be one of the following formats:
#  1. A base64-encoded data URL (e.g.,
#  'data:application/pdf;base64,JVBERi0xLjQKJcfs...').
#  2. A url pointing to a file accessible over HTTP or HTTPS.
#  3. A reference to a file that's been previously uploaded to Vellum, in the form
#  of 'vellum:uploaded-file:{uploaded_file_id}'.
#  You can use the Uploaded Files API to retrieve the url of the uploaded file
#  given its ID. See
#  https://docs.vellum.ai/developers/client-sdk/uploaded-files/retrieve for
#  details.
    attr_reader :src
  # @return [Hash{String => Object}] 
    attr_reader :metadata
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param src [String] The reference to the source data. This can be one of the following formats:
#  1. A base64-encoded data URL (e.g.,
#  'data:application/pdf;base64,JVBERi0xLjQKJcfs...').
#  2. A url pointing to a file accessible over HTTP or HTTPS.
#  3. A reference to a file that's been previously uploaded to Vellum, in the form
#  of 'vellum:uploaded-file:{uploaded_file_id}'.
#  You can use the Uploaded Files API to retrieve the url of the uploaded file
#  given its ID. See
#  https://docs.vellum.ai/developers/client-sdk/uploaded-files/retrieve for
#  details.
    # @param metadata [Hash{String => Object}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::VellumVideo]
    def initialize(src:, metadata: OMIT, additional_properties: nil)
      @src = src
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "src": src, "metadata": metadata }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of VellumVideo
    #
    # @param json_object [String] 
    # @return [Vellum::VellumVideo]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      src = parsed_json["src"]
      metadata = parsed_json["metadata"]
      new(
        src: src,
        metadata: metadata,
        additional_properties: struct
      )
    end
# Serialize an instance of VellumVideo to a JSON object
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
      obj.src.is_a?(String) != false || raise("Passed value for field obj.src is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end