# frozen_string_literal: true
require_relative "execute_api_response_json"
require "ostruct"
require "json"

module Vellum
  class ExecuteApiResponse
  # @return [Integer] 
    attr_reader :status_code
  # @return [String] 
    attr_reader :text
  # @return [Vellum::ExecuteApiResponseJson] 
    attr_reader :json
  # @return [Hash{String => String}] 
    attr_reader :headers
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param status_code [Integer] 
    # @param text [String] 
    # @param json [Vellum::ExecuteApiResponseJson] 
    # @param headers [Hash{String => String}] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ExecuteApiResponse]
    def initialize(status_code:, text:, json: OMIT, headers:, additional_properties: nil)
      @status_code = status_code
      @text = text
      @json = json if json != OMIT
      @headers = headers
      @additional_properties = additional_properties
      @_field_set = { "status_code": status_code, "text": text, "json": json, "headers": headers }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ExecuteApiResponse
    #
    # @param json_object [String] 
    # @return [Vellum::ExecuteApiResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      status_code = parsed_json["status_code"]
      text = parsed_json["text"]
      unless parsed_json["json"].nil?
        json = parsed_json["json"].to_json
        json = Vellum::ExecuteApiResponseJson.from_json(json_object: json)
      else
        json = nil
      end
      headers = parsed_json["headers"]
      new(
        status_code: status_code,
        text: text,
        json: json,
        headers: headers,
        additional_properties: struct
      )
    end
# Serialize an instance of ExecuteApiResponse to a JSON object
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
      obj.status_code.is_a?(Integer) != false || raise("Passed value for field obj.status_code is not the expected type, validation failed.")
      obj.text.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.json.nil? || Vellum::ExecuteApiResponseJson.validate_raw(obj: obj.json)
      obj.headers.is_a?(Hash) != false || raise("Passed value for field obj.headers is not the expected type, validation failed.")
    end
  end
end