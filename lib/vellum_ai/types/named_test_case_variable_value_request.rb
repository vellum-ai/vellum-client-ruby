# frozen_string_literal: true
require "json"
require_relative "named_test_case_string_variable_value_request"
require_relative "named_test_case_number_variable_value_request"
require_relative "named_test_case_json_variable_value_request"
require_relative "named_test_case_chat_history_variable_value_request"
require_relative "named_test_case_search_results_variable_value_request"
require_relative "named_test_case_error_variable_value_request"
require_relative "named_test_case_function_call_variable_value_request"
require_relative "named_test_case_array_variable_value_request"
require_relative "named_test_case_audio_variable_value_request"
require_relative "named_test_case_video_variable_value_request"
require_relative "named_test_case_image_variable_value_request"
require_relative "named_test_case_document_variable_value_request"

module Vellum
  class NamedTestCaseVariableValueRequest
  # @return [Object] 
    attr_reader :member
  # @return [String] 
    attr_reader :discriminant

    private_class_method :new
    alias kind_of? is_a?

    # @param member [Object] 
    # @param discriminant [String] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def initialize(member:, discriminant:)
      @member = member
      @discriminant = discriminant
    end
# Deserialize a JSON object to an instance of NamedTestCaseVariableValueRequest
    #
    # @param json_object [String] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      case struct.type
      when "STRING"
        member = Vellum::NamedTestCaseStringVariableValueRequest.from_json(json_object: json_object)
      when "NUMBER"
        member = Vellum::NamedTestCaseNumberVariableValueRequest.from_json(json_object: json_object)
      when "JSON"
        member = Vellum::NamedTestCaseJSONVariableValueRequest.from_json(json_object: json_object)
      when "CHAT_HISTORY"
        member = Vellum::NamedTestCaseChatHistoryVariableValueRequest.from_json(json_object: json_object)
      when "SEARCH_RESULTS"
        member = Vellum::NamedTestCaseSearchResultsVariableValueRequest.from_json(json_object: json_object)
      when "ERROR"
        member = Vellum::NamedTestCaseErrorVariableValueRequest.from_json(json_object: json_object)
      when "FUNCTION_CALL"
        member = Vellum::NamedTestCaseFunctionCallVariableValueRequest.from_json(json_object: json_object)
      when "ARRAY"
        member = Vellum::NamedTestCaseArrayVariableValueRequest.from_json(json_object: json_object)
      when "AUDIO"
        member = Vellum::NamedTestCaseAudioVariableValueRequest.from_json(json_object: json_object)
      when "VIDEO"
        member = Vellum::NamedTestCaseVideoVariableValueRequest.from_json(json_object: json_object)
      when "IMAGE"
        member = Vellum::NamedTestCaseImageVariableValueRequest.from_json(json_object: json_object)
      when "DOCUMENT"
        member = Vellum::NamedTestCaseDocumentVariableValueRequest.from_json(json_object: json_object)
      else
        member = Vellum::NamedTestCaseStringVariableValueRequest.from_json(json_object: json_object)
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
        Vellum::NamedTestCaseStringVariableValueRequest.validate_raw(obj: obj)
      when "NUMBER"
        Vellum::NamedTestCaseNumberVariableValueRequest.validate_raw(obj: obj)
      when "JSON"
        Vellum::NamedTestCaseJSONVariableValueRequest.validate_raw(obj: obj)
      when "CHAT_HISTORY"
        Vellum::NamedTestCaseChatHistoryVariableValueRequest.validate_raw(obj: obj)
      when "SEARCH_RESULTS"
        Vellum::NamedTestCaseSearchResultsVariableValueRequest.validate_raw(obj: obj)
      when "ERROR"
        Vellum::NamedTestCaseErrorVariableValueRequest.validate_raw(obj: obj)
      when "FUNCTION_CALL"
        Vellum::NamedTestCaseFunctionCallVariableValueRequest.validate_raw(obj: obj)
      when "ARRAY"
        Vellum::NamedTestCaseArrayVariableValueRequest.validate_raw(obj: obj)
      when "AUDIO"
        Vellum::NamedTestCaseAudioVariableValueRequest.validate_raw(obj: obj)
      when "VIDEO"
        Vellum::NamedTestCaseVideoVariableValueRequest.validate_raw(obj: obj)
      when "IMAGE"
        Vellum::NamedTestCaseImageVariableValueRequest.validate_raw(obj: obj)
      when "DOCUMENT"
        Vellum::NamedTestCaseDocumentVariableValueRequest.validate_raw(obj: obj)
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
    # @param member [Vellum::NamedTestCaseStringVariableValueRequest] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def self.string(member:)
      new(member: member, discriminant: "STRING")
    end
    # @param member [Vellum::NamedTestCaseNumberVariableValueRequest] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def self.number(member:)
      new(member: member, discriminant: "NUMBER")
    end
    # @param member [Vellum::NamedTestCaseJSONVariableValueRequest] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def self.json(member:)
      new(member: member, discriminant: "JSON")
    end
    # @param member [Vellum::NamedTestCaseChatHistoryVariableValueRequest] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def self.chat_history(member:)
      new(member: member, discriminant: "CHAT_HISTORY")
    end
    # @param member [Vellum::NamedTestCaseSearchResultsVariableValueRequest] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def self.search_results(member:)
      new(member: member, discriminant: "SEARCH_RESULTS")
    end
    # @param member [Vellum::NamedTestCaseErrorVariableValueRequest] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def self.error(member:)
      new(member: member, discriminant: "ERROR")
    end
    # @param member [Vellum::NamedTestCaseFunctionCallVariableValueRequest] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def self.function_call(member:)
      new(member: member, discriminant: "FUNCTION_CALL")
    end
    # @param member [Vellum::NamedTestCaseArrayVariableValueRequest] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def self.array(member:)
      new(member: member, discriminant: "ARRAY")
    end
    # @param member [Vellum::NamedTestCaseAudioVariableValueRequest] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def self.audio(member:)
      new(member: member, discriminant: "AUDIO")
    end
    # @param member [Vellum::NamedTestCaseVideoVariableValueRequest] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def self.video(member:)
      new(member: member, discriminant: "VIDEO")
    end
    # @param member [Vellum::NamedTestCaseImageVariableValueRequest] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def self.image(member:)
      new(member: member, discriminant: "IMAGE")
    end
    # @param member [Vellum::NamedTestCaseDocumentVariableValueRequest] 
    # @return [Vellum::NamedTestCaseVariableValueRequest]
    def self.document(member:)
      new(member: member, discriminant: "DOCUMENT")
    end
  end
end