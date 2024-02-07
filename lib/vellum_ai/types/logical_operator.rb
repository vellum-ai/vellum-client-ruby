# frozen_string_literal: true

module Vellum
  # @type [LOGICAL_OPERATOR]
  LOGICAL_OPERATOR = {
    equals: "=",
    does_not_equal: "!=",
    less_than: "<",
    greater_than: ">",
    less_than_or_equal_to: "<=",
    greater_than_or_equal_to: ">=",
    contains: "contains",
    begins_with: "beginsWith",
    ends_with: "endsWith",
    does_not_contain: "doesNotContain",
    does_not_begin_with: "doesNotBeginWith",
    does_not_end_with: "doesNotEndWith",
    null: "null",
    not_null: "notNull",
    in_: "in",
    not_in: "notIn",
    between: "between",
    not_between: "notBetween"
  }.freeze
end
