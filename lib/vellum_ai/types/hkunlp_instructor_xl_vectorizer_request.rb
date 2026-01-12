# frozen_string_literal: true
require_relative "instructor_vectorizer_config_request"
require "ostruct"
require "json"

module Vellum
# Vectorizer for hkunlp/instructor-xl.
  class HkunlpInstructorXlVectorizerRequest
  # @return [Vellum::InstructorVectorizerConfigRequest] 
    attr_reader :config
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param config [Vellum::InstructorVectorizerConfigRequest] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::HkunlpInstructorXlVectorizerRequest]
    def initialize(config:, additional_properties: nil)
      @config = config
      @additional_properties = additional_properties
      @_field_set = { "config": config }
    end
# Deserialize a JSON object to an instance of HkunlpInstructorXlVectorizerRequest
    #
    # @param json_object [String] 
    # @return [Vellum::HkunlpInstructorXlVectorizerRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      unless parsed_json["config"].nil?
        config = parsed_json["config"].to_json
        config = Vellum::InstructorVectorizerConfigRequest.from_json(json_object: config)
      else
        config = nil
      end
      new(config: config, additional_properties: struct)
    end
# Serialize an instance of HkunlpInstructorXlVectorizerRequest to a JSON object
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
      Vellum::InstructorVectorizerConfigRequest.validate_raw(obj: obj.config)
    end
  end
end