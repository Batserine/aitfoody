class MyarticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
      @revarticles = Revarticle.where("user_id = ?" , current_user)
      # @revarticles = Revarticle.all
      render :index
  end
end
