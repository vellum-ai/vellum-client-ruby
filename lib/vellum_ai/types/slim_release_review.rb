# frozen_string_literal: true
require "date"
require_relative "release_review_reviewer"
require_relative "release_review_state"
require "ostruct"
require "json"

module Vellum
  class SlimReleaseReview
  # @return [String] 
    attr_reader :id
  # @return [DateTime] 
    attr_reader :created
  # @return [Vellum::ReleaseReviewReviewer] 
    attr_reader :reviewer
  # @return [Vellum::ReleaseReviewState] 
    attr_reader :state
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param id [String] 
    # @param created [DateTime] 
    # @param reviewer [Vellum::ReleaseReviewReviewer] 
    # @param state [Vellum::ReleaseReviewState] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::SlimReleaseReview]
    def initialize(id: OMIT, created: OMIT, reviewer:, state:, additional_properties: nil)
      @id = id if id != OMIT
      @created = created if created != OMIT
      @reviewer = reviewer
      @state = state
      @additional_properties = additional_properties
      @_field_set = { "id": id, "created": created, "reviewer": reviewer, "state": state }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of SlimReleaseReview
    #
    # @param json_object [String] 
    # @return [Vellum::SlimReleaseReview]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = parsed_json["id"]
      created = unless parsed_json["created"].nil?
  DateTime.parse(parsed_json["created"])
else
  nil
end
      unless parsed_json["reviewer"].nil?
        reviewer = parsed_json["reviewer"].to_json
        reviewer = Vellum::ReleaseReviewReviewer.from_json(json_object: reviewer)
      else
        reviewer = nil
      end
      state = parsed_json["state"]
      new(
        id: id,
        created: created,
        reviewer: reviewer,
        state: state,
        additional_properties: struct
      )
    end
# Serialize an instance of SlimReleaseReview to a JSON object
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
      obj.created&.is_a?(DateTime) != false || raise("Passed value for field obj.created is not the expected type, validation failed.")
      Vellum::ReleaseReviewReviewer.validate_raw(obj: obj.reviewer)
      obj.state.is_a?(Vellum::ReleaseReviewState) != false || raise("Passed value for field obj.state is not the expected type, validation failed.")
    end
  end
end