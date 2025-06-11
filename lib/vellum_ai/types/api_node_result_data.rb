# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class ApiNodeResultData
  # @return [Hash{String => Object}] 
    attr_reader :json
  # @return [String] 
    attr_reader :text_output_id
  # @return [String] 
    attr_reader :text
  # @return [String] 
    attr_reader :json_output_id
  # @return [String] 
    attr_reader :status_code_output_id
  # @return [Integer] 
    attr_reader :status_code
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param json [Hash{String => Object}] 
    # @param text_output_id [String] 
    # @param text [String] 
    # @param json_output_id [String] 
    # @param status_code_output_id [String] 
    # @param status_code [Integer] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::ApiNodeResultData]
    def initialize(json: OMIT, text_output_id:, text: OMIT, json_output_id:, status_code_output_id:, status_code:, additional_properties: nil)
      @json = json if json != OMIT
      @text_output_id = text_output_id
      @text = text if text != OMIT
      @json_output_id = json_output_id
      @status_code_output_id = status_code_output_id
      @status_code = status_code
      @additional_properties = additional_properties
      @_field_set = { "json": json, "text_output_id": text_output_id, "text": text, "json_output_id": json_output_id, "status_code_output_id": status_code_output_id, "status_code": status_code }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of ApiNodeResultData
    #
    # @param json_object [String] 
    # @return [Vellum::ApiNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      json = parsed_json["json"]
      text_output_id = parsed_json["text_output_id"]
      text = parsed_json["text"]
      json_output_id = parsed_json["json_output_id"]
      status_code_output_id = parsed_json["status_code_output_id"]
      status_code = parsed_json["status_code"]
      new(
        json: json,
        text_output_id: text_output_id,
        text: text,
        json_output_id: json_output_id,
        status_code_output_id: status_code_output_id,
        status_code: status_code,
        additional_properties: struct
      )
    end
# Serialize an instance of ApiNodeResultData to a JSON object
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
      obj.json&.is_a?(Hash) != false || raise("Passed value for field obj.json is not the expected type, validation failed.")
      obj.text_output_id.is_a?(String) != false || raise("Passed value for field obj.text_output_id is not the expected type, validation failed.")
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.json_output_id.is_a?(String) != false || raise("Passed value for field obj.json_output_id is not the expected type, validation failed.")
      obj.status_code_output_id.is_a?(String) != false || raise("Passed value for field obj.status_code_output_id is not the expected type, validation failed.")
      obj.status_code.is_a?(Integer) != false || raise("Passed value for field obj.status_code is not the expected type, validation failed.")
    end
  end
end