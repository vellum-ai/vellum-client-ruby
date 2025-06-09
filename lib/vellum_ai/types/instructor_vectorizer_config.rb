# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
# Configuration for using an Instructor vectorizer.
  class InstructorVectorizerConfig
  # @return [String] 
    attr_reader :instruction_domain
  # @return [String] 
    attr_reader :instruction_query_text_type
  # @return [String] 
    attr_reader :instruction_document_text_type
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param instruction_domain [String] 
    # @param instruction_query_text_type [String] 
    # @param instruction_document_text_type [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::InstructorVectorizerConfig]
    def initialize(instruction_domain:, instruction_query_text_type:, instruction_document_text_type:, additional_properties: nil)
      @instruction_domain = instruction_domain
      @instruction_query_text_type = instruction_query_text_type
      @instruction_document_text_type = instruction_document_text_type
      @additional_properties = additional_properties
      @_field_set = { "instruction_domain": instruction_domain, "instruction_query_text_type": instruction_query_text_type, "instruction_document_text_type": instruction_document_text_type }
    end
# Deserialize a JSON object to an instance of InstructorVectorizerConfig
    #
    # @param json_object [String] 
    # @return [Vellum::InstructorVectorizerConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      instruction_domain = parsed_json["instruction_domain"]
      instruction_query_text_type = parsed_json["instruction_query_text_type"]
      instruction_document_text_type = parsed_json["instruction_document_text_type"]
      new(
        instruction_domain: instruction_domain,
        instruction_query_text_type: instruction_query_text_type,
        instruction_document_text_type: instruction_document_text_type,
        additional_properties: struct
      )
    end
# Serialize an instance of InstructorVectorizerConfig to a JSON object
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
      obj.instruction_domain.is_a?(String) != false || raise("Passed value for field obj.instruction_domain is not the expected type, validation failed.")
      obj.instruction_query_text_type.is_a?(String) != false || raise("Passed value for field obj.instruction_query_text_type is not the expected type, validation failed.")
      obj.instruction_document_text_type.is_a?(String) != false || raise("Passed value for field obj.instruction_document_text_type is not the expected type, validation failed.")
    end
  end
end