class UsersController < ApplicationController
	def show
  		@user = User.find(params[:id])
  		@problemSolved= Submission.where('user_id=? and status="1"',params[:id] )
  		@problemSubmitted=Submission.where('user_id=?', params[:id])
	end
end
