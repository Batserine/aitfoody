class MyarticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
      @revarticles = Revarticle.where("user_id = ?" , current_user)
      # @revarticles = Revarticle.all
      render :index
  end
  # GET /revarticles/user/:id
  def user
    @user        = User.find(params[:user_id])
    @revarticles =  Revarticle.where(user_id: params[:user_id]).where("approved = ?" , true)
    render :user
  end
end
