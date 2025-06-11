# frozen_string_literal: true
require "date"
require "ostruct"
require "json"

module Vellum
  class SubmitCompletionActualRequest
  # @return [String] The Vellum-generated ID of a previously generated completion. Must provide
#  either this or external_id.
    attr_reader :id
  # @return [String] The external ID that was originally provided when generating the completion that
#  you'd now like to submit actuals for. Must provide either this or id.
    attr_reader :external_id
  # @return [String] Text representing what the completion _should_ have been.
    attr_reader :text
  # @return [Float] A number between 0 and 1 representing the quality of the completion. 0 is the
#  worst, 1 is the best.
    attr_reader :quality
  # @return [DateTime] Optionally provide the timestamp representing when this feedback was collected.
#  Used for reporting purposes.
    attr_reader :timestamp
  # @return [Hash{String => Object}] Optionally provide additional metadata about the feedback submission.
    attr_reader :metadata
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] The Vellum-generated ID of a previously generated completion. Must provide
#  either this or external_id.
    # @param external_id [String] The external ID that was originally provided when generating the completion that
#  you'd now like to submit actuals for. Must provide either this or id.
    # @param text [String] Text representing what the completion _should_ have been.
    # @param quality [Float] A number between 0 and 1 representing the quality of the completion. 0 is the
#  worst, 1 is the best.
    # @param timestamp [DateTime] Optionally provide the timestamp representing when this feedback was collected.
#  Used for reporting purposes.
    # @param metadata [Hash{String => Object}] Optionally provide additional metadata about the feedback submission.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SubmitCompletionActualRequest]
    def initialize(id: OMIT, external_id: OMIT, text: OMIT, quality: OMIT, timestamp: OMIT, metadata: OMIT, additional_properties: nil)
      @id = id if id != OMIT
      @external_id = external_id if external_id != OMIT
      @text = text if text != OMIT
      @quality = quality if quality != OMIT
      @timestamp = timestamp if timestamp != OMIT
      @metadata = metadata if metadata != OMIT
      @additional_properties = additional_properties
      @_field_set = { "id": id, "external_id": external_id, "text": text, "quality": quality, "timestamp": timestamp, "metadata": metadata }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SubmitCompletionActualRequest
    #
    # @param json_object [String] 
    # @return [Vellum::SubmitCompletionActualRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      external_id = parsed_json["external_id"]
      text = parsed_json["text"]
      quality = parsed_json["quality"]
      timestamp = unless parsed_json["timestamp"].nil?
  DateTime.parse(parsed_json["timestamp"])
else
  nil
end
      metadata = parsed_json["metadata"]
      new(
        id: id,
        external_id: external_id,
        text: text,
        quality: quality,
        timestamp: timestamp,
        metadata: metadata,
        additional_properties: struct
      )
    end
# Serialize an instance of SubmitCompletionActualRequest to a JSON object
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
      obj.external_id&.is_a?(String) != false || raise("Passed value for field obj.external_id is not the expected type, validation failed.")
      obj.text&.is_a?(String) != false || raise("Passed value for field obj.text is not the expected type, validation failed.")
      obj.quality&.is_a?(Float) != false || raise("Passed value for field obj.quality is not the expected type, validation failed.")
      obj.timestamp&.is_a?(DateTime) != false || raise("Passed value for field obj.timestamp is not the expected type, validation failed.")
      obj.metadata&.is_a?(Hash) != false || raise("Passed value for field obj.metadata is not the expected type, validation failed.")
    end
  end
end