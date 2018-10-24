class BackendController < ApplicationController

  def show_user
    @users = User.all
    render 'show_user'
  end
  def show_statistics
    @users = User.where("created_at > ? AND created_at < ?", Time.now.beginning_of_month, Time.now.end_of_month)
    render 'statistics'
  end

end
