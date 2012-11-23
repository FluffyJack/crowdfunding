require 'money'

module Crowdfunding
  class Project < ActiveRecord::Base
    attr_accessible :currency, :description, :end_date, :money_needed, :title

    composed_of :money_needed,
      :class_name => "Money",
      :mapping => [%w(money_needed_cents cents), %w(currency currency_as_string)],
      :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
      :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }

    scope :current, lambda { where("end_date > ?", Time.zone.now) }

    def paypal_attributes(return_url, notify_url, amount)
      values = {
        business: Crowdfunding.paypal_email,
        cmd: '_xclick',
        return: return_url,
        item_name: "Donation to Fillim Project: #{title}",
        item_number: id,
        amount: amount,
        notify_url: notify_url
      }
    end
  end
end
