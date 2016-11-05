class TopController < ApplicationController
  before_action :authenticate_user!, only: :auth

  def index
  end

  def auth
  end
end
