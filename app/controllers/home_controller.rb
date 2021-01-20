# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @users = User.where('email LIKE ?', "%#{params[:search]}%")
  end
end
