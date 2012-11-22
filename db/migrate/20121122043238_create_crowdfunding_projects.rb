class CreateCrowdfundingProjects < ActiveRecord::Migration
  def change
    create_table :crowdfunding_projects do |t|
      t.string :title
      t.text :description
      t.integer :money_needed_cents
      t.string :currency
      t.datetime :end_date

      t.timestamps
    end
  end
end
