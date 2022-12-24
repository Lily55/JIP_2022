class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :require_authentication, only: %i[index]
  before_action :check_moder, only: %i[create new]
  before_action :check_owner, only: %i[edit update destroy]


  helper_method :owner

  def owner
    current_user.id == @post.user_id
  end

  # GET /posts or /posts.json
  def index
    
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)

    if current_user.full? || current_user.admin?
      @posts = @q.result(distinct: true)
    elsif current_user.baby?
      @posts = @q.result(distinct: true).select{ |post| post.forwhom == 'baby&full' || post.forwhom == 'all'}
    else
      @posts = @q.result(distinct: true).select { |post| post.forwhom == 'all' }
    end
  
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
      @post = Post.new(post_params)

      respond_to do |format|
        if @post.save
          format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
          format.json { render :show, status: :created, location: @post }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :summary, :body, :user_id, :forwhom)
    end
    

    def check_moder
      redirect_to posts_path unless current_user.moder? || current_user.admin?
    end

    def check_owner
      redirect_to posts_path unless current_user.admin? || current_user.id == @post.user_id
    end


end
