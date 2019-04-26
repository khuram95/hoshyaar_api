class CommentController < ApplicationContoller
  
  def index
    render json: report.comments
  end

  def create
    current_user.comments.create! comment_params
  end

  def update
  end

  def destroy
  end

  private

  def report
    Report.find_by_id(params[:id])
  end

  def comment_params
    params.permit(:report_id, :text, :image)
  end
end