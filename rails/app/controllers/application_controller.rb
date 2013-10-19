class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate

	attr_reader :user

	def authenticate
		params.require(:user_id)
		@user = User.where(id: params[:user_id]).first
		render :text => "unauthorized", :status => :unauthorized unless user
	end
end
