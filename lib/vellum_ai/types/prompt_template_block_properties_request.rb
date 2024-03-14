# frozen_string_literal: true

require_relative "chat_message_role"
require_relative "vellum_variable_type"
require_relative "prompt_template_block_request"
require "json"

module Vellum
  class PromptTemplateBlockPropertiesRequest
    attr_reader :chat_role, :chat_message_unterminated, :chat_source, :template, :template_type, :function_name,
                :function_description, :function_parameters, :function_forced, :blocks, :additional_properties

    # @param chat_role [CHAT_MESSAGE_ROLE]
    # @param chat_message_unterminated [Boolean]
    # @param chat_source [String]
    # @param template [String]
    # @param template_type [VELLUM_VARIABLE_TYPE]
    # @param function_name [String]
    # @param function_description [String]
    # @param function_parameters [Hash{String => String}]
    # @param function_forced [Boolean]
    # @param blocks [Array<PromptTemplateBlockRequest>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [PromptTemplateBlockPropertiesRequest]
    def initialize(chat_role: nil, chat_message_unterminated: nil, chat_source: nil, template: nil, template_type: nil,
                   function_name: nil, function_description: nil, function_parameters: nil, function_forced: nil, blocks: nil, additional_properties: nil)
      # @type [CHAT_MESSAGE_ROLE]
      @chat_role = chat_role
      # @type [Boolean]
      @chat_message_unterminated = chat_message_unterminated
      # @type [String]
      @chat_source = chat_source
      # @type [String]
      @template = template
      # @type [VELLUM_VARIABLE_TYPE]
      @template_type = template_type
      # @type [String]
      @function_name = function_name
      # @type [String]
      @function_description = function_description
      # @type [Hash{String => String}]
      @function_parameters = function_parameters
      # @type [Boolean]
      @function_forced = function_forced
      # @type [Array<PromptTemplateBlockRequest>]
      @blocks = blocks
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of PromptTemplateBlockPropertiesRequest
    #
    # @param json_object [JSON]
    # @return [PromptTemplateBlockPropertiesRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      chat_role = CHAT_MESSAGE_ROLE.key(parsed_json["chat_role"]) || parsed_json["chat_role"]
      chat_message_unterminated = struct.chat_message_unterminated
      chat_source = struct.chat_source
      template = struct.template
      template_type = VELLUM_VARIABLE_TYPE.key(parsed_json["template_type"]) || parsed_json["template_type"]
      function_name = struct.function_name
      function_description = struct.function_description
      function_parameters = struct.function_parameters
      function_forced = struct.function_forced
      blocks = parsed_json["blocks"].map do |v|
        v = v.to_json
        PromptTemplateBlockRequest.from_json(json_object: v)
      end
      new(chat_role: chat_role, chat_message_unterminated: chat_message_unterminated, chat_source: chat_source,
          template: template, template_type: template_type, function_name: function_name, function_description: function_description, function_parameters: function_parameters, function_forced: function_forced, blocks: blocks, additional_properties: struct)
    end

    # Serialize an instance of PromptTemplateBlockPropertiesRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      {
        "chat_role": CHAT_MESSAGE_ROLE[@chat_role] || @chat_role,
        "chat_message_unterminated": @chat_message_unterminated,
        "chat_source": @chat_source,
        "template": @template,
        "template_type": VELLUM_VARIABLE_TYPE[@template_type] || @template_type,
        "function_name": @function_name,
        "function_description": @function_description,
        "function_parameters": @function_parameters,
        "function_forced": @function_forced,
        "blocks": @blocks
      }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.chat_role&.is_a?(CHAT_MESSAGE_ROLE) != false || raise("Passed value for field obj.chat_role is not the expected type, validation failed.")
      obj.chat_message_unterminated&.is_a?(Boolean) != false || raise("Passed value for field obj.chat_message_unterminated is not the expected type, validation failed.")
      obj.chat_source&.is_a?(String) != false || raise("Passed value for field obj.chat_source is not the expected type, validation failed.")
      obj.template&.is_a?(String) != false || raise("Passed value for field obj.template is not the expected type, validation failed.")
      obj.template_type&.is_a?(VELLUM_VARIABLE_TYPE) != false || raise("Passed value for field obj.template_type is not the expected type, validation failed.")
      obj.function_name&.is_a?(String) != false || raise("Passed value for field obj.function_name is not the expected type, validation failed.")
      obj.function_description&.is_a?(String) != false || raise("Passed value for field obj.function_description is not the expected type, validation failed.")
      obj.function_parameters&.is_a?(Hash) != false || raise("Passed value for field obj.function_parameters is not the expected type, validation failed.")
      obj.function_forced&.is_a?(Boolean) != false || raise("Passed value for field obj.function_forced is not the expected type, validation failed.")
      obj.blocks&.is_a?(Array) != false || raise("Passed value for field obj.blocks is not the expected type, validation failed.")
    end
  end
end
