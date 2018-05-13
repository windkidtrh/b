class ApplicationController < ActionController::Base
  require 'rubypython'
  protect_from_forgery with: :exception
  include SessionsHelper
  # include PointsHelper

  private
      # 确保用户已登录

      def logged_in_user
        unless logged_in?
          store_location
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
      end

      def real_user
        @token = request.headers[:token]
        return false unless cookies[:remember_token] == @token and current_user
      end

end
