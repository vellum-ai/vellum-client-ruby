# frozen_string_literal: true
require "json"
require_relative "prompt_version_build_config_sandbox"

module Vellum
  class PromptVersionBuildConfig
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::PromptVersionBuildConfig]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of PromptVersionBuildConfig
    #
    # @param json_object [String] 
    # @return [Vellum::PromptVersionBuildConfig]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.source
      when "SANDBOX"
        member = Vellum::PromptVersionBuildConfigSandbox.from_json(json_object: json_object)
      else
        member = Vellum::PromptVersionBuildConfigSandbox.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.source)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "SANDBOX"
        { **@member.to_json, source: @discriminant }.to_json
      else
        { "source": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.source
      when "SANDBOX"
        Vellum::PromptVersionBuildConfigSandbox.validate_raw(obj: obj)
      else
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
# For Union Types, is_a? functionality is delegated to the wrapped member.
    #
    # @param obj [Object] 
    # @return [Boolean]
    def is_a?(obj)
      @member.is_a?(obj)
    end
    # @param member [Vellum::PromptVersionBuildConfigSandbox] 
    # @return [Vellum::PromptVersionBuildConfig]
    def self.sandbox(member:)
      new(member: member, discriminant: "SANDBOX")
    end
  end
end