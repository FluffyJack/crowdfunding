require 'spec_helper'

describe Crowdfunding::DonationsController do
  describe "POST create" do
    it "should create a donation" do
      @project = Crowdfunding::Project.create(title: "Project One", description: "The greatest crowdfunding project ever", money_needed: "10000", end_date: 3.weeks.from_now)

      lambda {
        post :create, :payment_status => "Completed", :item_name => @project.title, :item_number => @project.id, :mc_gross => "10.00", :mc_fee => "0.49", :txn_id => "221123531", :mc_currency => "USD", :use_route => :crowdfunding
      }.should change(Crowdfunding::Donation, :count).by(1)
      response.should be_successful
    end
  end
end