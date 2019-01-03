# frozen_string_literal: true

module Api
  module V1
    # Test Controller
    class HomesController < ApplicationController
      def index
        render json: {hello: "hello word"}
      end
    end
  end
end
