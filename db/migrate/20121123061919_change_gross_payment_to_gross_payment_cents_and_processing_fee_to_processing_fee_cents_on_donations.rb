class ChangeGrossPaymentToGrossPaymentCentsAndProcessingFeeToProcessingFeeCentsOnDonations < ActiveRecord::Migration
  def change
    rename_column :crowdfunding_donations, :gross_payment, :gross_payment_cents
    rename_column :crowdfunding_donations, :processing_fee, :processing_fee_cents
  end
end
