class PartnersController < ApplicationController
  def new
    @partner = Partner.new
  end
end
