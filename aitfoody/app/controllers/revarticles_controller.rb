class RevarticlesController < ApplicationController
  load_and_authorize_resource
  before_action :set_revarticle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /revarticles
  # GET /revarticles.json
  def index
    # show approved articles only
    # @revarticles = Revarticle.where("approved = ?" , true)
    @revarticles = (params[:term].blank?) ? Revarticle.where("approved = ?" , true) : Revarticle.where(id: params[:term].split(",")).where("approved = ?" , true)

    respond_to do |format|
      format.html do
        render 'revarticles/index'
      end
      format.json {
        render json: Revarticle.where('title ILIKE :search OR content ILIKE :search',search: "%#{params[:term]}%" ).where('approved = ?', true).select('id,title as name')
      }
    end
  end

  # GET /revarticles/1
  # GET /revarticles/1.json
  def show
    sql = "SELECT  firstname,lastname,email,comment, comments.updated_at,comments.id FROM comments
                 INNER JOIN review_comments ON review_comments.comment_id = comments.id
                 INNER JOIN revarticles ON revarticles.id = review_comments.revarticle_id
                 INNER JOIN users ON users.id = comments.user_id WHERE review_comments.revarticle_id = "+params[:id]
    @comments = ActiveRecord::Base.connection.exec_query(sql).to_hash
    puts @comments
    # @comments = Comment.joins(:revarticles).where(review_comments: {revarticle_id: 7}).joins(:user).includes(:user).select('title,content,rating,price,ingredient,location,firstname,comment')
  end

  # GET /revarticles/new
  def new
    @typefood = Typefood.all
    @revarticle = Revarticle.new
  end

  # GET /revarticles/1/edit
  def edit
    @typefood = Typefood.all
  end

  # POST /revarticles
  # POST /revarticles.json
  def create
    @typefood = Typefood.all
    @revarticle = Revarticle.new(revarticle_params)
    @revarticle.user = current_user
    puts '----params---'
    puts  params[:typefood]
    @revarticle.typefood_id = params[:typefood]
    respond_to do |format|
      if @revarticle.save
        format.html { redirect_to @revarticle, notice: 'Revarticle was successfully created.' }
        format.json { render :show, status: :created, location: @revarticle }
      else
        format.html { render :new }
        format.json { render json: @revarticle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /revarticles/1
  # PATCH/PUT /revarticles/1.json
  def update
    @revarticle.user = current_user
    puts '----params---'
    puts  params[:typefood]
    # @revarticle.typefood_id = params[:typefood]
    respond_to do |format|

      if @revarticle.update(revarticle_params.merge(typefood_id: params[:typefood].to_i))
        format.html { redirect_to @revarticle, notice: 'Revarticle was successfully updated.' }
        format.json { render :show, status: :ok, location: @revarticle }
      else
        format.html { render :edit }
        format.json { render json: @revarticle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /revarticles/1
  # DELETE /revarticles/1.json
  def destroy
    @revarticle.destroy
    respond_to do |format|
      format.html { redirect_to revarticles_url, notice: 'Revarticle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_revarticle
      @revarticle = Revarticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def revarticle_params
      # puts '----params---'
      # puts  params[:typefood]
      # params[:revarticle][:typefood] = '9'
      params.require(:revarticle).permit(:title, :content, :rating, :price, :ingredient, :location,:img_path,:remove_img_path)
    end
end
