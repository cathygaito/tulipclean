class PreusersController < ApplicationController
  def new
  end

  def create
  end

  private

  def preuser_params
  	params.require(:preuser).permit(:id, :email, :referral_code, :referrer_id, :created_at, :updated_at)
  end
end
