require 'spec_helper'

describe "Project Workflow" do

  describe "Home" do
    it "should show all the existing projects when I visit the project listing page" do
      Crowdfunding::Project.create(title: "Project One", description: "The greatest crowdfunding project ever", money_needed: "10000", end_date: 3.weeks.from_now)
      Crowdfunding::Project.create(title: "Project Two", description: "The greatest crowdfunding project ever", money_needed: "10000", end_date: 3.weeks.from_now)
      Crowdfunding::Project.create(title: "Project Three", description: "The greatest crowdfunding project ever", money_needed: "10000", end_date: 3.weeks.from_now)

      visit('/crowdfunding')
      response.should contain("Project One")
      response.should contain("Project Two")
      response.should contain("Project Three")
    end

    it "should not show projects that have expired" do
      Crowdfunding::Project.create(title: "Project One", description: "The greatest crowdfunding project ever", money_needed: "10000", end_date: 3.weeks.from_now)
      Crowdfunding::Project.create(title: "Project Two", description: "The greatest crowdfunding project ever", money_needed: "10000", end_date: 3.weeks.from_now)
      Crowdfunding::Project.create(title: "Project Three", description: "The greatest crowdfunding project ever", money_needed: "10000", end_date: 3.weeks.ago)

      visit('/crowdfunding')
      response.should contain("Project One")
      response.should contain("Project Two")
      response.should_not contain("Project Three")
    end

    it "should show an excerpt of the description" do
      @project = Crowdfunding::Project.create(title: "Project One", description: "This is a really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really long description", money_needed: "10000", end_date: 3.weeks.from_now)

      visit('/crowdfunding')
      response.should contain("This is a really really really really really really really really really really really really really really really really really really really really really really really really really really reall...")
    end

    it "should have a link on each project to the project's page" do
      @project1 = Crowdfunding::Project.create(title: "Project One", description: "The greatest crowdfunding project ever", money_needed: "10000", end_date: 3.weeks.from_now)
      @project2 = Crowdfunding::Project.create(title: "Project Two", description: "The greatest crowdfunding project ever", money_needed: "10000", end_date: 3.weeks.from_now)
      @project3 = Crowdfunding::Project.create(title: "Project Three", description: "The greatest crowdfunding project ever", money_needed: "10000", end_date: 3.weeks.from_now)

      visit('/crowdfunding')
      click_link "View Project"
      response.should be_successful
    end
  end

  describe "Details" do
    it "should show all the details" do
      @project = Crowdfunding::Project.create(title: "Project One", description: "This is a really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really really long description", money_needed: "10000", end_date: 3.weeks.from_now)

      visit("/crowdfunding/projects/#{@project.id}")
      response.should contain(@project.title)
      response.should contain(@project.description)
      response.should contain("$10,000 goal")
      response.should contain("Launched: #{@project.created_at.strftime('%b %e, %Y')}")
      response.should contain("Funding Ends: #{@project.end_date.strftime('%b %e, %Y')}")
    end
  end

end