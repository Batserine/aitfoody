class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  def ban_user
    puts 'ban_user_cal'
    puts  params[:user_id]
    @user = User.find(params[:user_id])
    respond_to do |format|
      if  @user.update_attribute(:ban_status, params[:ban_status])
        format.json { render :show, status: :ok, location: @revarticle }
      else
        format.json { render json: @revarticle.errors, status: :unprocessable_entity }
      end
    end
  end
  def create_chart_sex
      selected_month = params[:month].to_i
      selected_year  = params[:year].to_i
      today =  DateTime.new(selected_year,selected_month,1,0,0,0)
      # today = Date.today # =>  23 Oct 2018
      date_begin =  today.beginning_of_month
      date_end   =  today.end_of_month
      render json:  User.where("created_at > ? AND created_at < ?", date_begin, date_end).group(:sex).count
  end
  def create_chart_createdAt
    selected_month = params[:month].to_i
    selected_year  = params[:year].to_i
    today =  DateTime.new(selected_year,selected_month,1,0,0,0)
    # today = Date.today # =>  23 Oct 2018
    date_begin =  today.beginning_of_month
    date_end   =  today.end_of_month
    render json:  User.where("created_at > ? AND created_at < ?", date_begin, date_end).group_by_day(:created_at).count
  end
end
