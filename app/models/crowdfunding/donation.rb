require 'money'

module Crowdfunding
  class Donation < ActiveRecord::Base
    attr_accessible :currency, :gross_payment, :params, :payment_status, :processing_fee, :project_id, :txn_id

    serialize :params

    composed_of :gross_payment,
      :class_name => "Money",
      :mapping => [%w(gross_payment_cents cents), %w(currency currency_as_string)],
      :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
      :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }

    composed_of :processing_fee,
      :class_name => "Money",
      :mapping => [%w(processing_fee_cents cents), %w(currency currency_as_string)],
      :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
      :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }

  end
end
