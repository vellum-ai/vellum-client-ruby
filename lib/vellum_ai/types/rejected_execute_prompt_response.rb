# frozen_string_literal: true
require_relative "prompt_execution_meta"
require_relative "vellum_error"
require "ostruct"
require "json"

module Vellum
# The unsuccessful response from the model containing an error of what went wrong.
  class RejectedExecutePromptResponse
  # @return [Vellum::PromptExecutionMeta] 
    attr_reader :meta
  # @return [Hash{String => Object}] The subset of the raw response from the model that the request opted into with
#  `expand_raw`.
    attr_reader :raw
  # @return [String] The ID of the execution.
    attr_reader :execution_id
  # @return [Vellum::VellumError] 
    attr_reader :error
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param meta [Vellum::PromptExecutionMeta] 
    # @param raw [Hash{String => Object}] The subset of the raw response from the model that the request opted into with
#  `expand_raw`.
    # @param execution_id [String] The ID of the execution.
    # @param error [Vellum::VellumError] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::RejectedExecutePromptResponse]
    def initialize(meta: OMIT, raw: OMIT, execution_id:, error:, additional_properties: nil)
      @meta = meta if meta != OMIT
      @raw = raw if raw != OMIT
      @execution_id = execution_id
      @error = error
      @additional_properties = additional_properties
      @_field_set = { "meta": meta, "raw": raw, "execution_id": execution_id, "error": error }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of RejectedExecutePromptResponse
    #
    # @param json_object [String] 
    # @return [Vellum::RejectedExecutePromptResponse]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["meta"].nil?
        meta = parsed_json["meta"].to_json
        meta = Vellum::PromptExecutionMeta.from_json(json_object: meta)
      else
        meta = nil
      end
      raw = parsed_json["raw"]
      execution_id = parsed_json["execution_id"]
      unless parsed_json["error"].nil?
        error = parsed_json["error"].to_json
        error = Vellum::VellumError.from_json(json_object: error)
      else
        error = nil
      end
      new(
        meta: meta,
        raw: raw,
        execution_id: execution_id,
        error: error,
        additional_properties: struct
      )
    end
# Serialize an instance of RejectedExecutePromptResponse to a JSON object
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
      obj.meta.nil? || Vellum::PromptExecutionMeta.validate_raw(obj: obj.meta)
      obj.raw&.is_a?(Hash) != false || raise("Passed value for field obj.raw is not the expected type, validation failed.")
      obj.execution_id.is_a?(String) != false || raise("Passed value for field obj.execution_id is not the expected type, validation failed.")
      Vellum::VellumError.validate_raw(obj: obj.error)
    end
  end
end