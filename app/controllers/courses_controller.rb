class CoursesController < ApplicationController
  before_filter :authenticate_user!, :except => ['get_course_content']
  def index
    @courses = Course.where(:owner_id => current_user.id, :deleted_date => nil)

  end

  def new
    @course = Course.new
    o = [(0...9),('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    @course.public_id = (0...16).map{ o[rand(o.length)] }.join
    dup_course_id = Course.find_by public_id: @course.public_id
    while( !dup_course_id.nil? )
      @course.public_id = (0...16).map{ o[rand(o.length)] }.join
      dup_course_id = Course.find_by public_id: @course.public_id
    end
    @course.owner_id = current_user.id
    @course.active = true
    
    @course_revision = CourseRevision.new
    @course_revision.course = @course
  end

  def upload
    @course = Course.create( user_params )
  end

  private

  # Use strong_parameters for attribute whitelisting

  def course_params
    params.require(:course).permit()
  end

end
