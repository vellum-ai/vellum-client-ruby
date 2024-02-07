# frozen_string_literal: true

require "json"
require_relative "node_output_compiled_string_value"
require_relative "node_output_compiled_number_value"
require_relative "node_output_compiled_json_value"
require_relative "node_output_compiled_chat_history_value"
require_relative "node_output_compiled_search_results_value"
require_relative "node_output_compiled_error_value"

module Vellum
  class NodeOutputCompiledValue
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [NodeOutputCompiledValue]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of NodeOutputCompiledValue
    #
    # @param json_object [JSON]
    # @return [NodeOutputCompiledValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "STRING"
                 NodeOutputCompiledStringValue.from_json(json_object: json_object)
               when "NUMBER"
                 NodeOutputCompiledNumberValue.from_json(json_object: json_object)
               when "JSON"
                 NodeOutputCompiledJsonValue.from_json(json_object: json_object)
               when "CHAT_HISTORY"
                 NodeOutputCompiledChatHistoryValue.from_json(json_object: json_object)
               when "SEARCH_RESULTS"
                 NodeOutputCompiledSearchResultsValue.from_json(json_object: json_object)
               when "ERROR"
                 NodeOutputCompiledErrorValue.from_json(json_object: json_object)
               else
                 NodeOutputCompiledStringValue.from_json(json_object: json_object)
               end
      new(member: member, discriminant: struct.type)
    end

    # For Union Types, to_json functionality is delegated to the wrapped member.
    #
    # @return [JSON]
    def to_json(*_args)
      case @discriminant
      when "STRING"
        { **@member.to_json, type: @discriminant }.to_json
      when "NUMBER"
        { **@member.to_json, type: @discriminant }.to_json
      when "JSON"
        { **@member.to_json, type: @discriminant }.to_json
      when "CHAT_HISTORY"
        { **@member.to_json, type: @discriminant }.to_json
      when "SEARCH_RESULTS"
        { **@member.to_json, type: @discriminant }.to_json
      when "ERROR"
        { **@member.to_json, type: @discriminant }.to_json
      else
        { "type": @discriminant, value: @member }.to_json
      end
      @member.to_json
    end

    # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
    #
    # @param obj [Object]
    # @return [Void]
    def self.validate_raw(obj:)
      case obj.type
      when "STRING"
        NodeOutputCompiledStringValue.validate_raw(obj: obj)
      when "NUMBER"
        NodeOutputCompiledNumberValue.validate_raw(obj: obj)
      when "JSON"
        NodeOutputCompiledJsonValue.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        NodeOutputCompiledChatHistoryValue.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        NodeOutputCompiledSearchResultsValue.validate_raw(obj: obj)
      when "ERROR"
        NodeOutputCompiledErrorValue.validate_raw(obj: obj)
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

    # @param member [NodeOutputCompiledStringValue]
    # @return [NodeOutputCompiledValue]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end

    # @param member [NodeOutputCompiledNumberValue]
    # @return [NodeOutputCompiledValue]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end

    # @param member [NodeOutputCompiledJsonValue]
    # @return [NodeOutputCompiledValue]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end

    # @param member [NodeOutputCompiledChatHistoryValue]
    # @return [NodeOutputCompiledValue]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end

    # @param member [NodeOutputCompiledSearchResultsValue]
    # @return [NodeOutputCompiledValue]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end

    # @param member [NodeOutputCompiledErrorValue]
    # @return [NodeOutputCompiledValue]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
  end
end
