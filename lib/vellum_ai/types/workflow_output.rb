# frozen_string_literal: true

require "json"
require_relative "workflow_output_string"
require_relative "workflow_output_number"
require_relative "workflow_output_json"
require_relative "workflow_output_chat_history"
require_relative "workflow_output_search_results"
require_relative "workflow_output_array"
require_relative "workflow_output_error"
require_relative "workflow_output_function_call"
require_relative "workflow_output_image"

module Vellum
  class WorkflowOutput
    attr_reader :member, :discriminant

    private_class_method :new
    alias kind_of? is_a?
    # @param member [Object]
    # @param discriminant [String]
    # @return [WorkflowOutput]
    def initialize(member:, discriminant:)
      # @type [Object]
      @member = member
      # @type [String]
      @discriminant = discriminant
    end

    # Deserialize a JSON object to an instance of WorkflowOutput
    #
    # @param json_object [JSON]
    # @return [WorkflowOutput]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      member = case struct.type
               when "STRING"
                 WorkflowOutputString.from_json(json_object: json_object)
               when "NUMBER"
                 WorkflowOutputNumber.from_json(json_object: json_object)
               when "JSON"
                 WorkflowOutputJson.from_json(json_object: json_object)
               when "CHAT_HISTORY"
                 WorkflowOutputChatHistory.from_json(json_object: json_object)
               when "SEARCH_RESULTS"
                 WorkflowOutputSearchResults.from_json(json_object: json_object)
               when "ARRAY"
                 WorkflowOutputArray.from_json(json_object: json_object)
               when "ERROR"
                 WorkflowOutputError.from_json(json_object: json_object)
               when "FUNCTION_CALL"
                 WorkflowOutputFunctionCall.from_json(json_object: json_object)
               when "IMAGE"
                 WorkflowOutputImage.from_json(json_object: json_object)
               else
                 WorkflowOutputString.from_json(json_object: json_object)
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
      when "ARRAY"
        { **@member.to_json, type: @discriminant }.to_json
      when "ERROR"
        { **@member.to_json, type: @discriminant }.to_json
      when "FUNCTION_CALL"
        { **@member.to_json, type: @discriminant }.to_json
      when "IMAGE"
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
        WorkflowOutputString.validate_raw(obj: obj)
      when "NUMBER"
        WorkflowOutputNumber.validate_raw(obj: obj)
      when "JSON"
        WorkflowOutputJson.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        WorkflowOutputChatHistory.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        WorkflowOutputSearchResults.validate_raw(obj: obj)
      when "ARRAY"
        WorkflowOutputArray.validate_raw(obj: obj)
      when "ERROR"
        WorkflowOutputError.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        WorkflowOutputFunctionCall.validate_raw(obj: obj)
      when "IMAGE"
        WorkflowOutputImage.validate_raw(obj: obj)
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

    # @param member [WorkflowOutputString]
    # @return [WorkflowOutput]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end

    # @param member [WorkflowOutputNumber]
    # @return [WorkflowOutput]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end

    # @param member [WorkflowOutputJson]
    # @return [WorkflowOutput]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end

    # @param member [WorkflowOutputChatHistory]
    # @return [WorkflowOutput]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end

    # @param member [WorkflowOutputSearchResults]
    # @return [WorkflowOutput]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end

    # @param member [WorkflowOutputArray]
    # @return [WorkflowOutput]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end

    # @param member [WorkflowOutputError]
    # @return [WorkflowOutput]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end

    # @param member [WorkflowOutputFunctionCall]
    # @return [WorkflowOutput]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end

    # @param member [WorkflowOutputImage]
    # @return [WorkflowOutput]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
  end
end
