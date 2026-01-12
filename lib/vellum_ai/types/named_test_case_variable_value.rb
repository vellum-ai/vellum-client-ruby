# frozen_string_literal: true
require "json"
require_relative "named_test_case_string_variable_value"
require_relative "named_test_case_number_variable_value"
require_relative "named_test_case_json_variable_value"
require_relative "named_test_case_chat_history_variable_value"
require_relative "named_test_case_search_results_variable_value"
require_relative "named_test_case_error_variable_value"
require_relative "named_test_case_function_call_variable_value"
require_relative "named_test_case_array_variable_value"
require_relative "named_test_case_audio_variable_value"
require_relative "named_test_case_video_variable_value"
require_relative "named_test_case_image_variable_value"
require_relative "named_test_case_document_variable_value"

module Vellum
  class NamedTestCaseVariableValue
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of NamedTestCaseVariableValue
    #
    # @param json_object [String] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::NamedTestCaseStringVariableValue.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::NamedTestCaseNumberVariableValue.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::NamedTestCaseJSONVariableValue.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::NamedTestCaseChatHistoryVariableValue.from_json(json_object: json_object)
      when "SEARCH_RESULTS"
        member = Vellum::NamedTestCaseSearchResultsVariableValue.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::NamedTestCaseErrorVariableValue.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::NamedTestCaseFunctionCallVariableValue.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::NamedTestCaseArrayVariableValue.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::NamedTestCaseAudioVariableValue.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::NamedTestCaseVideoVariableValue.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::NamedTestCaseImageVariableValue.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::NamedTestCaseDocumentVariableValue.from_json(json_object: json_object)
      else
        member = Vellum::NamedTestCaseStringVariableValue.from_json(json_object: json_object)
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
      when "FUNCTION_CALL"
        { **@member.to_json, type: @discriminant }.to_json
      when "ARRAY"
        { **@member.to_json, type: @discriminant }.to_json
      when "AUDIO"
        { **@member.to_json, type: @discriminant }.to_json
      when "VIDEO"
        { **@member.to_json, type: @discriminant }.to_json
      when "IMAGE"
        { **@member.to_json, type: @discriminant }.to_json
      when "DOCUMENT"
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
        Vellum::NamedTestCaseStringVariableValue.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::NamedTestCaseNumberVariableValue.validate_raw(obj: obj)
      when "JSON"
        Vellum::NamedTestCaseJSONVariableValue.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::NamedTestCaseChatHistoryVariableValue.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        Vellum::NamedTestCaseSearchResultsVariableValue.validate_raw(obj: obj)
      when "ERROR"
        Vellum::NamedTestCaseErrorVariableValue.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::NamedTestCaseFunctionCallVariableValue.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::NamedTestCaseArrayVariableValue.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::NamedTestCaseAudioVariableValue.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::NamedTestCaseVideoVariableValue.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::NamedTestCaseImageVariableValue.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::NamedTestCaseDocumentVariableValue.validate_raw(obj: obj)
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
    # @param member [Vellum::NamedTestCaseStringVariableValue] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::NamedTestCaseNumberVariableValue] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::NamedTestCaseJSONVariableValue] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::NamedTestCaseChatHistoryVariableValue] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::NamedTestCaseSearchResultsVariableValue] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end
    # @param member [Vellum::NamedTestCaseErrorVariableValue] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
    # @param member [Vellum::NamedTestCaseFunctionCallVariableValue] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::NamedTestCaseArrayVariableValue] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
    # @param member [Vellum::NamedTestCaseAudioVariableValue] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::NamedTestCaseVideoVariableValue] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::NamedTestCaseImageVariableValue] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::NamedTestCaseDocumentVariableValue] 
    # @return [Vellum::NamedTestCaseVariableValue]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end