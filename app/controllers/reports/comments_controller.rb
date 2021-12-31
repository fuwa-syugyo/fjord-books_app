# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_commentable
    @commentable = Report.find(params[:report_id])
  end
end
