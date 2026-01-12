# frozen_string_literal: true
require "json"
require_relative "string_input"
require_relative "json_input"
require_relative "chat_history_input"
require_relative "number_input"

module Vellum
  class MetricDefinitionInput
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::MetricDefinitionInput]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of MetricDefinitionInput
    #
    # @param json_object [String] 
    # @return [Vellum::MetricDefinitionInput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::StringInput.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::JSONInput.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::ChatHistoryInput.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::NumberInput.from_json(json_object: json_object)
      else
        member = Vellum::StringInput.from_json(json_object: json_object)
      end
      new(member: member, discriminant: struct.type)
    end
# For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [String]
    def to_json
      case @discriminant
      when "STRING"
        { **@member.to_json, type: @discriminant }.to_json
      when "JSON"
        { **@member.to_json, type: @discriminant }.to_json
      when "CHAT_HISTORY"
        { **@member.to_json, type: @discriminant }.to_json
      when "NUMBER"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
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
      case obj.type
      when "STRING"
        Vellum::StringInput.validate_raw(obj: obj)
      when "JSON"
        Vellum::JSONInput.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::ChatHistoryInput.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::NumberInput.validate_raw(obj: obj)
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
    # @param member [Vellum::StringInput] 
    # @return [Vellum::MetricDefinitionInput]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::JSONInput] 
    # @return [Vellum::MetricDefinitionInput]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::ChatHistoryInput] 
    # @return [Vellum::MetricDefinitionInput]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::NumberInput] 
    # @return [Vellum::MetricDefinitionInput]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
  end
end