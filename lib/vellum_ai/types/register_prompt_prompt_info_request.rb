# frozen_string_literal: true

require_relative "prompt_template_block_data_request"
require_relative "registered_prompt_input_variable_request"
require "json"

module Vellum
  class RegisterPromptPromptInfoRequest
    attr_reader :prompt_block_data, :input_variables, :additional_properties

    # @param prompt_block_data [PromptTemplateBlockDataRequest]
    # @param input_variables [Array<RegisteredPromptInputVariableRequest>] The input variables specified in the prompt template.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RegisterPromptPromptInfoRequest]
    def initialize(prompt_block_data:, input_variables:, additional_properties: nil)
      # @type [PromptTemplateBlockDataRequest]
      @prompt_block_data = prompt_block_data
      # @type [Array<RegisteredPromptInputVariableRequest>] The input variables specified in the prompt template.
      @input_variables = input_variables
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of RegisterPromptPromptInfoRequest
    #
    # @param json_object [JSON]
    # @return [RegisterPromptPromptInfoRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["prompt_block_data"].nil?
        prompt_block_data = nil
      else
        prompt_block_data = parsed_json["prompt_block_data"].to_json
        prompt_block_data = PromptTemplateBlockDataRequest.from_json(json_object: prompt_block_data)
      end
      input_variables = parsed_json["input_variables"].map do |v|
        v = v.to_json
        RegisteredPromptInputVariableRequest.from_json(json_object: v)
      end
      new(prompt_block_data: prompt_block_data, input_variables: input_variables, additional_properties: struct)
    end

    # Serialize an instance of RegisterPromptPromptInfoRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "prompt_block_data": @prompt_block_data, "input_variables": @input_variables }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      PromptTemplateBlockDataRequest.validate_raw(obj: obj.prompt_block_data)
      obj.input_variables.is_a?(Array) != false || raise("Passed value for field obj.input_variables is not the expected type, validation failed.")
    end
  end
end
