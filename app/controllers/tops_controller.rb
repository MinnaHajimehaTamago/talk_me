class TopsController < ApplicationController
  def index
    redirect_to signs_path if user_signed_in?
  end
end
