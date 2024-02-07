# frozen_string_literal: true

require "json"

module Vellum
  class ModelVersionSandboxSnapshot
    attr_reader :id, :prompt_index, :prompt_id, :sandbox_id, :additional_properties

    # @param id [String] The ID of the sandbox snapshot.
    # @param prompt_index [Integer] The index of the prompt in the sandbox snapshot.
    # @param prompt_id [String] The id of the prompt in the sandbox snapshot.
    # @param sandbox_id [String]
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [ModelVersionSandboxSnapshot]
    def initialize(id:, prompt_index: nil, prompt_id: nil, sandbox_id: nil, additional_properties: nil)
      # @type [String] The ID of the sandbox snapshot.
      @id = id
      # @type [Integer] The index of the prompt in the sandbox snapshot.
      @prompt_index = prompt_index
      # @type [String] The id of the prompt in the sandbox snapshot.
      @prompt_id = prompt_id
      # @type [String]
      @sandbox_id = sandbox_id
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of ModelVersionSandboxSnapshot
    #
    # @param json_object [JSON]
    # @return [ModelVersionSandboxSnapshot]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      id = struct.id
      prompt_index = struct.prompt_index
      prompt_id = struct.prompt_id
      sandbox_id = struct.sandbox_id
      new(id: id, prompt_index: prompt_index, prompt_id: prompt_id, sandbox_id: sandbox_id,
          additional_properties: struct)
    end

    # Serialize an instance of ModelVersionSandboxSnapshot to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "id": @id, "prompt_index": @prompt_index, "prompt_id": @prompt_id, "sandbox_id": @sandbox_id }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      obj.prompt_index&.is_a?(Integer) != false || raise("Passed value for field obj.prompt_index is not the expected type, validation failed.")
      obj.prompt_id&.is_a?(String) != false || raise("Passed value for field obj.prompt_id is not the expected type, validation failed.")
      obj.sandbox_id&.is_a?(String) != false || raise("Passed value for field obj.sandbox_id is not the expected type, validation failed.")
    end
  end
end
