module Api
  module V1
    class VerifySchoolsController < ApplicationController

      def create
        user.verified_school_datas.create!  school_detail_id: params[:school_detail_id], verifed_date: create_date
        head :ok
      end

      private

      def user
        User.find_by_id(params[:user_id])
      end

      def create_date
        DateTime.now.utc.in_time_zone('Asia/Karachi')
      end
    end
  end
end