# frozen_string_literal: true
require_relative "vellum_variable"
require_relative "prompt_parameters"
require_relative "prompt_settings"
require_relative "prompt_block"
require_relative "function_definition"
require "ostruct"
require "json"

module Vellum
  class PromptExecConfig
  # @return [String] 
    attr_reader :ml_model
  # @return [Array<Vellum::VellumVariable>] 
    attr_reader :input_variables
  # @return [Vellum::PromptParameters] 
    attr_reader :parameters
  # @return [Vellum::PromptSettings] 
    attr_reader :settings
  # @return [Array<Vellum::PromptBlock>] 
    attr_reader :blocks
  # @return [Array<Vellum::FunctionDefinition>] 
    attr_reader :functions
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param ml_model [String] 
    # @param input_variables [Array<Vellum::VellumVariable>] 
    # @param parameters [Vellum::PromptParameters] 
    # @param settings [Vellum::PromptSettings] 
    # @param blocks [Array<Vellum::PromptBlock>] 
    # @param functions [Array<Vellum::FunctionDefinition>] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::PromptExecConfig]
    def initialize(ml_model:, input_variables:, parameters:, settings: OMIT, blocks:, functions: OMIT, additional_properties: nil)
      @ml_model = ml_model
      @input_variables = input_variables
      @parameters = parameters
      @settings = settings if settings != OMIT
      @blocks = blocks
      @functions = functions if functions != OMIT
      @additional_properties = additional_properties
      @_field_set = { "ml_model": ml_model, "input_variables": input_variables, "parameters": parameters, "settings": settings, "blocks": blocks, "functions": functions }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of PromptExecConfig
    #
    # @param json_object [String] 
    # @return [Vellum::PromptExecConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      ml_model = parsed_json["ml_model"]
      input_variables = parsed_json["input_variables"]&.map do | item |
  item = item.to_json
  Vellum::VellumVariable.from_json(json_object: item)
end
      unless parsed_json["parameters"].nil?
        parameters = parsed_json["parameters"].to_json
        parameters = Vellum::PromptParameters.from_json(json_object: parameters)
      else
        parameters = nil
      end
      unless parsed_json["settings"].nil?
        settings = parsed_json["settings"].to_json
        settings = Vellum::PromptSettings.from_json(json_object: settings)
      else
        settings = nil
      end
      blocks = parsed_json["blocks"]&.map do | item |
  item = item.to_json
  Vellum::PromptBlock.from_json(json_object: item)
end
      functions = parsed_json["functions"]&.map do | item |
  item = item.to_json
  Vellum::FunctionDefinition.from_json(json_object: item)
end
      new(
        ml_model: ml_model,
        input_variables: input_variables,
        parameters: parameters,
        settings: settings,
        blocks: blocks,
        functions: functions,
        additional_properties: struct
      )
    end
# Serialize an instance of PromptExecConfig to a JSON object
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
      obj.ml_model.is_a?(String) != false || raise("Passed value for field obj.ml_model is not the expected type, validation failed.")
      obj.input_variables.is_a?(Array) != false || raise("Passed value for field obj.input_variables is not the expected type, validation failed.")
      Vellum::PromptParameters.validate_raw(obj: obj.parameters)
      obj.settings.nil? || Vellum::PromptSettings.validate_raw(obj: obj.settings)
      obj.blocks.is_a?(Array) != false || raise("Passed value for field obj.blocks is not the expected type, validation failed.")
      obj.functions&.is_a?(Array) != false || raise("Passed value for field obj.functions is not the expected type, validation failed.")
    end
  end
end