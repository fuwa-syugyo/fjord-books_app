# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_commentable

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_commentable
    @commentable = Book.find(params[:book_id])
  end
end
