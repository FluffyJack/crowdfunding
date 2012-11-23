require "crowdfunding/engine"

module Crowdfunding
  mattr_accessor :paypal_email
  mattr_accessor :paypal_sandbox
  mattr_accessor :domain_without_ending_slash
end
