# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class MlModelUsage
  # @return [Integer] 
    attr_reader :output_token_count
  # @return [Integer] 
    attr_reader :input_token_count
  # @return [Integer] 
    attr_reader :input_char_count
  # @return [Integer] 
    attr_reader :output_char_count
  # @return [Integer] 
    attr_reader :compute_nanos
  # @return [Integer] 
    attr_reader :cache_creation_input_tokens
  # @return [Integer] 
    attr_reader :cache_read_input_tokens
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param output_token_count [Integer] 
    # @param input_token_count [Integer] 
    # @param input_char_count [Integer] 
    # @param output_char_count [Integer] 
    # @param compute_nanos [Integer] 
    # @param cache_creation_input_tokens [Integer] 
    # @param cache_read_input_tokens [Integer] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::MlModelUsage]
    def initialize(output_token_count: OMIT, input_token_count: OMIT, input_char_count: OMIT, output_char_count: OMIT, compute_nanos: OMIT, cache_creation_input_tokens: OMIT, cache_read_input_tokens: OMIT, additional_properties: nil)
      @output_token_count = output_token_count if output_token_count != OMIT
      @input_token_count = input_token_count if input_token_count != OMIT
      @input_char_count = input_char_count if input_char_count != OMIT
      @output_char_count = output_char_count if output_char_count != OMIT
      @compute_nanos = compute_nanos if compute_nanos != OMIT
      @cache_creation_input_tokens = cache_creation_input_tokens if cache_creation_input_tokens != OMIT
      @cache_read_input_tokens = cache_read_input_tokens if cache_read_input_tokens != OMIT
      @additional_properties = additional_properties
      @_field_set = { "output_token_count": output_token_count, "input_token_count": input_token_count, "input_char_count": input_char_count, "output_char_count": output_char_count, "compute_nanos": compute_nanos, "cache_creation_input_tokens": cache_creation_input_tokens, "cache_read_input_tokens": cache_read_input_tokens }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of MlModelUsage
    #
    # @param json_object [String] 
    # @return [Vellum::MlModelUsage]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      output_token_count = parsed_json["output_token_count"]
      input_token_count = parsed_json["input_token_count"]
      input_char_count = parsed_json["input_char_count"]
      output_char_count = parsed_json["output_char_count"]
      compute_nanos = parsed_json["compute_nanos"]
      cache_creation_input_tokens = parsed_json["cache_creation_input_tokens"]
      cache_read_input_tokens = parsed_json["cache_read_input_tokens"]
      new(
        output_token_count: output_token_count,
        input_token_count: input_token_count,
        input_char_count: input_char_count,
        output_char_count: output_char_count,
        compute_nanos: compute_nanos,
        cache_creation_input_tokens: cache_creation_input_tokens,
        cache_read_input_tokens: cache_read_input_tokens,
        additional_properties: struct
      )
    end
# Serialize an instance of MlModelUsage to a JSON object
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
      obj.output_token_count&.is_a?(Integer) != false || raise("Passed value for field obj.output_token_count is not the expected type, validation failed.")
      obj.input_token_count&.is_a?(Integer) != false || raise("Passed value for field obj.input_token_count is not the expected type, validation failed.")
      obj.input_char_count&.is_a?(Integer) != false || raise("Passed value for field obj.input_char_count is not the expected type, validation failed.")
      obj.output_char_count&.is_a?(Integer) != false || raise("Passed value for field obj.output_char_count is not the expected type, validation failed.")
      obj.compute_nanos&.is_a?(Integer) != false || raise("Passed value for field obj.compute_nanos is not the expected type, validation failed.")
      obj.cache_creation_input_tokens&.is_a?(Integer) != false || raise("Passed value for field obj.cache_creation_input_tokens is not the expected type, validation failed.")
      obj.cache_read_input_tokens&.is_a?(Integer) != false || raise("Passed value for field obj.cache_read_input_tokens is not the expected type, validation failed.")
    end
  end
end