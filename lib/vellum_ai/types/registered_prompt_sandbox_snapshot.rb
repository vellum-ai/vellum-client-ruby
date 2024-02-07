# frozen_string_literal: true

require "json"

module Vellum
  class RegisteredPromptSandboxSnapshot
    attr_reader :id, :additional_properties

    # @param id [String] The ID of the generated sandbox snapshot.
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [RegisteredPromptSandboxSnapshot]
    def initialize(id:, additional_properties: nil)
      # @type [String] The ID of the generated sandbox snapshot.
      @id = id
      # @type [OpenStruct] Additional properties unmapped to the current class definition
      @additional_properties = additional_properties
    end

    # Deserialize a JSON object to an instance of RegisteredPromptSandboxSnapshot
    #
    # @param json_object [JSON]
    # @return [RegisteredPromptSandboxSnapshot]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      JSON.parse(json_object)
      id = struct.id
      new(id: id, additional_properties: struct)
    end

    # Serialize an instance of RegisteredPromptSandboxSnapshot to a JSON object
    #
    # @return [JSON]
    def to_json(*_args)
      { "id": @id }.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
    end
  end
end
