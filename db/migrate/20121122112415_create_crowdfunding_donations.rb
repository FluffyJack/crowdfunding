class CreateCrowdfundingDonations < ActiveRecord::Migration
  def change
    create_table :crowdfunding_donations do |t|
      t.text :params
      t.string :txn_id
      t.string :payment_status
      t.integer :project_id
      t.integer :gross_payment
      t.integer :processing_fee
      t.string :currency

      t.timestamps
    end
  end
end
