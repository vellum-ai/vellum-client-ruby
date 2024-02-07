# frozen_string_literal: true

require_relative "model_version_exec_config_parameters"
require_relative "vellum_variable"
require_relative "prompt_template_block_data"
require "json"

module Vellum
  class ModelVersionExecConfig
    attr_reader :parameters, :input_variables, :prompt_template, :prompt_block_data, :prompt_syntax_version,
                :additional_properties

    # @param parameters [ModelVersionExecConfigParameters] The generation parameters that are passed to the LLM provider at runtime.
    # @param input_variables [Array<VellumVariable>] Input variables specified in the prompt template.
    # @param prompt_template [String] The template used to generate prompts for this model version.
    # @param prompt_block_data [PromptTemplateBlockData]
    # @param prompt_syntax_version [Integer]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ModelVersionExecConfig]
    def initialize(parameters:, input_variables:, prompt_template: nil, prompt_block_data: nil,
                   prompt_syntax_version: nil, additional_properties: nil)
      # @type [ModelVersionExecConfigParameters] The generation parameters that are passed to the LLM provider at runtime.
      @parameters = parameters
      # @type [Array<VellumVariable>] Input variables specified in the prompt template.
      @input_variables = input_variables
      # @type [String] The template used to generate prompts for this model version.
      @prompt_template = prompt_template
      # @type [PromptTemplateBlockData]
      @prompt_block_data = prompt_block_data
      # @type [Integer]
      @prompt_syntax_version = prompt_syntax_version
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of ModelVersionExecConfig
    #
    # @param json_object [JSON]
    # @return [ModelVersionExecConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      if parsed_json["parameters"].nil?
        parameters = nil
      else
        parameters = parsed_json["parameters"].to_json
        parameters = ModelVersionExecConfigParameters.from_json(json_object: parameters)
      end
      input_variables = parsed_json["input_variables"].map do |v|
        v = v.to_json
        VellumVariable.from_json(json_object: v)
      end
      prompt_template = struct.prompt_template
      if parsed_json["prompt_block_data"].nil?
        prompt_block_data = nil
      else
        prompt_block_data = parsed_json["prompt_block_data"].to_json
        prompt_block_data = PromptTemplateBlockData.from_json(json_object: prompt_block_data)
      end
      prompt_syntax_version = struct.prompt_syntax_version
      new(parameters: parameters, input_variables: input_variables, prompt_template: prompt_template,
          prompt_block_data: prompt_block_data, prompt_syntax_version: prompt_syntax_version, additional_properties: struct)
    end

    # Serialize an instance of ModelVersionExecConfig to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "parameters": @parameters,
        "input_variables": @input_variables,
        "prompt_template": @prompt_template,
        "prompt_block_data": @prompt_block_data,
        "prompt_syntax_version": @prompt_syntax_version
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      ModelVersionExecConfigParameters.validate_raw(obj: obj.parameters)
      obj.input_variables.is_a?(Array) != false || raise("Passed value for field obj.input_variables is not the expected type, validation failed.")
      obj.prompt_template&.is_a?(String) != false || raise("Passed value for field obj.prompt_template is not the expected type, validation failed.")
      obj.prompt_block_data.nil? || PromptTemplateBlockData.validate_raw(obj: obj.prompt_block_data)
      obj.prompt_syntax_version&.is_a?(Integer) != false || raise("Passed value for field obj.prompt_syntax_version is not the expected type, validation failed.")
    end
  end
end
