class PartnersController < ApplicationController
  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def partner_params
    params.require(:partner).permit(:institution_name, :institution_category_id)
  end

end
