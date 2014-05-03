class CourseRevision < ActiveRecord::Base

    belongs_to :course, foreign_key: :course_id
    has_many :reviews
end
