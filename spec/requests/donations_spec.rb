require 'spec_helper'

describe "Donations Workflow" do
  describe "Donation Form" do
    it "should display a form that allows me to choose a donation amount" do
      @project = Crowdfunding::Project.create(title: "Project One", description: "The greatest crowdfunding project ever", money_needed: "10000", end_date: 3.weeks.from_now)

      visit("/crowdfunding/projects/#{@project.id}")
      assert_have_selector 'form'
      assert_have_selector 'form input#amount'
    end

    it "should take me to the donation confirmation page" do
      @project = Crowdfunding::Project.create(title: "Project One", description: "The greatest crowdfunding project ever", money_needed: "10000", end_date: 3.weeks.from_now)

      visit("/crowdfunding/projects/#{@project.id}")
      fill_in "amount", :with => "12.34"
      click_button "Donate Now"
      response.should contain("$12.34 USD")
    end

    it "should allow me to make the payment via PayPal on the confirmation page" do
      @project = Crowdfunding::Project.create(title: "Project One", description: "The greatest crowdfunding project ever", money_needed: "10000", end_date: 3.weeks.from_now)

      visit("/crowdfunding/projects/#{@project.id}")
      fill_in "amount", :with => "12.34"
      click_button "Donate Now"

      assert_have_selector 'form[action="https://www.sandbox.paypal.com/cgi-bin/websrc"]'
      assert_have_selector 'input[name="business"]'
      assert_have_selector 'input[name="cmd"]'
      assert_have_selector 'input[name="return"]'
      assert_have_selector 'input[name="item_name"]'
      assert_have_selector 'input[name="item_number"]'
      assert_have_selector 'input[name="amount"]'
    end
  end
end