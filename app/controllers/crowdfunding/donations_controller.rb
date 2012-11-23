require_dependency "crowdfunding/application_controller"

module Crowdfunding
  class DonationsController < ApplicationController

    def new
      @project = Project.find(params[:project_id])
    end

    def create
      Donation.create(:params => params, :gross_payment => params[:mc_gross], :currency => params[:mc_currency], :payment_status => params[:payment_status], :processing_fee => params[:mc_fee], :project_id => params[:item_number], :txn_id => params[:tnx_id])
      render :nothing => true
    end

  end
end
