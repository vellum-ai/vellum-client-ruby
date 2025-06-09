# frozen_string_literal: true
require_relative "metadata_filter_rule_combinator"
require_relative "metadata_filter_rule_request"
require_relative "logical_operator"
require "ostruct"
require "json"

module Vellum
# A deprecated pattern for filtering on metadata. Please use MetadataFilters
#  instead.
  class MetadataFilterConfigRequest
  # @return [Vellum::MetadataFilterRuleCombinator] 
    attr_reader :combinator
  # @return [Boolean] 
    attr_reader :negated
  # @return [Array<Vellum::MetadataFilterRuleRequest>] 
    attr_reader :rules
  # @return [String] 
    attr_reader :field
  # @return [Vellum::LogicalOperator] 
    attr_reader :operator
  # @return [String] 
    attr_reader :value
  # @return [OpenStruct] Additional properties unmapped to the current class definition
    attr_reader :additional_properties
  # @return [Object] 
    attr_reader :_field_set
    protected :_field_set

    OMIT = Object.new

    # @param combinator [Vellum::MetadataFilterRuleCombinator] 
    # @param negated [Boolean] 
    # @param rules [Array<Vellum::MetadataFilterRuleRequest>] 
    # @param field [String] 
    # @param operator [Vellum::LogicalOperator] 
    # @param value [String] 
    # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
    # @return [Vellum::MetadataFilterConfigRequest]
    def initialize(combinator: OMIT, negated: OMIT, rules: OMIT, field: OMIT, operator: OMIT, value: OMIT, additional_properties: nil)
      @combinator = combinator if combinator != OMIT
      @negated = negated if negated != OMIT
      @rules = rules if rules != OMIT
      @field = field if field != OMIT
      @operator = operator if operator != OMIT
      @value = value if value != OMIT
      @additional_properties = additional_properties
      @_field_set = { "combinator": combinator, "negated": negated, "rules": rules, "field": field, "operator": operator, "value": value }.reject do | _k, v |
  v == OMIT
end
    end
# Deserialize a JSON object to an instance of MetadataFilterConfigRequest
    #
    # @param json_object [String] 
    # @return [Vellum::MetadataFilterConfigRequest]
    def self.from_json(json_object:)
      struct = JSON.parse(json_object, object_class: OpenStruct)
      parsed_json = JSON.parse(json_object)
      combinator = parsed_json["combinator"]
      negated = parsed_json["negated"]
      rules = parsed_json["rules"]&.map do | item |
  item = item.to_json
  Vellum::MetadataFilterRuleRequest.from_json(json_object: item)
end
      field = parsed_json["field"]
      operator = parsed_json["operator"]
      value = parsed_json["value"]
      new(
        combinator: combinator,
        negated: negated,
        rules: rules,
        field: field,
        operator: operator,
        value: value,
        additional_properties: struct
      )
    end
# Serialize an instance of MetadataFilterConfigRequest to a JSON object
    #
    # @return [String]
    def to_json
      @_field_set&.to_json
    end
# Leveraged for Union-type generation, validate_raw attempts to parse the given
#  hash and check each fields type against the current object's property
#  definitions.
    #
    # @param obj [Object] 
    # @return [Void]
    def self.validate_raw(obj:)
      obj.combinator&.is_a?(Vellum::MetadataFilterRuleCombinator) != false || raise("Passed value for field obj.combinator is not the expected type, validation failed.")
      obj.negated&.is_a?(Boolean) != false || raise("Passed value for field obj.negated is not the expected type, validation failed.")
      obj.rules&.is_a?(Array) != false || raise("Passed value for field obj.rules is not the expected type, validation failed.")
      obj.field&.is_a?(String) != false || raise("Passed value for field obj.field is not the expected type, validation failed.")
      obj.operator&.is_a?(Vellum::LogicalOperator) != false || raise("Passed value for field obj.operator is not the expected type, validation failed.")
      obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
    end
  end
end