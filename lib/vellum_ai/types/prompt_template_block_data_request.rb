# frozen_string_literal: true

require_relative "prompt_template_block_request"
require "json"

module Vellum
  class PromptTemplateBlockDataRequest
    attr_reader :version, :blocks, :additional_properties

    # @param version [Integer]
    # @param blocks [Array<PromptTemplateBlockRequest>]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [PromptTemplateBlockDataRequest]
    def initialize(version:, blocks:, additional_properties: nil)
      # @type [Integer]
      @version = version
      # @type [Array<PromptTemplateBlockRequest>]
      @blocks = blocks
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of PromptTemplateBlockDataRequest
    #
    # @param json_object [JSON]
    # @return [PromptTemplateBlockDataRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      version = struct.version
      blocks = parsed_json["blocks"].map do |v|
        v = v.to_json
        PromptTemplateBlockRequest.from_json(json_object: v)
      end
      new(version: version, blocks: blocks, additional_properties: struct)
    end

    # Serialize an instance of PromptTemplateBlockDataRequest to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "version": @version, "blocks": @blocks }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.version.is_a?(Integer) != false || raise("Passed value for field obj.version is not the expected type, validation failed.")
      obj.blocks.is_a?(Array) != false || raise("Passed value for field obj.blocks is not the expected type, validation failed.")
    end
  end
end
