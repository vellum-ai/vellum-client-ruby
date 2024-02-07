# frozen_string_literal: true

require_relative "block_type_enum"
require_relative "prompt_template_block_properties"
require "json"

module Vellum
  class PromptTemplateBlock
    attr_reader :id, :block_type, :properties, :additional_properties

    # @param id [String]
    # @param block_type [BLOCK_TYPE_ENUM]
    # @param properties [PromptTemplateBlockProperties]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [PromptTemplateBlock]
    def initialize(id:, block_type:, properties:, additional_properties: nil)
      # @type [String]
      @id = id
      # @type [BLOCK_TYPE_ENUM]
      @block_type = block_type
      # @type [PromptTemplateBlockProperties]
      @properties = properties
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of PromptTemplateBlock
    #
    # @param json_object [JSON]
    # @return [PromptTemplateBlock]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      id = struct.id
      block_type = BLOCK_TYPE_ENUM.key(parsed_json["block_type"]) || parsed_json["block_type"]
      if parsed_json["properties"].nil?
        properties = nil
      else
        properties = parsed_json["properties"].to_json
        properties = PromptTemplateBlockProperties.from_json(json_object: properties)
      end
      new(id: id, block_type: block_type, properties: properties, additional_properties: struct)
    end

    # Serialize an instance of PromptTemplateBlock to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "id": @id, "block_type": BLOCK_TYPE_ENUM[@block_type] || @block_type, "properties": @properties }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.block_type.is_a?(BLOCK_TYPE_ENUM) != false || raise("Passed value for field obj.block_type is not the expected type, validation failed.")
      PromptTemplateBlockProperties.validate_raw(obj: obj.properties)
    end
  end
end
