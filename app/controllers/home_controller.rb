class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
        @user = find_or_create_user_from_email(current_user.email)
        @courses = Course.where(:owner_id => current_user.id, :deleted_date => nil, :active => true)
        
        @courses_as_developer = []
        @reviews_i_need_to_complete = []
        @assigned_comments = []
        
        #@courses_as_developer = Developer.where(["user_id = ?", @user.id ])
        #@reviews_i_need_to_complete = Review.where(["user_id = ?", @user.id ])
        #@assigned_comments = Comment.where(["assigned_to_id = ?", @user.id])

        render "home/index"
  end
end
