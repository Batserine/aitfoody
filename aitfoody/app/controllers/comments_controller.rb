class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_revarticle, only: [:create]
  before_action :authenticate_user!, except: [:index, :show]
  # validates_presence_of :comment
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    # @comment = @revarticle.comments.new(comment_params)
    #  @comment.user = current_user
    # @comment.save


      respond_to do |format|
        puts '---comment_params---'
        if @revarticle.comments.create(comment_params.merge(user_id: current_user.id))
          format.html { redirect_to @revarticle, notice: 'Comment was successfully created.' }
          format.json { render :show, status: :created, location: @revarticle }
        else
          format.html { render :new , notice: 'Comment cannot create.'}
          format.json { render json: @revarticle.errors, status: :unprocessable_entity }
        end
      end
    end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_revarticle
      @revarticle = Revarticle.find(params[:revarticle_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      # params[:comment][:user_id] = 1
      # params.require(:comment).permit(:comment,:user_id)
      params.require(:comment).permit(:comment,:rating)
    end
end
