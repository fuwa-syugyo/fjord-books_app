class CommentsController < ApplicationController
  before_action :set_report
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = @report.comments
    # @author = User.find(@comment.user_id)
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @report = Report.find(params[:report_id])
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @report = Report.find(params[:report_id])
    @comment = Comment.find(params[:id])
  end

  # POST /comments or /comments.json
  def create
    @comment = @report.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to [@report, @comment], notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    if @comment.update(comment_params)
      redirect_to report_comments_path, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    redirect_to @report, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_report
      @report = Report.find(params[:report_id])
    end
    
end
