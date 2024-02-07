# frozen_string_literal: true

require "json"

module Vellum
  class ApiNodeResultData
    attr_reader :text_output_id, :text, :json_output_id, :json, :status_code_output_id, :status_code,
                :additional_properties

    # @param text_output_id [String]
    # @param text [String]
    # @param json_output_id [String]
    # @param json [Hash{String => String}]
    # @param status_code_output_id [String]
    # @param status_code [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ApiNodeResultData]
    def initialize(text_output_id:, json_output_id:, status_code_output_id:, status_code:, text: nil, json: nil,
                   additional_properties: nil)
      # @type [String]
      @text_output_id = text_output_id
      # @type [String]
      @text = text
      # @type [String]
      @json_output_id = json_output_id
      # @type [Hash{String => String}]
      @json = json
      # @type [String]
      @status_code_output_id = status_code_output_id
      # @type [Integer]
      @status_code = status_code
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of ApiNodeResultData
    #
    # @param json_object [JSON]
    # @return [ApiNodeResultData]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      text_output_id = struct.text_output_id
      text = struct.text
      json_output_id = struct.json_output_id
      json = struct.json
      status_code_output_id = struct.status_code_output_id
      status_code = struct.status_code
      new(text_output_id: text_output_id, text: text, json_output_id: json_output_id, json: json,
          status_code_output_id: status_code_output_id, status_code: status_code, additional_properties: struct)
    end

    # Serialize an instance of ApiNodeResultData to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "text_output_id": @text_output_id,
        "text": @text,
        "json_output_id": @json_output_id,
        "json": @json,
        "status_code_output_id": @status_code_output_id,
        "status_code": @status_code
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.text_output_id.is_a?(String) != false || raise("Passed value for field obj.text_output_id is not the expected type, validation failed.")
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.json_output_id.is_a?(String) != false || raise("Passed value for field obj.json_output_id is not the expected type, validation failed.")
      obj.json&.is_a?(Hash) != false || raise("Passed value for field obj.json is not the expected type, validation failed.")
      obj.status_code_output_id.is_a?(String) != false || raise("Passed value for field obj.status_code_output_id is not the expected type, validation failed.")
      obj.status_code.is_a?(Integer) != false || raise("Passed value for field obj.status_code is not the expected type, validation failed.")
    end
  end
end
