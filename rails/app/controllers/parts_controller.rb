class PartsController < ApplicationController
	respond_to :json

	before_filter :verify_ownership, :only => [:update, :destory, :exchange]

	def index
		respond_with Part.where(user_id: user.id)
	end

	def show
		respond_with Part.where(user_id: user.id, id: params[:id]).first
	end

	def create
		respond_with Part.create(part_params.merge(user: user))
	end

	def update
		respond_with Part.update(params[:id], params[:part])
	end

	def destroy
		respond_with Part.destroy(params[:id])
	end

	def exchange
		respond_with Part.update(params[:id], user_id: params[:taker_id])
	end

 	def part_params
    params.require(:part).permit(:name, :title)
  end

  def verify_ownership
		part = Part.where(user_id: user.id, id: params[:id]).first
		render :text => "unauthorized", :status => :unauthorized unless part
	end
end