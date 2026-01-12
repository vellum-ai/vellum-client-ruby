# frozen_string_literal: true
require "json"
require_relative "test_case_string_variable_value"
require_relative "test_case_number_variable_value"
require_relative "test_case_json_variable_value"
require_relative "test_case_chat_history_variable_value"
require_relative "test_case_search_results_variable_value"
require_relative "test_case_error_variable_value"
require_relative "test_case_function_call_variable_value"
require_relative "test_case_array_variable_value"
require_relative "test_case_audio_variable_value"
require_relative "test_case_image_variable_value"
require_relative "test_case_video_variable_value"
require_relative "test_case_document_variable_value"

module Vellum
  class TestCaseVariableValue
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::TestCaseVariableValue]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of TestCaseVariableValue
    #
    # @param json_object [String] 
    # @return [Vellum::TestCaseVariableValue]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::TestCaseStringVariableValue.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::TestCaseNumberVariableValue.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::TestCaseJSONVariableValue.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::TestCaseChatHistoryVariableValue.from_json(json_object: json_object)
      when "SEARCH_RESULTS"
        member = Vellum::TestCaseSearchResultsVariableValue.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::TestCaseErrorVariableValue.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::TestCaseFunctionCallVariableValue.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::TestCaseArrayVariableValue.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::TestCaseAudioVariableValue.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::TestCaseImageVariableValue.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::TestCaseVideoVariableValue.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::TestCaseDocumentVariableValue.from_json(json_object: json_object)
      else
        member = Vellum::TestCaseStringVariableValue.from_json(json_object: json_object)
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
      when "IMAGE"
        { **@member.to_json, type: @discriminant }.to_json
      when "VIDEO"
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
        Vellum::TestCaseStringVariableValue.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::TestCaseNumberVariableValue.validate_raw(obj: obj)
      when "JSON"
        Vellum::TestCaseJSONVariableValue.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::TestCaseChatHistoryVariableValue.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        Vellum::TestCaseSearchResultsVariableValue.validate_raw(obj: obj)
      when "ERROR"
        Vellum::TestCaseErrorVariableValue.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::TestCaseFunctionCallVariableValue.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::TestCaseArrayVariableValue.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::TestCaseAudioVariableValue.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::TestCaseImageVariableValue.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::TestCaseVideoVariableValue.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::TestCaseDocumentVariableValue.validate_raw(obj: obj)
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
    # @param member [Vellum::TestCaseStringVariableValue] 
    # @return [Vellum::TestCaseVariableValue]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::TestCaseNumberVariableValue] 
    # @return [Vellum::TestCaseVariableValue]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::TestCaseJSONVariableValue] 
    # @return [Vellum::TestCaseVariableValue]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::TestCaseChatHistoryVariableValue] 
    # @return [Vellum::TestCaseVariableValue]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::TestCaseSearchResultsVariableValue] 
    # @return [Vellum::TestCaseVariableValue]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end
    # @param member [Vellum::TestCaseErrorVariableValue] 
    # @return [Vellum::TestCaseVariableValue]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
    # @param member [Vellum::TestCaseFunctionCallVariableValue] 
    # @return [Vellum::TestCaseVariableValue]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::TestCaseArrayVariableValue] 
    # @return [Vellum::TestCaseVariableValue]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
    # @param member [Vellum::TestCaseAudioVariableValue] 
    # @return [Vellum::TestCaseVariableValue]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::TestCaseImageVariableValue] 
    # @return [Vellum::TestCaseVariableValue]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::TestCaseVideoVariableValue] 
    # @return [Vellum::TestCaseVariableValue]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::TestCaseDocumentVariableValue] 
    # @return [Vellum::TestCaseVariableValue]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end