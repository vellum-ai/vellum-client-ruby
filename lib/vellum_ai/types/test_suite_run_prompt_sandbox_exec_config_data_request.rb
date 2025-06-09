# frozen_string_literal: true
require "ostruct"
require "json"

module Vellum
  class TestSuiteRunPromptSandboxExecConfigDataRequest
  # @return [String] The ID of the Prompt Sandbox to run the Test Suite against.
    attr_reader :prompt_sandbox_id
  # @return [String] The ID of the Prompt Variant within the Prompt Sandbox that you'd like to run
#  the Test Suite against.
    attr_reader :prompt_variant_id
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param prompt_sandbox_id [String] The ID of the Prompt Sandbox to run the Test Suite against.
    # @param prompt_variant_id [String] The ID of the Prompt Variant within the Prompt Sandbox that you'd like to run
#  the Test Suite against.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::TestSuiteRunPromptSandboxExecConfigDataRequest]
    def initialize(prompt_sandbox_id:, prompt_variant_id:, additional_properties: nil)
      @prompt_sandbox_id = prompt_sandbox_id
      @prompt_variant_id = prompt_variant_id
      @additional_properties = additional_properties
      @_field_set = { "prompt_sandbox_id": prompt_sandbox_id, "prompt_variant_id": prompt_variant_id }
    end
# Deserialize a JSON object to an instance of
#  TestSuiteRunPromptSandboxExecConfigDataRequest
    #
    # @param json_object [String] 
    # @return [Vellum::TestSuiteRunPromptSandboxExecConfigDataRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      prompt_sandbox_id = parsed_json["prompt_sandbox_id"]
      prompt_variant_id = parsed_json["prompt_variant_id"]
      new(
        prompt_sandbox_id: prompt_sandbox_id,
        prompt_variant_id: prompt_variant_id,
        additional_properties: struct
      )
    end
# Serialize an instance of TestSuiteRunPromptSandboxExecConfigDataRequest to a
#  JSON object
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
      obj.prompt_sandbox_id.is_a?(String) != false || raise("Passed value for field obj.prompt_sandbox_id is not the expected type, validation failed.")
      obj.prompt_variant_id.is_a?(String) != false || raise("Passed value for field obj.prompt_variant_id is not the expected type, validation failed.")
    end
  end
end