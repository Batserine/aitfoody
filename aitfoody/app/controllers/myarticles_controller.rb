class MyarticlesController < ApplicationController
  before_action :authenticate_user!, except: [:typefood, :user]
  def index
      @revarticles = Revarticle.where("user_id = ?" , current_user)
      # @revarticles = Revarticle.all
      render :index
  end
  # GET /myarticles/user/:type_id
  def user
    @user        = User.find(params[:user_id])
    @revarticles =  Revarticle.where(user_id: params[:user_id]).where("approved = ?" , true)
    render :user
  end
  # GET /myarticles/type/:food
  def typefood
    @title       =  params[:food]
    @title       =  @title.slice(0,1).capitalize + @title.slice(1..-1)
    typefood   = Typefood.where("name ILIKE ?", "%#{params[:food]}%")
    if (params[:food] == 'food')
      where_sql = ''
      typefood.each do |type|
        where_sql = where_sql+"OR typefood_id = #{type.id} "
      end
      where_sql =  where_sql.slice(3..-1)
      @revarticles =  Revarticle.where(where_sql).where("approved = ?" , true)
    else
      @revarticles =  Revarticle.where(typefood_id: typefood.ids).where("approved = ?" , true)
    end
  end
end
