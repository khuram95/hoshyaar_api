class Api::V1::ReportReactionsController < ApplicationController
  def create
    if (report_reaction.count == 0)
      new_reaction = current_user.report_reactions.create! reaction_params
      render json: Report.find_by_id(params[:report_id]), each_serializer: ReportSerializer
    else
      if (params[:is_agree] !='')
        update_report = report_reaction.first.update! is_agree: params[:is_agree]
        render json: Report.find_by_id(params[:report_id]), each_serializer: ReportSerializer
      else
        report_reaction.delete_all
        render json: Report.find_by_id(params[:report_id]), each_serializer: ReportSerializer
      end
    end
  end

  private

  def current_user
    User.find_by_id(params[:user_id])
  end

  def reaction_params
    params.permit(:report_id, :is_agree)
  end

  def report_reaction
    ReportReaction.where(user_id: params[:user_id], report_id: params[:report_id])
  end
end