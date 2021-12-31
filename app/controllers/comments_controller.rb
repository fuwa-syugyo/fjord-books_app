# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable

  # GET /comments or /comments.json
  def index
    @comments = @commentable.comments
  end

  # GET /comments/new
  def new
    @report = Report.find(params[:report_id])
    @book = Book.find(params[:book_id])
    @comment = Comment.new
  end

  # POST /comments or /comments.json
  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.save
    redirect_to @commentable, notice: t('views.common.your_comment_was_successfully_posted')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
