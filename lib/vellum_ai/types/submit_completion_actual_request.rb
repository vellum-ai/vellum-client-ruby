# frozen_string_literal: true

require "date"
require "json"

module Vellum
  class SubmitCompletionActualRequest
    attr_reader :id, :external_id, :text, :quality, :timestamp, :additional_properties

    # @param id [String] The Vellum-generated ID of a previously generated completion. Must provide either this or external_id.
    # @param external_id [String] The external ID that was originally provided when generating the completion that you'd now like to submit actuals for. Must provide either this or id.
    # @param text [String] Text representing what the completion _should_ have been.
    # @param quality [Float] A number between 0 and 1 representing the quality of the completion. 0 is the worst, 1 is the best.
    # @param timestamp [DateTime] Optionally provide the timestamp representing when this feedback was collected. Used for reporting purposes.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [SubmitCompletionActualRequest]
    def initialize(id: nil, external_id: nil, text: nil, quality: nil, timestamp: nil, additional_properties: nil)
      # @type [String] The Vellum-generated ID of a previously generated completion. Must provide either this or external_id.
      @id = id
      # @type [String] The external ID that was originally provided when generating the completion that you'd now like to submit actuals for. Must provide either this or id.
      @external_id = external_id
      # @type [String] Text representing what the completion _should_ have been.
      @text = text
      # @type [Float] A number between 0 and 1 representing the quality of the completion. 0 is the worst, 1 is the best.
      @quality = quality
      # @type [DateTime] Optionally provide the timestamp representing when this feedback was collected. Used for reporting purposes.
      @timestamp = timestamp
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of SubmitCompletionActualRequest
    #
    # @param json_object [JSON]
    # @return [SubmitCompletionActualRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      external_id = struct.external_id
      text = struct.text
      quality = struct.quality
      timestamp = DateTime.parse(parsed_json["timestamp"])
      new(id: id, external_id: external_id, text: text, quality: quality, timestamp: timestamp,
          additional_properties: struct)
    end

    # Serialize an instance of SubmitCompletionActualRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "id": @id, "external_id": @external_id, "text": @text, "quality": @quality, "timestamp": @timestamp }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.quality&.is_a?(Float) != false || raise("Passed value for field obj.quality is not the expected type, validation failed.")
      obj.timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
    end
  end
end
