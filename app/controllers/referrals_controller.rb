class ReferralsController < ApplicationController
  def index
  end

  def new
    @referrals = Referral.new
  end

end
